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
    
    /// readRecord() is currently fetching all records of type Teacher
    @MainActor
    public func readRecord() async -> [Teacher] {
        var teachersList: [Teacher] = []
        do {
            let predicate = NSPredicate(value: true)
            let query = CKQuery(recordType: "Teacher", predicate: predicate)
            let records = try await publicDatabase.records(matching: query).matchResults
            
            for record in records {
                let recordResultTuple = try record.1.get()
                let decodedRecord = try CloudKitRecordDecoder().decode(Teacher.self, from: recordResultTuple)
                print(decodedRecord.cloudKitIdentifier)
                teachersList.append(decodedRecord)
            }
            
        } catch(let error) {
           // something went wrong
            print("Error while executing readRecord method: \(error.localizedDescription)")
        }
        return teachersList
    }
    
    @MainActor
    public func updateRecord() async {
//        do {
//
//        } catch(let error) {
//            print("Error while executing updateRecord method: \(error.localizedDescription)")
//
//        }
    }
    
    @MainActor
    public func deleteRecord() async {
//        do {
//
//        } catch(let error) {
//            print("Error while executing deleteRecord method: \(error.localizedDescription)")
//
//        }
    }
    
}
