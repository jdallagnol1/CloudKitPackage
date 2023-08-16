import CloudKit

public struct CloudKitImplementation {
    public private(set) var text = "Hello, World!"
    private let publicDatabase = CKContainer(identifier: "iCould.br.org.eldorado.monalisa-ck-spike").publicCloudDatabase
    
    public init() {
        print("publicDatabase.className -> \(publicDatabase.className)")
    }
    
    func createRecord() {
        print(#function)
    }
    
    func readRecord() {
        print(#function)
    }
    
    func updateRecord() {
        print(#function)
    }
    
    func removeRecord() {
        print(#function)
    }
    
}
