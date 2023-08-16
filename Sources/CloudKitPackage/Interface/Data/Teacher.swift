//
//  File.swift
//  
//
//  Created by João Dall Agnol on 16/08/23.
//

import Foundation

public struct Teacher: CustomCloudKitCodable {
    public var cloudKitSystemFields: Data?
    public var name: String
    public var age: String
    public var active: Bool

    public init(name: String, age: String, active: Bool) {
        self.name = name
        self.age = age
        self.active = active
    }
}
