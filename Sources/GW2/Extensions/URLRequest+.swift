//
//  URLRequest+.swift
//  
//
//  Created by Zach Eriksen on 2/8/20.
//

import Foundation

public extension URLRequest {
    mutating func dataTaskPublish(method: String = "GET", withBody body: Data? = nil) -> URLSession.DataTaskPublisher {
        guard let apiKey = GW2API.instance.apiKey else {
            fatalError("You have not set the GW2 API Key")
        }
        
        let headers = [
            "Content-Type": "application/json; charset=utf-8",
            "cache-control": "no-cache",
            "Authorization": "Bearer \(apiKey)"
        ]
        
        httpMethod = method
        allHTTPHeaderFields = headers
        if let body = body {
            httpBody = body
        }
        
        let session = URLSession.shared
        return session.dataTaskPublisher(for: self)
    }
}
