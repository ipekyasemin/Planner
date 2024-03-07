//
//  RegisterView.swift
//  ToDoList
//
//  Created by yasemin ipek on 17.02.2024.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
    var body: some View {
        NavigationStack {
            VStack{
                ZStack {
                    Image("kus")
                        .resizable()
                        .frame(width: 150,height: 150)
                    Text("PLANNER")
                        .font(.system(size:30))
                        .bold()
                        .padding(.top,30)
                }.padding(.top,100)
                
                Form(content: {
                    
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    Section(header:Text("Kayıt Formu")){
                        TextField("Tam Adınız",text:$viewModel.name)
                            .autocorrectionDisabled()
                        TextField("Email Adresiniz",text: $viewModel.userMail
                        )
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                        SecureField("Şifreniz",text: $viewModel.password)
                    }
                })
                .frame(height: 250)
                
                
                BigButtonView(title: "Kayıt Ol", action: {
                    viewModel.register()
                })
                Spacer()
                
            }
        }
    }
}


#Preview {
    RegisterView()
}



