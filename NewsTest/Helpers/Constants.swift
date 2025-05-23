//
//  Constants.swift
//  NewsTest
//
//  Created by Harvin Shibu on 22/05/25.
//


import Foundation
import SwiftUI

struct Constants{
    static let apiKey: String = "2398dd6a78f7454f87c532c8eb991fd4"
    static let screenWidth = UIScreen.main.bounds.width
    static let screenHeight = UIScreen.main.bounds.height
    
    static func screenDynamicHeight(percent: Double) -> CGFloat {
        return screenHeight * (percent/100)
    }
    static func screenDynamicWidth(percent: Double) -> CGFloat {
        return screenWidth * (percent/100)
    }

    struct Dimensions {
        static let spacingDefault: CGFloat = 15
        static let spacingSmall: CGFloat = 10
        static let spacingExtraSmall: CGFloat = 5
    }
    
    struct FontSize {
        static let fontExtraLarge: CGFloat = 20
        static let fontDefault: CGFloat = 13
        static let fontSmall: CGFloat = 11
    }
}
