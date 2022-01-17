//
//  URLRequest+Extension.swift
//  Joblogic
//
//  Created by Ryan on 16/01/2022.
//

import Foundation

struct Resource<T: Decodable> {
    let url: URL
}

extension URLRequest {
    
    static func load<T>(resource: Resource<T>, completion: @escaping ([T]?) -> Void) {
        var request = URLRequest(url: resource.url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let items = try? JSONDecoder().decode([T].self, from: data) {
                completion(items)
            } else {
                completion(nil)
            }
        }
        dataTask.resume()
    }
}
