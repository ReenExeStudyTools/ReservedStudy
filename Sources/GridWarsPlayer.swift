class GridWarsPlayer {
  private let scout = 1 << 31 | 1 << 27 | 1 << 23

  private let supportShift = 28

  private let indexes = [
    0,      1,          2,
    3,      /* self */  5,
    6,      7,          8,
  ]

  private let diagonalPriorityStep = [
    6: 2,
    2: 6,
    8: 0,
    0: 8,
    7: 1,
    1: 7,
    5: 3,
    3: 5,
  ]

  private let enemyLineList = [
    [0, 1, 2],
    [2, 5, 8],
    [6, 7, 8],
    [0, 3, 6],
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

      let band = 0b111 << supportShift
      var min = band
      var result = 0

      for element in friendMatrix {
        let friend = matrix[element] & band
        if friend < min {
          min = friend
          result = element
        }
      }

      if min == band {
        return [result, matrix[result] ^ band | 1 << supportShift]
      }

      return [result, matrix[result] + (1 << supportShift)]
    }

    if enemyMatrix.count == 3 {
      let enemySet = Set(enemyMatrix)
      for enemyLine in enemyLineList {
        if (Set(enemyLine).isSubset(of: enemySet)) {
          return [enemyLine[1], scout]
        }
      }
    }

    return [1, scout]
  }

  private func isFriend(_ point: Int) -> Bool {
    return (point & scout) > 0
  }
}