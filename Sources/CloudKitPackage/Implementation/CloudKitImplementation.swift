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
    
    public func readRecord() {
        print(#function)
    }
    
    public func updateRecord() {
        print(#function)
    }
    
    public func deleteRecord() {
        print(#function)
    }
    
}
