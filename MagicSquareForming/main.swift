//
//  [해커랭크] 매직 스퀘어(마방진)를 만들기 위해 바꿔야할 값의 최소합 구하기
//
//
//  https://www.hackerrank.com/challenges/magic-square-forming/problem
//

import Foundation

func formingMagicSquare(s: [[Int]]) -> Int {
    let magic_square = [
        [[8, 1, 6], [3, 5, 7], [4, 9, 2]],
        [[4, 3, 8], [9, 5, 1], [2, 7, 6]],
        [[2, 9, 4], [7, 5, 3], [6, 1, 8]],
        [[6, 7, 2], [1, 5, 9], [8, 3, 4]],
        [[6, 1, 8], [7, 5, 3], [2, 9, 4]],
        [[8, 3, 4], [1, 5, 9], [6, 7, 2]],
        [[4, 9, 2], [3, 5, 7], [8, 1, 6]],
        [[2, 7, 6], [9, 5, 1], [4, 3, 8]]
    ]
    
    var diff = -1
    
    for magic in magic_square {
        var sum = 0
        
        for i in 0..<3 {
            for j in 0..<3 {
                sum += abs(magic[i][j] - s[i][j])
            }
        }
        
        if diff < 0 {
            diff = sum
        } else {
            diff = (diff > sum ? sum : diff)
        }
    }
    
    return diff
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

var s = [[Int]]()

for _ in 1...3 {
    guard let sRowTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

    let sRow: [Int] = sRowTemp.split(separator: " ").map {
        if let sItem = Int($0) {
            return sItem
        } else { fatalError("Bad input") }
    }

    guard sRow.count == 3 else { fatalError("Bad input") }

    s.append(sRow)
}

guard s.count == 3 else { fatalError("Bad input") }

let result = formingMagicSquare(s: s)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
