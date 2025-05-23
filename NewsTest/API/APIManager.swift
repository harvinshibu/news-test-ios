//
//  APIManager.swift
//  NewsTest
//
//  Created by Harvin Shibu on 22/05/25.
//

import Foundation

class APIManager {
    static let shared = APIManager()
    private init() {}

    func get<T: Decodable>(urlString: String,
                           responseType: T.Type,
                           completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(ApiError.invalidUrl))
            return
        }

        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(ApiError.invalidResponse))
                return
            }

            guard let data = data else {
                completion(.failure(ApiError.noData))
                return
            }

            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

    enum ApiError: Error {
        case invalidUrl
        case invalidResponse
        case noData
    }
}
