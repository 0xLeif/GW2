//
//  Item.swift
//  
//
//  Created by Zach Eriksen on 2/9/20.
//

import Foundation

public struct Item: Codable {
    public let id: Int
    public let count: Int
    public let charges: Int?
    public let skin: Int?
    public let upgrades: [Int]?
    public let infusions: [Int]?
    public let binding: String?
    public let bound_to: String?
}
