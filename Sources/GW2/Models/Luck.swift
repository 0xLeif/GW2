//
//  Luck.swift
//  
//
//  Created by Zach Eriksen on 2/9/20.
//

import Foundation

/** JSON
[
  {
    "id": "luck",
    "value": 4295449
  }
]
*/

public struct Luck: Codable {
    public let id: String
    public let value: Int
}
