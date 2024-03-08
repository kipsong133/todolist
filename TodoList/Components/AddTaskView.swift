//
//  AddTaskView.swift
//  TodoList
//
//  Created by 김우성 on 2024/03/08.
//

import SwiftUI

struct AddTaskView: View {
    @State private var title: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("새로운 할 일")
                .font(.title2)
                .bold()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            TextField(
                "할 일을 입력해주세요",
                text: $title
            )
            .textFieldStyle(.roundedBorder)
            
            Button {
                print("할 일 추가!!!")
            } label: {
                Text("할 일 추가")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Color(hue: 0.328, saturation: 0.796, brightness: 0.408))
                    .cornerRadius(30)
            }
            Spacer()
        }
        .padding(.top, 40)
        .padding(.horizontal)
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
    }
}

#Preview {
    AddTaskView()
}
