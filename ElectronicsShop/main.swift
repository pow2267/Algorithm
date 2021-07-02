//
//  [해커랭크] 주어진 예산 안에서 구매할 수 있는 가장 비싼 장비 총 비용 구하기
//
//
//  https://www.hackerrank.com/challenges/electronics-shop/problem
//

import Foundation

func getMoneySpent(keyboards: [Int], drives: [Int], b: Int) -> Int {
    var max_cost = -1
    
    for i in 0..<keyboards.count {
        for j in 0..<drives.count {
            let cost = keyboards[i] + drives[j]
    
            if cost <= b && cost > max_cost {
                max_cost = cost
            }
        }
    }
    
    return max_cost
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let bnmTemp = readLine() else { fatalError("Bad input") }
let bnm = bnmTemp.split(separator: " ").map{ String($0) }

guard let b = Int(bnm[0].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let n = Int(bnm[1].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let m = Int(bnm[2].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let keyboardsTemp = readLine() else { fatalError("Bad input") }
let keyboards: [Int] = keyboardsTemp.split(separator: " ").map {
    if let keyboardsItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return keyboardsItem
    } else { fatalError("Bad input") }
}

guard keyboards.count == n else { fatalError("Bad input") }

guard let drivesTemp = readLine() else { fatalError("Bad input") }
let drives: [Int] = drivesTemp.split(separator: " ").map {
    if let drivesItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return drivesItem
    } else { fatalError("Bad input") }
}

guard drives.count == m else { fatalError("Bad input") }

/*
 * The maximum amount of money she can spend on a keyboard and USB drive, or -1 if she can't purchase both items
 */

let moneySpent = getMoneySpent(keyboards: keyboards, drives: drives, b: b)

fileHandle.write(String(moneySpent).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
