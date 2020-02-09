import XCTest
@testable import GW2

final class GW2Tests: XCTestCase {
    func testAPIKey() {
        XCTAssert(API.instance.configure(apiKey: "Some Key").apiKey != nil)
    }

    static var allTests = [
        ("testAPIKey", testAPIKey),
    ]
}
