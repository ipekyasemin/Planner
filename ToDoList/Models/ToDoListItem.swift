//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by yasemin ipek on 15.02.2024.
//

import Foundation

struct ToDoListItem: Codable, Identifiable{
    let id:String
    let userId:String
    let title:String
    let dueDate:TimeInterval
    let createdDate:TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state:Bool){
        isDone = state
    }
}
  
