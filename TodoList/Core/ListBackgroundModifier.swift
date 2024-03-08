//
//  ListBackgroundModifier.swift
//  TodoList
//
//  Created by 김우성 on 2024/03/08.
//

import SwiftUI

/// 예제
/// List { ... }
///     .modifier(ListBackgroundModifier())
///     .background(Color.red) // 원하는 색상 적용
struct ListBackgroundModifier: ViewModifier {

    @ViewBuilder
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content
                .scrollContentBackground(.hidden)
        } else {
            content
        }
    }
}

// 다른 해결방법
//struct Example: View {
//    ...
//    init() {
//        UICollectionView.appearance().backgroundColor = .clear
//    }
//}
//
//
//extension UICollectionReusableView {
//    override open var backgroundColor: UIColor? {
//        get { .clear }
//        set { }
//        // default separators use same color as background
//        // so to have it same but new (say red) it can be
//        // used as below, otherwise we just need custom separators
//        //
//        // set { super.backgroundColor = .red }
//    }
//}
