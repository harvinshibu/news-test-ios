//
//  CustomNavigationView.swift
//  NewsTestApp
//
//  Created by Harvin Shibu on 22/05/25.
//


import SwiftUI

struct CustomNavigationView: View {
    let title: String
    var titleAlign: VerticalAlignment = .center
    var leftButtonImage: String
    var onAction: (() -> Void)
    
    var body: some View {
        ZStack {
            HStack {
                Button(action: onAction) {
                    Image(leftButtonImage)
                }
                .frame(width: 40, height: 40)
                
                
                Text(title)
                    .foregroundColor(.black)
                    .fontStyle(size: Constants.FontSize.fontExtraLarge, weight: .medium)
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .frame(maxWidth: .infinity)
                    .layoutPriority(1)
                
                Spacer().frame(width: 40)
            }
            .padding(.vertical, Constants.Dimensions.spacingExtraSmall)
            .padding(.horizontal, Constants.Dimensions.spacingDefault)
            .frame(maxWidth: .infinity)
        }
        .frame(maxHeight: 42)
    }
}
