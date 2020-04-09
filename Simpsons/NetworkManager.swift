//  NetworkManager.swift
//  Simpsons
//
//  Created by chandrasekhar yadavally on 4/6/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    let link = "https://api.duckduckgo.com/?q=simpsons+characters&format=json"
    
    private init() {  }
    
    func getData(completion: @escaping ((Result<[Simpson], ErrorMessage>) -> Void)) {
        let url = URLRequest(url: URL(string: link)!)
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error { completion(.failure(.networkError("1")))}
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse("2")))
                return
            }
            guard let data = data else {
                completion(.failure(.invalidResponse("3")))
                return
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            guard let json = try? decoder.decode(JsonData.self, from: data) else {
                completion(.failure(.unableToDecode("4")))
                return
            }
            
            let simpsons = json.RelatedTopics
            
            completion(.success(simpsons))
            
            
        }.resume()
    }
}
