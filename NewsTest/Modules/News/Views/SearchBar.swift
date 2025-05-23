//
//  SearchBar.swift
//  NewsTest
//
//  Created by Harvin Shibu on 23/05/25.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.black)
                .padding(.leading, 8)

            TextField("Search here...", text: $searchText)
                .padding(8)
                .padding(.leading, -8)
                .foregroundStyle(UIColor.gray_6d6d6d.swiftuiColor)
        }
        .background(UIColor.gray_f5f5f5.swiftuiColor)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(UIColor.gray_909090.swiftuiColor, lineWidth: 1)
        )
        .padding()
    }
}
