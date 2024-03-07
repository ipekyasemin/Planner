//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by yasemin ipek on 1.03.2024.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation
class ToDoListItemViewViewModel: ObservableObject {
    init(){}
    
    func toggleIsDone(item: ToDoListItem){
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        
        db.collection("todos")
            .document(uid)
            .setData(itemCopy.asDictionary())
    }
}
