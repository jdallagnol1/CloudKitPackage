//
//  File.swift
//  
//
//  Created by João Dall Agnol on 16/08/23.
//

import Foundation

public struct Teacher: Identifiable, Hashable, CustomCloudKitCodable {
    public var cloudKitSystemFields: Data?
    public var id: Int
    public var name: String
    public var age: String
    public var active: Bool

    public init(id: Int, name: String, age: String, active: Bool) {
        self.id = id
        self.name = name
        self.age = age
        self.active = active
    }
}
