//
//  NewsDetailScreen.swift
//  NewsTest
//
//  Created by Harvin Shibu on 23/05/25.
//

import SwiftUI

struct NewsDetailScreen: View {
    @Environment(\.dismiss) var dismiss
    let data: Article
    
    var body: some View {
        VStack(alignment: .leading) {
            CustomNavigationView(title: "News",
                                 leftButtonImage: "chevron.backward",
                                 onAction: {
                dismiss()
            })
            
            ScrollView{
                RemoteLargeImageView(url: URL(string: data.urlToImage ?? ""), height: 180)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(data.title ?? "")
                        .fontStyle(size: Constants.FontSize.fontDefault, weight: .semibold)
                        .foregroundStyle(.black)
                    
                    Divider()
                    
                    HStack {
                        Text("Author: ")
                            .fontStyle(size: Constants.FontSize.fontDefault, weight: .regular)
                            .foregroundStyle(.black)
                        
                        Text(data.author ?? "")
                            .fontStyle(size: Constants.FontSize.fontDefault, weight: .semibold)
                            .foregroundStyle(.black)
                        Spacer()
                    }
                    
                    Text(data.publishedAt ?? "")
                        .fontStyle(size: Constants.FontSize.fontDefault, weight: .regular)
                        .foregroundStyle(.black)
                    
                    Divider()
                    
                    Text(data.content ?? "")
                        .fontStyle(size: Constants.FontSize.fontDefault, weight: .regular)
                        .foregroundStyle(.black)
                }.padding(.horizontal, Constants.Dimensions.spacingDefault)
            }
        }.navigationBarHidden(true)
    }
}
