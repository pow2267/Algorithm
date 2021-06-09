//
//  [해커랭크] 페이지 넘김 횟수 구하기
//
//
//  https://www.hackerrank.com/challenges/drawing-book/problem
//

import Foundation

func pageCount(n: Int, p: Int) -> Int {
    var count = 0
    
    if p - 1 < n - p - (n%2) { // 앞에서부터
        while 1 + 2*count < p {
            count += 1
        }
    } else { // 뒤에서부터
        while n - n%2 - 2*count > p {
            count += 1
        }
    }
    return count
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let p = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

let result = pageCount(n: n, p: p)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
