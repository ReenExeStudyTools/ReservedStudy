import XCTest
@testable import GridWarsPlayer

class GridWarsPlayerTests: XCTestCase {
  func testSimple() {
    let scout = 1 << 31 | 1 << 27 | 1 << 23;
    let player = GridWarsPlayer()
    XCTAssertEqual(
      player.play(
        [
          0, 0, 0,
          0, 0, 0,
          0, 0, 0,
        ]),
        [2, scout]
    )

    XCTAssertEqual(
      player.play(
        [
          0,     0, 0,
          0,     0, 0,
          scout, 0, 0,
        ]),
        [2, scout]
    )

    XCTAssertEqual(
      player.play(
        [
          0, 0, scout,
          0, 0, 0,
          0, 0, 0,
        ]),
        [6, scout]
    )

    XCTAssertEqual(
      player.play(
        [
          scout, 0, 0,
          0,       0, 0,
          0,       0, 0,
        ]),
        [8, scout]
    )

    XCTAssertEqual(
      player.play(
        [
          scout, 0, 0,
          0,     0, 0,
          0,     0,  scout,
        ]),
        [1, scout]
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
