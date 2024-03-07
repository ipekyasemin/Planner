//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by yasemin ipek on 15.02.2024.
//

import FirebaseCore
import SwiftUI


@main
struct ToDoListApp: App{
    
    init() {
        FirebaseApp.configure()
    }
     
    var body: some Scene {
        WindowGroup {
           MainView()
        }
    }
}
