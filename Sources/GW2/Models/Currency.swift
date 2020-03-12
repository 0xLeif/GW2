//
//  Currency.swift
//  
//
//  Created by Zach Eriksen on 2/9/20.
//

import Foundation

/** JSON
[
  {
    "id": 1,
    "value": 100001
  },
  {
    "id": 5,
    "value": 301
  }
]
*/

public struct Currency: Codable {
    public let id: Int
    public let value: Int
}
