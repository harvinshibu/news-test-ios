//
//  FontHelper.swift
//  NewsTestApp
//
//  Created by Harvin Shibu on 22/05/25.
//

import SwiftUI

extension Text {
    func fontStyle(size: CGFloat = 14, weight: Font.Weight = .regular) -> Text {
        self.font(.system(size: size, weight: weight))
    }
}

struct DynamicTextFieldModifier: ViewModifier {
    var size: CGFloat = 14
    var weight: Font.Weight = .regular
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: weight))
    }
}

extension View {
    func fontStyle(size: CGFloat = 14, weight: Font.Weight = .regular) -> some View {
        self.modifier(DynamicTextFieldModifier(
            size: size,
            weight: weight
        ))
    }
}
