//
//  File.swift
//  
//
//  Created by João Dall Agnol on 16/08/23.
//

import Foundation

public protocol CloudKitProtocol {
    func createRecord(teacher: Teacher) async
    func readRecord()
    func updateRecord()
    func deleteRecord()
}
