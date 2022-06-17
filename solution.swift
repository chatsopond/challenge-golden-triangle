import Foundation

extension Collection where Iterator.Element == Int {
    // For a sorted array
    func firstNonNegativeIndex() -> Int? {
        guard let A = self as? [Int] else { fatalError("It's not a array of Int") }
        var candidate: Int? = nil
        var start = 0
        var end = count - 1
        while start <= end {
            let middleIndex = (start + end) / 2
            let middleValue = A[middleIndex]
            if middleValue >= 0 {
                end = middleIndex - 1
                candidate = middleIndex
            } else {
                start = middleIndex + 1
            }
        }
        return candidate
    }
}

func solution(_ A : [Int]) -> Int {
    let b = A.sorted()
    guard b.count >= 3 else { return 0 }
    guard let startIndex = b.firstNonNegativeIndex() else { return 0 }
    guard startIndex <= b.count - 2 else {
        return 0 }
    for i in 0..<b.count-2 {
        if b[i] > b[i + 2] - b[i + 1] { return 1 }
    }
    return 0
}

let testcases: [(input: [Int], output: Int)] = [
    ([10,2,5,1,8,20], 1),
    ([10,50,5,1], 0),
    ([10,0], 0),
    ([-10,10,10], 0),
    ([-2_147_483_100, -2_147_483_200, -2_147_483_300], 0)
]

for testcase in testcases {
    print(solution(testcase.input) == testcase.output ? "✅ Pass" : "❌ Fail")
}
