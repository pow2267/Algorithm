//
//  [해커랭크] 계곡의 수 세기 (계곡은 sea level 아래에서 시작하고, sea level 위에서 끝난다)
//
//
//  https://www.hackerrank.com/challenges/counting-valleys/problem
//

import Foundation

func countingValleys(steps: Int, path: String) -> Int {
    var count = 0
    var sum = 0
    var paths = [0]
    
    path.forEach {
        if $0 == "U" {
            sum += 1
        } else {
            sum -= 1
        }
        paths.append(sum)
        
        if sum == 0 && (paths[paths.count-2] ?? 0) < 0 {
            count += 1
        }
    }

    return count
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let steps = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let path = readLine() else { fatalError("Bad input") }

let result = countingValleys(steps: steps, path: path)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
