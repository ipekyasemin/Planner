//
//  LoginView.swift
//  ToDoList
//
//  Created by yasemin ipek on 15.02.2024.
//

import SwiftUI

struct LoginView: View {
   @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationStack {
            
                ZStack {
                    Image("kus")
                        .resizable()
                        .frame(width: 150,height: 150)
                    Text("PLANNER")
                        .font(.system(size:30))
                        .bold()
                        .padding(.top,30)
                }.padding(.top,100)
            
           
            Form {
    if !viewModel.errorMessage.isEmpty{
        Text(viewModel.errorMessage)
            .foregroundColor(.red)
                }
                TextField("Email Adresiniz",text: $viewModel.email)
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                SecureField("Şifreniz",text: $viewModel.password)
                    .autocorrectionDisabled()
            }
            .frame(height: 200)
            
            BigButtonView(title: "Giriş Yap"){
                if(viewModel.login()){
                    accountView
                }
                    
            }
                Spacer()
            VStack{
                Text("Hesabın Yok Mu?")
                NavigationLink("Yeni Hesap Oluştur!", destination: RegisterView())
            }.padding(.bottom,30)
                
        }
    }

}

@ViewBuilder
var accountView: some View {
  
    TabView {
        
        ToDoListView()
            .tabItem {
                Label("Görevler",systemImage: "house")
            }
        ProfileView()
            .tabItem {
                Label("Profil",systemImage: "person.circle")
                
            }
        }
}
#Preview {
    LoginView()
}
