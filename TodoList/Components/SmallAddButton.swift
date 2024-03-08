//
//  SmallAddButton.swift
//  TodoList
//
//  Created by 김우성 on 2024/03/08.
//

import SwiftUI

struct SmallAddButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 50)
                .foregroundStyle(Color(hue: 0.328, saturation: 0.796, brightness: 0.408))
            
            Text("+")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundStyle(.white)
        }
        .frame(height: 50)
    }
}

#Preview {
    SmallAddButton()
}
