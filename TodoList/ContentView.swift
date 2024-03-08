//
//  ContentView.swift
//  TodoList
//
//  Created by 김우성 on 2024/03/08.
//

import SwiftUI

struct ContentView: View {
    @State private var showAddTaskView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            TasksView()
            SmallAddButton()
                .padding()
                .onTapGesture {
                    showAddTaskView.toggle()
                }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
        .sheet(isPresented: $showAddTaskView, content: {
            AddTaskView()
                .environment(\.colorScheme, .light)
        })
    }
}

#Preview {
    ContentView()
}
