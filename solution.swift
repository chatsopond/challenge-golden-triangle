import Foundation

func solution(_ A : [Int]) -> Int {
    let b = A.sorted()
    guard b.count >= 3 else { return 0 }
    for i in 0..<b.count-2 {
        if b[i] > b[i + 2] - b[i + 1] { return 1 }
    }
    return 0
}

let testcases: [(input: [Int], output: Int)] = [
    ([10,2,5,1,8,20], 1),
    ([10,50,5,1], 0),
    ([10,0], 0),
    ([-10,10,10], 0)
]

for testcase in testcases {
    print(solution(testcase.input) == testcase.output ? "✅ Pass" : "❌ Fail")
}
