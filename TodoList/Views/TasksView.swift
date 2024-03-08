//
//  TasksView.swift
//  TodoList
//
//  Created by 김우성 on 2024/03/08.
//

import SwiftUI

struct TasksView: View {
    @EnvironmentObject var realmManager: RealmManager
    
    var body: some View {
        ZStack { // ZStack을 사용하여 배경색을 적용할 수 있습니다.
            // 배경색을 설정합니다.
            Color(hue: 0.086, saturation: 0.141, brightness: 0.972)
                .edgesIgnoringSafeArea(.all) // Safe area를 무시하고 전체 화면에 적용합니다.
            
            VStack {
                Text("오늘 할 일")
                    .font(.title2).bold()
                    .padding(.horizontal)
                    .padding(.top)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                List {
                    ForEach(realmManager.tasks, id: \.id) { task in
                        if !task.isInvalidated {
                            TaskRow(task: task.title, completed: task.completed)
                                .onTapGesture {
                                    realmManager.updateTask(id: task.id, completed: !task.completed)
                                }
                                .swipeActions(edge: .trailing) {
                                    Button(role: .destructive) {
                                        realmManager.deleteTask(id: task.id)
                                    } label: {
                                        Label("Delete", systemImage: "trash")
                                    }
                                }
                        }
                    }
                    .listRowSeparator(.hidden)
                }
                .modifier(ListBackgroundModifier())
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding()
                Spacer()
            }
            
        }
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
            .environmentObject(RealmManager())
    }
}
