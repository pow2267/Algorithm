//
//  [해커랭크] 짝이 맞는 양말의 개수 구하기
//
//
//  https://www.hackerrank.com/challenges/sock-merchant/problem
//

import Foundation

func sockMerchant(n: Int, ar: [Int]) -> Int {
    var dic = Dictionary<Int, Int>()
    
    for color in ar {
        if let stock = dic[color] {
            dic[color] = stock + 1
        } else {
            dic[color] = 1
        }
    }
    
    var count = 0
    
    for color in dic.keys {
        count += dic[color]! / 2
    }
    
    return count
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let arTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let ar: [Int] = arTemp.split(separator: " ").map {
    if let arItem = Int($0) {
        return arItem
    } else { fatalError("Bad input") }
}

guard ar.count == n else { fatalError("Bad input") }

let result = sockMerchant(n: n, ar: ar)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
