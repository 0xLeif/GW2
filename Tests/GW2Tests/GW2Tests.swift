import XCTest
import Combine
@testable import GW2

final class GW2Tests: XCTestCase {
    private var bag = [AnyCancellable]()
    
    override func setUp() {
        // MARK: Set an API Key
        GW2API.instance.configure(apiKey: "67919F8B-CC0B-E14E-AF89-C0C766927467DD23768D-1E22-4294-9EDE-FFD6D02000A6")
    }
    
    override func tearDown() {
        bag = []
    }
    
    func testAPIKey() {
        XCTAssert(GW2API.instance.apiKey != nil)
    }
    
    func testAccount() {
        var testAccount: Account?
        
        GW2API.instance.account()
            .value { (account) in
            testAccount = account
        }
        .store(in: &bag)
        
        expectToEventually(testAccount != nil)
    }
    
    func testAchievements() {
        var testAchievements: [Achievement]?
        
        GW2API.instance.achievements()
            .value { (achievements) in
            testAchievements = achievements
        }
        .store(in: &bag)
        
        expectToEventually(testAchievements != nil)
    }
    
    func testBank() {
        var testBank: [Item?]?
        
        GW2API.instance.bank()
            .value { (bank) in
            testBank = bank
        }
        .store(in: &bag)
        
        expectToEventually(testBank != nil)
    }

    static var allTests = [
        ("testAPIKey", testAPIKey),
        ("testAccount", testAccount),
        ("testAchievements", testAchievements),
        ("testBank", testBank)
    ]
}
