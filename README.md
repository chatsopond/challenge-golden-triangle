# Golden Triangle

A golden triangle has the length of all sides that always less than the sum of the remaining sides.

For example,

A triangle with side lengths 10, 5, 8 is a golden triangle because
- 10 + 5 > 8
- 10 + 8 > 5
- 5 + 8 > 10

A triangle with side lengths 3, 4, 20 is **not** a golden triangle because
- 3 + 4 > 20 **is false**

Let T be an array of integers of size N.

N is a positive integer with values >= 0 and <= 100,000.
The values in Array T are in range from **−2,147,483,648 to 2,147,483,647.**

Example 1
T = [10,2,5,1,8,20]
the function will return true.
due to
T[0]=10, T[2]=(5), T[4]=(8)
can create a golden triangle as explianed in the example above

Example 2
T = [10,50,5,1]
the function will return false
Since there are no values in the array that can create a golden triangle.

## Solution

Download full code [here](solution.swift)



```swift
func solution(_ A : [Int]) -> Int {
    let b = A.sorted()
    guard b.count >= 3 else { return 0 }
    guard let startIndex = b.firstNonNegativeIndex() else { return 0 }
    guard startIndex <= b.count - 2 else { return 0 }
    for i in 0..<b.count-2 {
        if b[i] > b[i + 2] - b[i + 1] { return 1 }
    }
    return 0
}
```
