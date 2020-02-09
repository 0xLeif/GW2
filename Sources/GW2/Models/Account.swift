//
//  Account.swift
//  
//
//  Created by Zach Eriksen on 2/8/20.
//

import Foundation

public struct Account: Codable {
    let id: String
    let age: Int
    let name: String
    let world: Int
    let guilds: [String]
    let guild_leader: [String]
    let created: String
    let access: [String]
    let commander: Bool
    let fractal_level: Int
    let daily_ap: Int
    let monthly_ap: Int
    let wvw_rank: Int
    let last_modified: String?
}
