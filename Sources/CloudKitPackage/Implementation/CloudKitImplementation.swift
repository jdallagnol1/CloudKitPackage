import CloudKit

public struct CloudKitImplementation: CloudKitProtocol {
    
    public private(set) var text = "Hello, World!"
    private let publicDatabase = CKContainer(identifier: "iCould.br.org.eldorado.monalisa-ck-spike").publicCloudDatabase
    
    public init() {
        print("publicDatabase.className -> \(publicDatabase.className)")
    }
    
    public func createRecord() {
        print(#function)
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
