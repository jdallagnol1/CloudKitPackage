//
//  File.swift
//  
//
//  Created by João Dall Agnol on 16/08/23.
//

import Foundation
import CloudKit

public struct Teacher: CustomCloudKitCodable {
    public var cloudKitSystemFields: Data?
    public var recordName: String
    public var name: String
    public var age: String
    public var active: Bool

    public init(recordName: String, name: String, age: String, active: Bool) {
        self.recordName = recordName
        self.name = name
        self.age = age
        self.active = active
    }
}
