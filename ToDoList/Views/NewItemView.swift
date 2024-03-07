//
//  NewItemView.swift
//  ToDoList
//
//  Created by yasemin ipek on 15.02.2024.
//

import SwiftUI

struct NewItemView: View {
    
@Binding var newItemPresented: Bool
    
@StateObject var viewModel = NewItemViewViewModel()
    
    var body: some View {
        VStack {
            Text("Yeni Görev")
                .underline()
                .font(.largeTitle)
                .foregroundColor(.black)
                .bold()
                .padding(.top,50)
            Form{
                TextField("Başlık",text:$viewModel.title)
                DatePicker("Bitiş Tarihi",selection:$viewModel.dueDate)
                    .datePickerStyle(.graphical)
                
                BigButtonView(title:"Kaydet"){
                    if viewModel.canSave {
                    viewModel.save()
                    newItemPresented = false
                    }else {
                        viewModel.showAlert = true
                    }
            }
         }
            .alert(isPresented: $viewModel.showAlert, content: {
                Alert(title: Text("Hata"),message: Text("Lütfen verilerin doğruluğunu kontrol edin"))
            })
        }
        }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
