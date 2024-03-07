//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by yasemin ipek on 15.02.2024.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()
    
    let item:ToDoListItem
    
    var body: some View {
        HStack{
            VStack(alignment:.leading){
                Text(item.title)
                    .font(.title)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundStyle(Color(.secondaryLabel))
            }
            Spacer()
            Button{
                viewModel.toggleIsDone(item:item)
            }label: {
                
                Image(systemName: item.isDone ? "checkmark.circle.fill":"circle")
                    .foregroundStyle(Color(.blue))
            }
        }
    }
}

#Preview {
    ToDoListItemView(item: .init(
        id:"123",
        userId:     "",
        title:"ABONE OL",
        dueDate:Date().timeIntervalSince1970,
        createdDate:Date().timeIntervalSince1970,
        isDone: false
        
    ))
}
