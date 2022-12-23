//
//  NetworkLayer.swift
//  ProyectoDos
//
//  Created by Enrique Poyato Ortiz on 18/12/22.
//

import Foundation

enum NetworkError: Error {
    case malformedUrl
    case noData
    case statusCode(code: Int?)
    case decodingFailed
    case unknown
}

final class Networklayer {
    static let shared = Networklayer()
    
    func login(email: String, password: String, completion: @escaping (String?, Error?) -> Void) {
        guard let url = URL(string: "https://dragonball.keepcoding.education/api/auth/login") else { completion(nil, NetworkError.malformedUrl)
            return
        }
        
        let loginString = "\(email):\(password)"
        let loginData: Data = loginString.data(using: .utf8)!
        let base64 = loginData.base64EncodedString()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("Basic \(base64)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, NetworkError.noData)
                return
            }
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                let statusCode = (response as? HTTPURLResponse)?.statusCode
                completion(nil, NetworkError.statusCode(code: statusCode))
                return
            }
            guard let token = String(data: data, encoding: .utf8) else {
                completion(nil, NetworkError.decodingFailed)
                return
            }
            completion(token, nil)
        }
        task.resume()
        
    }

    func fetchHeroes(token: String?, completion: @escaping([Heroe]?, Error?)-> Void) {
        guard let url = URL(string: "https://dragonball.keepcoding.education/api/heros/all") else {
            return
        }
        
        var urlComponents = URLComponents()
        urlComponents.queryItems = [URLQueryItem(name: "name", value: "")]
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("Bearer \(token ?? "")" , forHTTPHeaderField: "Authorization")
        urlRequest.httpBody = urlComponents.query?.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, NetworkError.noData)
                return
            }
            
            guard let  heroes = try? JSONDecoder().decode([Heroe].self, from: data) else {
                completion(nil, NetworkError.decodingFailed)
                return
            }
            
            completion(heroes, nil)
        }
        task.resume()

    }
    
    func fetchTransformations(token: String?, heroeId: String?, completion: @escaping([Tranformation]?, Error?)-> Void) {
        guard let url = URL(string: "https://dragonball.keepcoding.education/api/heros/tranformations") else {
            return
        }
        
        var urlComponents = URLComponents()
        urlComponents.queryItems = [URLQueryItem(name: "id", value: heroeId ?? "")]
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("Bearer \(token ?? "")" , forHTTPHeaderField: "Authorization")
        urlRequest.httpBody = urlComponents.query?.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, NetworkError.noData)
                return
            }
            
            guard let  tranformations = try? JSONDecoder().decode([Tranformation].self, from: data) else {
                completion(nil, NetworkError.decodingFailed)
                return
            }
            
            completion(tranformations, nil)
        }
        task.resume()

    }
}
