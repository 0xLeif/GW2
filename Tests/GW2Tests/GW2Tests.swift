import XCTest
import OpenCombine
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
    .value { account in
      testAccount = account
    }
    .store(in: &bag)

    expectToEventually(testAccount != nil)
  }

  func testAchievements() {
    var testAchievements: [Achievement]?

    GW2API.instance.achievements()
    .value { achievements in
      testAchievements = achievements
    }
    .store(in: &bag)

    expectToEventually(testAchievements != nil)
  }

  func testBank() {
    var testBank: [Item?]?

    GW2API.instance.bank()
    .value { bank in
      testBank = bank
    }
    .store(in: &bag)

    expectToEventually(testBank != nil)
  }

  func testDailycrafting() {
    var testDailycrafting: [String]?

    GW2API.instance.dailycrafting()
    .value { dailycrafting in
      testDailycrafting = dailycrafting
    }
    .store(in: &bag)

    expectToEventually(testDailycrafting != nil)
  }

  func testDungeons() {
    var testDungeons: [String]?

    GW2API.instance.dungeons()
    .value { dungeons in
      testDungeons = dungeons
    }
    .store(in: &bag)

    expectToEventually(testDungeons != nil)
  }

  func testDyes() {
    var testDyes: [Int]?

    GW2API.instance.dyes()
    .value { dyes in
      testDyes = dyes
    }
    .store(in: &bag)

    expectToEventually(testDyes != nil)
  }

  func testEmotes() {
    var testEmotes: [String]?

    GW2API.instance.emotes()
    .value { emotes in
      testEmotes = emotes
    }
    .store(in: &bag)

    expectToEventually(testEmotes != nil)
  }

  func testFinishers() {
    var testFinishers: [Finisher]?

    GW2API.instance.finishers()
    .value { finishers in
      testFinishers = finishers
    }
    .store(in: &bag)

    expectToEventually(testFinishers != nil)
  }

  func testGliders() {
    var testGliders: [Int]?

    GW2API.instance.gliders()
    .value { gliders in
      testGliders = gliders
    }
    .store(in: &bag)

    expectToEventually(testGliders != nil)
  }

  func testHome() {
    var testHome: [String]?

    GW2API.instance.home()
    .value { home in
      testHome = home
    }
    .store(in: &bag)

    expectToEventually(testHome != nil)
  }

  func testHomeCats() {
    var testHomeCats: [Int]?

    GW2API.instance.cats()
    .value { cats in
      testHomeCats = cats
    }
    .store(in: &bag)

    expectToEventually(testHomeCats != nil)
  }

  func testHomeNodes() {
    var testHomeNodes: [String]?

    GW2API.instance.nodes()
    .value { nodes in
      testHomeNodes = nodes
    }
    .store(in: &bag)

    expectToEventually(testHomeNodes != nil)
  }

  func testInventory() {
    var testInventory: [Item?]?

    GW2API.instance.inventory()
    .value { inventory in
      testInventory = inventory
    }
    .store(in: &bag)

    expectToEventually(testInventory != nil)
  }

  func testLuck() {
    var testLuck: [Luck]?

    GW2API.instance.luck()
    .value { luck in
      testLuck = luck
    }
    .store(in: &bag)

    expectToEventually(testLuck != nil)
  }

  func testMailCarriers() {
    var testMailCarriers: [Int]?

    GW2API.instance.mailcarriers()
    .value { carriers in
      testMailCarriers = carriers
    }
    .store(in: &bag)

    expectToEventually(testMailCarriers != nil)
  }

  func testMapChests() {
    var testMapChests: [String]?

    GW2API.instance.mapchests()
    .value { chests in
      testMapChests = chests
    }
    .store(in: &bag)

    expectToEventually(testMapChests != nil)
  }

  func testMasteries() {
    var testMasteries: Masteries?

    GW2API.instance.masteries()
    .value { masteries in
      testMasteries = masteries
    }
    .store(in: &bag)

    expectToEventually(testMasteries != nil)
  }

  func testMaterials() {
    var testMaterials: [Material]?

    GW2API.instance.materials()
    .value { materials in
      testMaterials = materials
    }
    .store(in: &bag)

    expectToEventually(testMaterials != nil)
  }

  func testMinis() {
    var testMinis: [Int]?

    GW2API.instance.minis()
    .value { minis in
      testMinis = minis
    }
    .store(in: &bag)

    expectToEventually(testMinis != nil)
  }

  func testMounts() {
    var testMounts: [String]?

    GW2API.instance.mounts()
            .value { mounts in
              testMounts = mounts
            }
            .store(in: &bag)

    expectToEventually(testMounts != nil)
  }

  func testMountSkins() {
    var testMountSkins: [Int]?

    GW2API.instance.mountSkins()
            .value { skins in
              testMountSkins = skins
            }
            .store(in: &bag)

    expectToEventually(testMountSkins != nil)
  }

  func testMountTypes() {
    var testMountTypes: [String]?

    GW2API.instance.mountTypes()
            .value { types in
              testMountTypes = types
            }
            .store(in: &bag)

    expectToEventually(testMountTypes != nil)
  }

  func testNovelties() {
    var testNovelties: [Int]?

    GW2API.instance.novelties()
            .value { novelties in
              testNovelties = novelties
            }
            .store(in: &bag)

    expectToEventually(testNovelties != nil)
  }

  func testOutfits() {
    var testOutfits: [Int]?

    GW2API.instance.outfits()
            .value { outfits in
              testOutfits = outfits
            }
            .store(in: &bag)

    expectToEventually(testOutfits != nil)
  }

  func testPVPHeroes() {
    var testPVPHeroes: [Int]?

    GW2API.instance.pvpHeroes()
            .value { pvpHeroes in
              testPVPHeroes = pvpHeroes
            }
            .store(in: &bag)

    expectToEventually(testPVPHeroes != nil)
  }

  func testRaids() {
    var testRaids: [String]?

    GW2API.instance.raids()
            .value { raids in
              testRaids = raids
            }
            .store(in: &bag)

    expectToEventually(testRaids != nil)
  }

  func testRecipes() {
    var testRecipes: [Int]?

    GW2API.instance.recipes()
            .value { recipes in
              testRecipes = recipes
            }
            .store(in: &bag)

    expectToEventually(testRecipes != nil)
  }

  func testSkins() {
    var testSkins: [Int]?

    GW2API.instance.skins()
            .value { skins in
              testSkins = skins
            }
            .store(in: &bag)

    expectToEventually(testSkins != nil)
  }

  static var allTests = [
    ("testAPIKey", testAPIKey),
    ("testAccount", testAccount),
    ("testAchievements", testAchievements),
    ("testBank", testBank),
    ("testDailycrafting", testDailycrafting),
    ("testDungeons", testDungeons),
    ("testDyes", testDyes),
    ("testEmotes", testEmotes),
    ("testFinishers", testFinishers),
    ("testGliders", testGliders),
    ("testHome", testHome),
    ("testHomeCats", testHomeCats),
    ("testHomeNodes", testHomeNodes),
    ("testInventory", testInventory),
    ("testLuck", testLuck),
    ("testMailCarriers", testMailCarriers),
    ("testMapChests", testMapChests),
    ("testMasteries", testMasteries),
    ("testMaterials", testMaterials),
    ("testMinis", testMinis),
    ("testMounts", testMounts),
    ("testMountSkins", testMountSkins),
    ("testMountTypes", testMountTypes),
    ("testNovelties", testNovelties),
    ("testOutfits", testOutfits),
    ("testPVPHeroes", testPVPHeroes),
    ("testRaids", testRaids),
    ("testRecipes", testRecipes),
    ("testSkins", testSkins)
  ]
}
