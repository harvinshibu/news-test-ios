//
//  NewsTestApp.swift
//  NewsTest
//
//  Created by Harvin Shibu on 22/05/25.
//

import SwiftUI

@main
struct NewsTestApp: App {
    @State private var routes: [Route] = []
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $routes) {
                NewsListingScreen()
                    .navigationDestination(for: Route.self){ route in
                        route.destination
                    }
            }.environment(\.navigate, NavigateAction(action: { route, popToRoot  in
                if popToRoot {
                    routes.removeAll()
                } else {
                    if let route = route{
                        routes.append(route)
                    }
                }
            }))
        }
    }
}
