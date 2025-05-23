//
//  Route.swift
//  NewsTest
//
//  Created by Harvin Shibu on 23/05/25.
//

import Foundation
import SwiftUI

enum Route {
    case newsDetail(data: Article)
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .newsDetail(let data):
            NewsDetailScreen(data: data)
        }
    }
}

extension Route: Equatable {
    static func == (lhs: Route, rhs: Route) -> Bool {
        switch (lhs, rhs) {
            
        case (.newsDetail(let lhsData), .newsDetail(let rhsData)):
            return lhsData == rhsData

        }
    }
}

extension Route: Hashable {
    func hash(into hasher: inout Hasher) {
        switch self {
        case .newsDetail( _):
            hasher.combine("newsDetail")
        }
    }
}

struct NavigateAction {
    typealias Action = (Route?, Bool) -> ()
    let action: Action
    
    func callAsFunction(_ route: Route?, popToRoot: Bool = false) {
        action(route, popToRoot)
    }
}

struct NavigateEnvironmentKey: EnvironmentKey {
    static var defaultValue: NavigateAction = NavigateAction { _, _ in }
}

extension EnvironmentValues {
    var navigate: NavigateAction {
        get { self[NavigateEnvironmentKey.self] }
        set { self[NavigateEnvironmentKey.self] = newValue }
    }
}
