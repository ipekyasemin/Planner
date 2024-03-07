//
//  ProfileView.swift
//  ToDoList
//
//  Created by yasemin ipek on 15.02.2024.
//

import SwiftUI

struct ProfileView: View {
@StateObject var viewModel = ProfileViewViewModel()
    init(){}
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user{
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .foregroundColor(Color.blue)
                        .frame(width: 125,height: 125)
                VStack{
            HStack{
            Text("İsim:")
            .foregroundStyle(Color(.blue))
            Text(user.name)
                     }
                        
            HStack{
            Text("İsim:")
            .foregroundStyle(Color(.blue))
            Text(user.name)
                        
                    }
            HStack{
            Text("Email:")
            .foregroundStyle(Color(.blue))
            Text(user.email)
                        
            }
                   
        HStack{
      Text("Kayıt Tarihi:")
    .foregroundStyle(Color(.blue))
            Text("\(Date(timeIntervalSince1970:user.joined).formatted(date:.abbreviated, time:.shortened ))")
               }
                            }
                }else {
                    Text("Profil yükleniyor...")
                }
                BigButtonView(title:"Çıkış Yap"){
                    viewModel.logout()
                }
                
            }
            .navigationTitle("Profil")
            
        }
        
        .onAppear{
            viewModel.fetchUser() 
        }
        
        
    }
}

#Preview {
    ProfileView()
}
