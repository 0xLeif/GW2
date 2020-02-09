//
//  Achievement.swift
//  
//
//  Created by Zach Eriksen on 2/8/20.
//

import Foundation

public struct Achievement: Codable {
    public let id: Int
    public let bits: [Int]?
    public let current: Int?
    public let max: Int?
    public let done: Bool
    public let repeated: Int?
    public let unlocked: Bool?
}
