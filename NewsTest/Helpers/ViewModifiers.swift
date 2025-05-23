//
//  ViewModifiers.swift
//  NewsTest
//
//  Created by Harvin Shibu on 23/05/25.
//

import SwiftUI

struct Center: ViewModifier {
    func body(content: Content) -> some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                content
                Spacer()
            }
            Spacer()
        }
    }
}
