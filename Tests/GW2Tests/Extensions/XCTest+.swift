//
//  XCTest+.swift
//  
//
//  Created by Zach Eriksen on 2/9/20.
//

import Foundation
import XCTest

/// ACK: [vadimbulavin](https://www.vadimbulavin.com/swift-asynchronous-unit-testing-with-busy-assertion-pattern/)
extension XCTest {
    func expectToEventually(_ test: @autoclosure () -> Bool, timeout: TimeInterval = 5.0, message: String = "") {
        let runLoop = RunLoop.current
        let timeoutDate = Date(timeIntervalSinceNow: timeout)
        repeat {
            
            if test() {
                return
            }
            
            runLoop.run(until: Date(timeIntervalSinceNow: 0.01))
        } while Date().compare(timeoutDate) == .orderedAscending
        
        XCTFail(message)
    }
}
