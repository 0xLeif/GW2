//
//  AnyPublisher+.swift
//  
//
//  Created by Zach Eriksen on 2/9/20.
//

import Foundation
import OpenCombine

extension AnyPublisher {
    func value(_ closure: @escaping ((Output) -> Void)) -> AnyCancellable {
        sink(receiveCompletion: { _ in }, receiveValue: closure)
    }
}
