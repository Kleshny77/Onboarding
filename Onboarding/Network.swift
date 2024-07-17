//
//  Network.swift
//  Onboarding
//
//  Created by Артём on 16.07.2024.
//

import Foundation

final class Worker {
    struct {
        DataResponse {
            var data: Data?
            var response: URLResponse?
        }
    }
    
    private var session: URLSession = URLSession.shared
    
    func fetch<T: Decodable>(
        request: URLRequest
        comletion: ((Result<T, Error>) -> Void)?
    ) {
        session.dataTask(with: request)
    }
    
    func fetch(url: URL) {
        session.dataTask(with: url) {_, _, _ in
            if let error {
                completion?(.fail)
                return
            }
            
            print("Hello")
        }.resume()
    }
}
