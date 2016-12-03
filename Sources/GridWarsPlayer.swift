class GridWarsPlayer {
    func play(matrix: [Int]) -> Array<Int> {
        let current = 1 << 31;

        let indexes = [
                0,      1,          2,
                3,      /* self */  5,
                6,      7,          8,
        ];

        var freeMatrix:[Int] = [];
        var selfMatrix:[Int] = [];
        var enemyMatrix:[Int] = [];

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
            if freeMatrix.count == 8 {
                return [2, 2, 2, current]
            }
        }

        return [8, 8, 8, current]
    }
}