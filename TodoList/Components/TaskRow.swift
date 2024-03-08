//
//  TaskRow.swift
//  TodoList
//
//  Created by 김우성 on 2024/03/08.
//

import SwiftUI

struct TaskRow: View {
    // View에 필요한 값들
    var task: String
    var completed: Bool
    
    var body: some View {
        HStack {
            Image(systemName: completed ? "checkmark.circle.fill" : "circle")
            Text(task)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(task: "면도 개멋잇게 하기", completed: true)
    }
}
