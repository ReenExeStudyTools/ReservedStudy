import XCTest
@testable import GridWarsPlayer

class GridWarsPlayerTests: XCTestCase {
  func testSimple() {
    let current = 1 << 31;
    let player = GridWarsPlayer()
    XCTAssertEqual(
      player.play(
        matrix: [
          0, 0, 0,
          0, 0, 0,
          0, 0, 0,
        ]),
        [2, 2, 2, current]
    )

    XCTAssertEqual(
      player.play(
        matrix: [
          0, 0, current,
          0, 0, 0,
          0, 0, 0,
        ]),
        [8, 8, 8, current]
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
