//
//  Masteries.swift
//  
//
//  Created by Zach Eriksen on 2/9/20.
//

import Foundation

/** JSON
{
  "totals": [
    {
      "region": "Tyria",
      "spent": 49,
      "earned": 63
    },
    {
      "region": "Maguuma",
      "spent": 137,
      "earned": 175
    },
    {
      "region": "Desert",
      "spent": 76,
      "earned": 84
    }
  ],
  "unlocked": [
    1,
    305
  ]
}

*/
public struct Mastery: Codable {
    public let region: String
    public let spent: Int
    public let earned: Int
}

public struct Masteries: Codable {
    public let totals: [Mastery]
    public let unlocked: [Int]
}
