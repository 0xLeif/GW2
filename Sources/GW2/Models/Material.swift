//
//  Material.swift
//  
//
//  Created by Zach Eriksen on 2/9/20.
//

import Foundation

/** JSON
[
  {
    "id": 12134,
    "category": 5,
    "count": 64
  },
  {
    "id": 24876,
    "category": 30,
    "count": 12
  }
]
*/

public struct Material: Codable {
    public let id: Int
    public let category: Int
    public let count: Int
    public let binding: String?
}
