//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by yasemin ipek on 15.02.2024.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewViewModel:ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init(){}
    func save(){
        
        guard canSave else {
            return
        }
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }

        let newItemId = UUID()
        let newItem = ToDoListItem(
            id:newItemId.uuidString,
            userId:uid,
            title:title,
            dueDate:dueDate.timeIntervalSince1970,
            createdDate:Date().timeIntervalSince1970,
            isDone: false
        )
        
        let db = Firestore.firestore()
        db
            .collection("todos").document(uid).collection(newItem.id)
            .addDocument(data: newItem.asDictionary())
             
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86400) else{
            return false
            
        }
        return true
    }
    
}
