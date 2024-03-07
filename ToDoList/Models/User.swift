//
//  User.swift
//  ToDoList
//
//  Created by yasemin ipek on 15.02.2024.
//

import Foundation

struct User :Codable {
    let id:String
    let name:String
    let email:String
    let joined:TimeInterval
}
