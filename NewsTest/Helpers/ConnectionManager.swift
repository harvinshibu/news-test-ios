//
//  ConnectionManager.swift
//  NewsTest
//
//  Created by Harvin Shibu on 23/05/25.
//

import Network

class ConnectionManager {
    static let shared = ConnectionManager()
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitor")
    private(set) var isConnected: Bool = false

    private var initialized = false
    private var initCallbacks: [(Bool) -> Void] = []

    private init() {
        monitor.pathUpdateHandler = { [weak self] path in
            guard let self = self else { return }
            self.isConnected = path.status == .satisfied

            if !self.initialized {
                self.initialized = true
                self.initCallbacks.forEach { $0(self.isConnected) }
                self.initCallbacks.removeAll()
            }
        }
        monitor.start(queue: queue)
    }

    func checkConnection(_ callback: @escaping (Bool) -> Void) {
        if initialized {
            callback(isConnected)
        } else {
            initCallbacks.append(callback)
        }
    }
}
