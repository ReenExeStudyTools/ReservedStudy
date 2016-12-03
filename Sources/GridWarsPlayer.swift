class GridWarsPlayer {
    private let  scout = 1 << 31 | 1 << 27 | 1 << 23;

    private let indexes = [
        0,      1,          2,
        3,      /* self */  5,
        6,      7,          8,
    ];

    let diagonalPriorityStep: [Int: Int] = [
        6: 2,
        2: 6,
        8: 0,
        0: 8,
        7: 1,
        1: 7,
        5: 3,
        3: 5,
    ];

    func play(_ matrix: [Int]) -> Array<Int> {
        var freeMatrix  = [Int]();
        var selfMatrix  = [Int]();
        var enemyMatrix = [Int]();

        for element in indexes {
            if matrix[element] == 0 {
                freeMatrix.append(element)
            } else if isFriend(matrix[element]) {
                selfMatrix.append(element)
            } else {
                enemyMatrix.append(element)
            }
        }

        if enemyMatrix.isEmpty {
            if selfMatrix.isEmpty {
                return [2, scout]
            }

            for (from, to) in diagonalPriorityStep {
                if selfMatrix.contains(from) && freeMatrix.contains(to) {
                    return [to, scout]
                }
            }

            if let free = freeMatrix.first {
                return [free, scout]
            }
        }

        return [8, scout]
    }

    private func isFriend(_ point: Int) -> Bool {
        return point == scout
    }
}