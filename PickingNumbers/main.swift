//
//  [해커랭크] 같거나 혹은 차가 1인 숫자들의 개수 중 가장 큰 값 구하기
//
//
//  https://www.hackerrank.com/challenges/picking-numbers/problem
//

import Foundation

func pickingNumbers(a: [Int]) -> Int {
    var dic = Dictionary<Int, Int>()
    var nums = [Int]()
    var set = Set<Int>()
    
    for i in a {
        if let count = dic[i] {
            dic[i] = count + 1
        } else {
            dic[i] = 1
        }
        
        if !set.contains(i) {
            set.insert(i)
            nums.append(i)
        }
    }
    
    nums.sort()
    var result = 0

    for num in nums {
        if let after = dic[num+1] { // 연속된 숫자가 있을 때
            result = max(after+dic[num]!, result)
        } else { // 연속된 숫자가 없을 때
            result = max(dic[num]!, result)
        }
    }
    
    return result
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let aTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let a: [Int] = aTemp.split(separator: " ").map {
    if let aItem = Int($0) {
        return aItem
    } else { fatalError("Bad input") }
}

guard a.count == n else { fatalError("Bad input") }

let result = pickingNumbers(a: a)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
