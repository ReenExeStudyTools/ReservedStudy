import XCTest
@testable import GridWarsPlayer

class GridWarsPlayerTests: XCTestCase {
    func testSimple() {
        let scout = 1 << 31 | 1 << 27 | 1 << 23
        let player = GridWarsPlayer()

        // Covers all free around
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
                    0, 0, 0,
                    0, 0, 0,
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
                    0, 0, 0,
                    0, 0, 0,
                ]
            ),
            [8, scout]
        )

        XCTAssertEqual(
            player.play(
                [
                    scout, 0, 0,
                    0, 0, 0,
                    0, 0, scout,
                ]
            ),
            [1, scout]
        )

        // Covers support around
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
                    scout, scout, scout,
                    scout, scout, scout,
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

        let supportMax = scout | (0b111 << 28)
        XCTAssertEqual(
            player.play(
                [
                    supportMax, supportMax, supportMax,
                    supportMax, supportMax, supportMax,
                    supportMax, supportMax, supportMax,
                ]
            ),
            [0, support]
        )

        // Covers enemy front
        let enemy = 0b101010
        XCTAssertEqual(
            player.play(
                [
                    enemy, enemy, enemy,
                    scout, scout, scout,
                    scout, scout, scout,
                ]
            ),
            [1, scout]
        )

        XCTAssertEqual(
            player.play(
                [
                    enemy, enemy, enemy,
                    supportMax, supportMax, supportMax,
                    supportMax, supportMax, supportMax,
                ]
            ),
            [1, scout]
        )

        XCTAssertEqual(
            player.play(
                [
                    scout, scout, enemy,
                    scout, scout, enemy,
                    scout, scout, enemy,
                ]
            ),
            [5, scout]
        )

        XCTAssertEqual(
            player.play(
                [
                    enemy, scout, scout,
                    enemy, scout, scout,
                    enemy, scout, scout,
                ]
            ),
            [3, scout]
        )

        XCTAssertEqual(
            player.play(
                [
                    scout, scout, scout,
                    scout, scout, scout,
                    enemy, enemy, enemy,
                ]
            ),
            [7, scout]
        )

        // Covers one enemy
        XCTAssertEqual(
            player.play(
                [
                    scout, scout, scout,
                    enemy, scout, scout,
                    scout, scout, scout,
                ]
            ),
            [3, scout]
        )

        XCTAssertEqual(
            player.play(
                [
                    scout, scout, scout,
                    scout, scout, scout,
                    enemy, scout, scout,
                ]
            ),
            [3, scout]
        )

        XCTAssertEqual(
            player.play(
                [
                    scout, scout, enemy,
                    scout, scout, scout,
                    scout, scout, scout,
                ]
            ),
            [1, scout]
        )
    }
}

extension GridWarsPlayerTests {
    static var allTests: [(String, (GridWarsPlayerTests) -> () throws -> Void)] {
        return [
            ("testSimple", testSimple)
        ]
    }
}
