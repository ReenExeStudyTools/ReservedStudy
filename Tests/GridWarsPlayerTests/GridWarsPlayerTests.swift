import XCTest
@testable import GridWarsPlayer

class GridWarsPlayerTests: XCTestCase {
  func testSimple() {
    let player = GridWarsPlayer()
    XCTAssertEqual(player.play(), [1, 1, 1])
  }
}

extension GridWarsPlayerTests {
    static var allTests : [(String, (GridWarsPlayerTests) -> () throws -> Void)] {
        return [
             ("testSimple", testSimple)
        ]
    }
}
