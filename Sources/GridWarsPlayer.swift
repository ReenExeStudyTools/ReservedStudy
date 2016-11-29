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
        var partnerMatrix:[Int] = [];

        for element in indexes {
            if matrix[element] == 0 {
                freeMatrix.append(element)
            } else if matrix[element] == current {
                selfMatrix.append(element)
            } else {
                partnerMatrix.append(element)
            }
        }

        return [1, 1, 1, current]
    }
}