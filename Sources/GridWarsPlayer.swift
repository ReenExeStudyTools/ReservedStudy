class GridWarsPlayer {
    func play(matrix: [Int]) -> Array<Int> {
        let current = 1 << 31;

        let indexes = [
                0,      1,          2,
                3,      /* self */  5,
                6,      7,          8,
        ];

        var freeMatrix  = [Int]();
        var selfMatrix  = [Int]();
        var enemyMatrix = [Int]();

        for element in indexes {
            if matrix[element] == 0 {
                freeMatrix.append(element)
            } else if matrix[element] == current {
                selfMatrix.append(element)
            } else {
                enemyMatrix.append(element)
            }
        }

        if enemyMatrix.isEmpty {
            if selfMatrix.isEmpty {
                return [2, current]
            }

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

            for (from, to) in diagonalPriorityStep {
                if selfMatrix.contains(from) && freeMatrix.contains(to) {
                    return [to, current]
                }
            }
        }

        return [8, current]
    }
}