//
//  BigButtonView.swift
//  ToDoList
//
//  Created by yasemin ipek on 19.02.2024.
//

import SwiftUI

struct BigButtonView: View {
    
    let title: String
    let action: () ->Void
    
    var body: some View {
        Button(action: action, label: {
            ZStack {
             RoundedRectangle(cornerRadius:10)
                    .foregroundStyle(.cyan)
             Text(title)
                    .foregroundStyle(.white)
            }
        }).frame(width: 300,height: 50)
            .padding(.horizontal)
           
    }
}

#Preview {
    BigButtonView(title: "ÖRNEK BUTON TİTLE'I", action:{})
}
