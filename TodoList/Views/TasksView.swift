//
//  TasksView.swift
//  TodoList
//
//  Created by 김우성 on 2024/03/08.
//

import SwiftUI

struct TasksView: View {
    var body: some View {
        VStack {
            Text("오늘 할 일")
                .font(.title2)
                .bold()
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
    }
}

#Preview {
    TasksView()
}
