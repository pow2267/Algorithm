//
// [해커랭크] 집에 떨어진 사과와 오렌지 개수 구하기
//
// https://www.hackerrank.com/challenges/apple-and-orange/problem
//
//

import Foundation

func countApplesAndOranges(s: Int, t: Int, a: Int, b: Int, apples: [Int], oranges: [Int]) -> Void {
    var appleCnt = apples.count
    for point in apples {
        if a + point < s || a + point > t {
            appleCnt -= 1
        }
    }
    
    var orangeCnt = oranges.count
    for point in oranges {
        if b + point < s || b + point > t {
            orangeCnt -= 1
        }
    }

    print(appleCnt)
    print(orangeCnt)
}

guard let firstMultipleInputTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let firstMultipleInput = firstMultipleInputTemp.split(separator: " ").map{ String($0) }

guard let s = Int(firstMultipleInput[0])
else { fatalError("Bad input") }

guard let t = Int(firstMultipleInput[1])
else { fatalError("Bad input") }

guard let secondMultipleInputTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let secondMultipleInput = secondMultipleInputTemp.split(separator: " ").map{ String($0) }

guard let a = Int(secondMultipleInput[0])
else { fatalError("Bad input") }

guard let b = Int(secondMultipleInput[1])
else { fatalError("Bad input") }

guard let thirdMultipleInputTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let thirdMultipleInput = thirdMultipleInputTemp.split(separator: " ").map{ String($0) }

guard let m = Int(thirdMultipleInput[0])
else { fatalError("Bad input") }

guard let n = Int(thirdMultipleInput[1])
else { fatalError("Bad input") }

guard let applesTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let apples: [Int] = applesTemp.split(separator: " ").map {
    if let applesItem = Int($0) {
        return applesItem
    } else { fatalError("Bad input") }
}

guard apples.count == m else { fatalError("Bad input") }

guard let orangesTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let oranges: [Int] = orangesTemp.split(separator: " ").map {
    if let orangesItem = Int($0) {
        return orangesItem
    } else { fatalError("Bad input") }
}

guard oranges.count == n else { fatalError("Bad input") }

countApplesAndOranges(s: s, t: t, a: a, b: b, apples: apples, oranges: oranges)
