//
//  GW2API.swift
//  
//
//  Created by Zach Eriksen on 2/8/20.
//

import Foundation
import Combine

public class GW2API {
    public enum Route: String {
        case account
        case account_achievements
        case account_bank
    }
    
    public static var instance: GW2API = {
        GW2API()
    }()
    
    // Configuations
    public var apiKey: String?
    
    // Constants
    private let path: String = "https://api.guildwars2.com/v2"
    
    // Lazy Variables
    private lazy var url: URL = URL(string: path)!
}

// MARK: Helper Functions
public extension GW2API {
    
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
                    return try JSONSerialization.jsonObject(with: $0.data, options: [])
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
public extension GW2API {
    func account() -> AnyPublisher<Account, Error> {
        return get(route: .account)
    }
    
    func achievements() -> AnyPublisher<[Achievement], Error> {
        return get(route: .account_achievements)
    }
    
    func bank() -> AnyPublisher<[Item?], Error> {
        return get(route: .account_bank)
    }
}
