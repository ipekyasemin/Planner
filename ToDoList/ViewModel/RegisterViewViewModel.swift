//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by yasemin ipek on 15.02.2024.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewViewModel:ObservableObject {
    @Published var name = ""
    @Published var userMail = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    
    init(){}
    
    func register(){
        guard validate () else {
            return
        }
        Auth.auth().createUser(withEmail:userMail , password: password){
            [weak self] result, error in
            
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(userId: userId,email: result?.user.email)
        }
        
    }
    
    func insertUserRecord (userId:String,email:String?){
        let newUser = User(id: userId, name: "name", email:email!, joined:Date().timeIntervalSince1970)
        
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .setData(newUser.asDictionary())
    }
    
    
    private func validate() -> Bool{
        
        errorMessage = ""
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !userMail.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Lütfen tüm alanları doldurunz!"
            return false
        }
        guard userMail.contains("@") && userMail.contains(".") else {
            errorMessage = "Lütfen geçerli bir email giriniz"
            
            return false
        }
        guard password.count >= 6 else {
            errorMessage = "Lütfen 6 veya daha fazla karakterli bir şifre belirleyiniz"
            return false
        }
        return true
        
    }
    
}
