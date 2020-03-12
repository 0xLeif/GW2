//
//  GW2API.swift
//  
//
//  Created by Zach Eriksen on 2/8/20.
//

import Foundation
import OpenCombine

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public class GW2API {
    public enum Route: String {
        case account
        case account_achievements
        case account_bank
        case account_dailycrafting
        case account_dungeons
        case account_dyes
        case account_emotes
        case account_finishers
        case account_gliders
        case account_home
        case account_home_cats
        case account_home_nodes
        case account_inventory
        case account_luck
        case account_mailcarriers
        case account_mapchests
        case account_mastery_points
        case account_materials
        case account_minis
        case account_mounts
        case account_mounts_skins
        case account_mounts_types
        case account_novelties
        case account_outfits
        case account_pvp_heroes
        case account_raids
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
        get(route: .account)
    }
    
    func achievements() -> AnyPublisher<[Achievement], Error> {
        get(route: .account_achievements)
    }
    
    func bank() -> AnyPublisher<[Item?], Error> {
        get(route: .account_bank)
    }
    
    func dailycrafting() -> AnyPublisher<[String], Error> {
        get(route: .account_dailycrafting)
    }
    
    func dungeons() -> AnyPublisher<[String], Error> {
        get(route: .account_dungeons)
    }
    
    func dyes() -> AnyPublisher<[Int], Error> {
        get(route: .account_dyes)
    }

    func emotes() -> AnyPublisher<[String], Error> {
        get(route: .account_emotes)
    }

    func finishers() -> AnyPublisher<[Finisher], Error> {
        get(route: .account_finishers)
    }

    func gliders() -> AnyPublisher<[Int], Error> {
        get(route: .account_gliders)
    }

    func home() -> AnyPublisher<[String], Error> {
        get(route: .account_home)
    }

    func cats() -> AnyPublisher<[Int], Error> {
        get(route: .account_home_cats)
    }

    func nodes() -> AnyPublisher<[String], Error> {
        get(route: .account_home_nodes)
    }

    func inventory() -> AnyPublisher<[Item?], Error> {
        get(route: .account_inventory)
    }

    func luck() -> AnyPublisher<[Luck], Error> {
        get(route: .account_luck)
    }

    func mailcarriers() -> AnyPublisher<[Int], Error> {
        get(route: .account_mailcarriers)
    }

    func mapchests() -> AnyPublisher<[String], Error> {
        get(route: .account_mapchests)
    }

    func masteries() -> AnyPublisher<Masteries, Error> {
        get(route: .account_mastery_points)
    }

    func materials() -> AnyPublisher<[Material], Error> {
        get(route: .account_materials)
    }

    func minis() -> AnyPublisher<[Int], Error> {
        get(route: .account_minis)
    }

    func mounts() -> AnyPublisher<[String], Error> {
        get(route: .account_mounts)
    }

    func mountSkins() -> AnyPublisher<[Int], Error> {
        get(route: .account_mounts_skins)
    }

    func mountTypes() -> AnyPublisher<[String], Error> {
        get(route: .account_mounts_types)
    }

    func novelties() -> AnyPublisher<[Int], Error> {
        get(route: .account_novelties)
    }

    func outfits() -> AnyPublisher<[Int], Error> {
        get(route: .account_outfits)
    }

    func pvpHeroes() -> AnyPublisher<[Int], Error> {
        get(route: .account_pvp_heroes)
    }

    func raids() -> AnyPublisher<[String], Error> {
        get(route: .account_raids)
    }
}
