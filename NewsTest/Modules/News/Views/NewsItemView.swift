//
//  NewsItemView.swift
//  NewsTest
//
//  Created by Harvin Shibu on 22/05/25.
//

import SwiftUI

struct NewsItemView: View {
    let imageURL: String
    let title: String
    let date: String
    let onTap: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: Constants.Dimensions.spacingExtraSmall) {
                VStack(alignment: .leading, spacing: Constants.Dimensions.spacingSmall){
                    Text(title)
                        .fontStyle(size: Constants.FontSize.fontDefault, weight: .regular)
                        .foregroundStyle(.black)
                    
                    Text(date)
                        .fontStyle(size: Constants.FontSize.fontSmall, weight: .regular)
                        .foregroundStyle(UIColor.gray_6a6868.swiftuiColor)
                }.layoutPriority(1)
                Spacer()
                RemoteImageView(url: URL(string: imageURL),
                                size: CGSize(width: 85, height: 85))
            }
            .padding(.vertical, Constants.Dimensions.spacingSmall)
            .padding(.horizontal, Constants.Dimensions.spacingDefault)
            
            Divider()
        }
        .onTapGesture {
            onTap()
        }
    }
}
