//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by yasemin ipek on 15.02.2024.
//

import FirebaseAuth
import Foundation


class MainViewViewModel:ObservableObject {
    @Published var currenUserId:String = ""
    
    init () {
        Auth.auth().addStateDidChangeListener {[weak self] _,user in
            DispatchQueue.main.async {
                self?.currenUserId = user?.uid ?? ""
            }
        }
    }
    public var isSignedIn: Bool {
        return Auth.auth().currentUser?.uid != nil
    }
}

