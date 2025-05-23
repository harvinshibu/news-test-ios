//
//  NewsHeaderView.swift
//  NewsTest
//
//  Created by Harvin Shibu on 22/05/25.
//

import SwiftUI

struct NewsHeaderView: View {
    let imageURL: String
    let title: String
    let date: String
    let onTap: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: Constants.Dimensions.spacingSmall){
            RemoteLargeImageView(url: URL(string: imageURL), height: 170)
            Text(title)
                .fontStyle(size: Constants.FontSize.fontDefault, weight: .regular)
                .foregroundStyle(.black)
            
            Text(date)
                .fontStyle(size: Constants.FontSize.fontSmall, weight: .regular)
                .foregroundStyle(UIColor.gray_6a6868.swiftuiColor)
            
            Divider()
        }
        .padding(.horizontal, Constants.Dimensions.spacingDefault)
        .onTapGesture {
            onTap()
        }
    }
}
