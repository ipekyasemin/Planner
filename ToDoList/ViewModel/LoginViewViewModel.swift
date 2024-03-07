//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by yasemin ipek on 15.02.2024.
//
import FirebaseAuth
import Foundation

class LoginViewViewModel :ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){}
    var isLogged = false;

    func login()->Bool{
        guard validate() else {
            return false
        }
        Auth.auth().signIn(withEmail:email , password:password, completion: { result, error in
            if(result != nil){
                self.isLogged = true
            }else{
                self.isLogged = false
            }
        })
        return self.isLogged
    }
    func validate()->Bool{
        
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
                
        else {
            errorMessage = "Lütfen tüm alanları doldurun"
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Lütfen geçerli bir email giriniz"
            return false
        }
        return true
        
    }
    
}

