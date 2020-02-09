import XCTest
import Combine
@testable import GW2

final class GW2Tests: XCTestCase {
    private var bag = [AnyCancellable]()
    
    override func setUp() {
        // MARK: Set an API Key
        API.instance.configure(apiKey: "API Key")
    }
    
    override func tearDown() {
        bag = []
    }
    
    func testAPIKey() {
        XCTAssert(API.instance.apiKey != nil)
    }
    
    func testAccount() {
        var testAccount: Account?
        
        API.instance.account()
            .value { (account) in
            testAccount = account
        }
        .store(in: &bag)
        
        expectToEventually(testAccount != nil)
    }
    
    func testAchievements() {
        var testAchievements: [Achievement]?
        
        API.instance.achievements()
            .value { (achievements) in
            testAchievements = achievements
        }
        .store(in: &bag)
        
        expectToEventually(testAchievements != nil)
    }

    static var allTests = [
        ("testAPIKey", testAPIKey),
        ("testAccount", testAccount),
        ("testAchievements", testAchievements)
    ]
}
