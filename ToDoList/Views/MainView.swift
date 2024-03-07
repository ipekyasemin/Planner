//
//  MainView.swift
//  ToDoList
//
//  Created by yasemin ipek on 15.02.2024.
//

import SwiftUI

struct MainView: View {

    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        
        if viewModel.isSignedIn,
           !viewModel.currenUserId.isEmpty{
           accountView
        } else {
            LoginView()
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
}

#Preview {
    MainView()
}
