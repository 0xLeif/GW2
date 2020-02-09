//
//  URL+.swift
//  
//
//  Created by Zach Eriksen on 2/8/20.
//

import Foundation

public extension URL {
    func request(forRoute route: API.Route, withID id: Int? = nil) -> URLRequest {
        let path = route.rawValue.replacingOccurrences(of: "_", with: "/")
        
        guard let id = id else {
            return URLRequest(url: appendingPathComponent(path),
                              cachePolicy: .useProtocolCachePolicy,
                              timeoutInterval: 10.0)
        }
        return URLRequest(url: appendingPathComponent("/\(path)/\(id)"),
                          cachePolicy: .useProtocolCachePolicy,
                          timeoutInterval: 10.0)
    }
}
