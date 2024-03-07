//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by yasemin ipek on 15.02.2024.
//
import FirebaseFirestore
import Foundation

class ToDoListViewViewModel:ObservableObject {
    @Published var showinNewItemView = false
    
    private let userId: String
    
    init(userId:String){
        self.userId = userId
    }
    
    
    func delete(id:String){
        let db = Firestore.firestore()
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
        
    }
}
