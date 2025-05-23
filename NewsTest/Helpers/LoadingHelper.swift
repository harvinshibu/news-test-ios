//
//  LoadingHelper.swift
//  NewsTest
//
//  Created by Harvin Shibu on 23/05/25.
//


import SwiftUI

struct LoadingModifier: ViewModifier {
    @Binding var isLoading: Bool

    func body(content: Content) -> some View {
        ZStack() {
            content
                .disabled(isLoading)
                .opacity(isLoading ? 0.5 : 1)
            
            if isLoading {
                VStack {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(1.5)
                        .padding(20)
                        .cornerRadius(10)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}

extension View {
    func loading(_ isLoading: Binding<Bool>) -> some View {
        self.modifier(LoadingModifier(isLoading: isLoading))
    }
}
