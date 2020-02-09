//
//  API.swift
//  
//
//  Created by Zach Eriksen on 2/8/20.
//

import Foundation
import Combine

public class API {
    public enum Route: String {
        case account
        case account_achievments
    }
    
    public static var instance: API = {
        API()
    }()
    
    // Configuations
    public var apiKey: String?
    
    // Constants
    private let path: String = "https://api.guildwars2.com/v2"
    
    // Lazy Variables
    private lazy var url: URL = URL(string: path)!
}

// MARK: Helper Functions
public extension API {
    
    @discardableResult
    func configure(apiKey: String) -> Self {
        self.apiKey = apiKey
        
        return self
    }
    
    func fetch(route: Route) -> AnyPublisher<Any, Error> {
        var request = url.request(forRoute: route)
        
        return request.dataTaskPublish()
            .mapError { $0 as Error }
            .compactMap {
                do {
                    return try JSONSerialization.jsonObject(with: $0.data, options: .allowFragments)
                } catch {
                    print("Error: \(error)")
                    return nil
                }
        }
        .eraseToAnyPublisher()
    }
    
    func get<T: Codable>(route: Route) -> AnyPublisher<T, Error> {
        var request = url.request(forRoute: route)
        
        return request.dataTaskPublish()
            .mapError { $0 as Error }
            .compactMap {
                do {
                    return try JSONDecoder().decode(T.self, from: $0.data)
                } catch {
                    print("Error: \(error)")
                    return nil
                }
        }
        .eraseToAnyPublisher()
    }
}

// MARK: API Route Functions
public extension API {
    func account() -> AnyPublisher<Account, Error> {
        return get(route: .account)
    }
}
