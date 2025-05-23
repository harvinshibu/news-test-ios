//
//  UIColor+Extension.swift
//  NewsTest
//
//  Created by Harvin Shibu on 23/05/25.
//

import Foundation
import SwiftUI

extension UIColor {
    static let gray_f5f5f5 = UIColor.init(named: "gray_f5f5f5") ?? UIColor.gray
    static let gray_909090 = UIColor.init(named: "gray_909090") ?? UIColor.gray
    static let gray_6d6d6d = UIColor.init(named: "gray_6d6d6d") ?? UIColor.gray
    static let gray_6a6868 = UIColor.init(named: "gray_6a6868") ?? UIColor.gray
    
    var swiftuiColor: Color { Color(uiColor: self) }
}
