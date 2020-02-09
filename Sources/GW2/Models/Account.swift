//
//  Account.swift
//  
//
//  Created by Zach Eriksen on 2/8/20.
//

import Foundation

public struct Account: Codable {
    public let id: String
    public let age: Int
    public let name: String
    public let world: Int
    public let guilds: [String]
    public let guild_leader: [String]
    public let created: String
    public let access: [String]
    public let commander: Bool
    public let fractal_level: Int
    public let daily_ap: Int
    public let monthly_ap: Int
    public let wvw_rank: Int
    public let last_modified: String?
}
