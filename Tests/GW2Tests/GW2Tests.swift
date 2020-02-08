import XCTest
@testable import GW2

final class GW2Tests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(GW2().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
