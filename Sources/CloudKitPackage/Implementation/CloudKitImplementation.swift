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
            let reference = CKRecord(recordType: "Teacher")
            let record = try await publicDatabase.record(for: reference.recordID)
            
//            let encodedTeachersArray = try await publicDatabase.allRecordZones()
            print(record)
            // record is now a CKRecord you can upload to CloudKit
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
