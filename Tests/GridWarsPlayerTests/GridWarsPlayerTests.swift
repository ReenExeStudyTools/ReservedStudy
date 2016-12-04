import XCTest
@testable import GridWarsPlayer

class GridWarsPlayerTests: XCTestCase {
  func testSimple() {
    let scout = 1 << 31 | 1 << 27 | 1 << 23
    let player = GridWarsPlayer()
    XCTAssertEqual(
      player.play(
        [
          0, 0, 0,
          0, 0, 0,
          0, 0, 0,
        ]
      ),
      [2, scout]
    )

    XCTAssertEqual(
      player.play(
        [
          0,     0, 0,
          0,     0, 0,
          scout, 0, 0,
        ]
      ),
      [2, scout]
    )

    XCTAssertEqual(
      player.play(
        [
          0, 0, scout,
          0, 0, 0,
          0, 0, 0,
        ]
      ),
      [6, scout]
    )

    XCTAssertEqual(
      player.play(
        [
          scout, 0, 0,
          0,       0, 0,
          0,       0, 0,
        ]
      ),
      [8, scout]
    )

    XCTAssertEqual(
      player.play(
        [
          scout, 0, 0,
          0,     0, 0,
          0,     0,  scout,
        ]
      ),
      [1, scout]
    )

    let support = scout | 1 << 28
    XCTAssertEqual(
      player.play(
        [
          scout, scout, scout,
          scout, scout, scout,
          scout, scout, scout,
        ]
      ),
      [0, support]
    )

    XCTAssertEqual(
      player.play(
        [
          support, scout, scout,
          scout,   scout, scout,
          scout,   scout, scout,
        ]
      ),
      [1, support]
    )

    XCTAssertEqual(
      player.play(
        [
          support, support, support,
          support, support, support,
          support, support, scout,
        ]
      ),
      [8, support]
    )

    XCTAssertEqual(
      player.play(
        [
          support, support, scout,
          support, support, support,
          support, support, support,
        ]
      ),
      [2, support]
    )

    let supportDouble = support + (1 << 28)
    XCTAssertEqual(
      player.play(
        [
          support, support, support,
          support, support, support,
          support, support, support,
        ]
      ),
      [0, supportDouble]
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
