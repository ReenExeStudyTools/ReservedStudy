class GridWarsPlayer {
    private let scout = 1 << 31 | 1 << 27 | 1 << 23

    private let indexes = [
        0,      1,          2,
        3,      /* self */  5,
        6,      7,          8,
    ]

    let diagonalPriorityStep: [Int: Int] = [
        6: 2,
        2: 6,
        8: 0,
        0: 8,
        7: 1,
        1: 7,
        5: 3,
        3: 5,
    ]

    func play(_ matrix: [Int]) -> Array<Int> {
        var freeMatrix = [Int]()
        var friendMatrix = [Int]()
        var enemyMatrix = [Int]()

        for element in indexes {
            if matrix[element] == 0 {
                freeMatrix.append(element)
            } else if isFriend(matrix[element]) {
                friendMatrix.append(element)
            } else {
                enemyMatrix.append(element)
            }
        }

        if enemyMatrix.isEmpty {
            if friendMatrix.isEmpty {
                return [2, scout]
            }

            for (from, to) in diagonalPriorityStep {
                if friendMatrix.contains(from) && freeMatrix.contains(to) {
                    return [to, scout]
                }
            }

            if let free = freeMatrix.first {
                return [free, scout]
            }

            let band = 0b111 << 28
            var min = band
            var result = 0

            for element in friendMatrix {
                let friend = matrix[element] & band
                if friend < min {
                    min = friend
                    result = element
                }
            }

            return [result, matrix[result] + 1 << 28]
        }

        return [1, scout | 1 << 28]
    }

    private func isFriend(_ point: Int) -> Bool {
        return (point & scout) > 0
    }
}