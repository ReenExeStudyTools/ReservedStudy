import XCTest
@testable import GridWarsPlayer

class GridWarsPlayerTests: XCTestCase {
  func testSimple() {
    let player = GridWarsPlayer()
    XCTAssertEqual(
      player.play(
        matrix: [
          0, 0, 0,
          0, 0, 0,
          0, 0, 0,
        ]),
        [1, 1, 1, 1 << 31]
    )
  }
}

extension GridWarsPlayerTests {
    static var allTests : [(String, (GridWarsPlayerTests) -> () throws -> Void)] {
        return [
             ("testSimple", testSimple)
        ]
    }
}
