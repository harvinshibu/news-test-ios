//
//  RemoteImageView.swift
//  NewsTest
//
//  Created by Harvin Shibu on 22/05/25.
//


import SwiftUI

struct RemoteImageView: View {
    let url: URL?
    var errorImageName: String = "no-image"
    let size: CGSize
    var cornerRadius: CGFloat?
    var body: some View {
        if let url = url {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: size.width, height: size.height)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: size.width, height: size.height)
                        .cornerRadius(cornerRadius ?? 0)

                case .failure:
                    Image(errorImageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: size.width, height: size.height)
                        .cornerRadius(cornerRadius ?? 0)

                @unknown default:
                    EmptyView()
                }
            }
        } else {
            Image(errorImageName)
                .resizable()
                .scaledToFit()
                .frame(width: size.width, height: size.height)
                .cornerRadius(cornerRadius ?? 0)
        }
    }
}

//MARK: This is used for large images that take full width
struct RemoteLargeImageView: View {
    let url: URL?
    var errorImageName: String = "no-image"
    var height: CGFloat
    var cornerRadius: CGFloat?

    var body: some View {
        if let url = url {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(maxWidth: .infinity, minHeight: height, maxHeight: height)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, minHeight: height, maxHeight: height)
                        .clipped()
                        .cornerRadius(cornerRadius ?? 0)

                case .failure:
                    Image(errorImageName)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, minHeight: height, maxHeight: height)
                        .clipped()
                        .cornerRadius(cornerRadius ?? 0)

                @unknown default:
                    EmptyView()
                }
            }
        } else {
            Image(errorImageName)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, minHeight: height, maxHeight: height)
                .clipped()
                .cornerRadius(cornerRadius ?? 0)
        }
    }
}
