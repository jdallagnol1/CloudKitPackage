import CloudKit

public struct CloudKitImplementation: CloudKitProtocol {
    
    public private(set) var text = "Hello, World!"
    private let publicDatabase = CKContainer.default().publicCloudDatabase
    
    public init() {
        print("publicDatabase.className -> \(publicDatabase.className)")
    }
    
    @MainActor
    public func createRecord(teacher: Teacher) async {
        do {
            let encodedTeacher = try CloudKitRecordEncoder().encode(teacher)
            // record is now a CKRecord you can upload to CloudKit
            try await publicDatabase.save(encodedTeacher)
        } catch(let error) {
           // something went wrong
            print("Error while executing createRecord method: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    public func readRecord() async {
        do {
            let predicate = NSPredicate(value: true)
            let query = CKQuery(recordType: "Teacher", predicate: predicate)
            let records = try await publicDatabase.records(matching: query).matchResults
            
            var teachersList: [Teacher] = []
            for record in records {
                let recordResultTuple = try record.1.get()
                let decodedRecord = try CloudKitRecordDecoder().decode(Teacher.self, from: recordResultTuple)
                teachersList.append(decodedRecord)
            }
            print(teachersList)
        } catch(let error) {
           // something went wrong
            print("Error while executing readRecord method: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    public func updateRecord() async {
        print(#function)
    }
    
    @MainActor
    public func deleteRecord() async {
        print(#function)
    }
    
}
