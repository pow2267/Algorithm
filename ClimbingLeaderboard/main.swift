//
//  [해커랭크] 플레이어의 점수에 따른 리더 보드 등수 구하기
//
//
//  https://www.hackerrank.com/challenges/climbing-the-leaderboard/problem
//

import Foundation

func climbingLeaderboard(ranked: [Int], player: [Int]) -> [Int] {
    var result = [Int]()
    var r = [Int]()
    
    for value in ranked {
        // 중복값 제거 (100 90 90 80 일 때, 각각 1, 2, 2, 3등이므로 중복을 갖고 있을 필요X)
        if r.last != value {
            r.append(value)
        }
    }
    
    // 뒤에서부터 값 비교. 플레이어의 점수는 항상 같거나 증가하므로
    // 항상 점수가 증가하므로 등수는 전과 같거나 높을 수밖에 없으므로
    // 굳이 플레이어의 점수를 r에 append해서 이어붙이지 않아도 됨
    var index = r.count-1
    
    for score in player {
        while index >= 0 {
            if score > r[index] {
                index -= 1
            } else if score == r[index] {
                result.append(index+1)
                break
            } else {
                index += 1
                result.append(index+1)
                // index가 배열 r의 길이보다 클 때 항상 마지막 값으로 고정시켜줌
                index = (index > r.count - 1 ? r.count - 1 : index)
                break
            }
            
            // index가 -1일 때(가장 높은 점수보다 score가 더 높을 때)
            if index < 0 {
                index = 0 //
                result.append(index+1)
                break
            }
        }
    }
    
    return result
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let rankedCount = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let rankedTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let ranked: [Int] = rankedTemp.split(separator: " ").map {
    if let rankedItem = Int($0) {
        return rankedItem
    } else { fatalError("Bad input") }
}

guard ranked.count == rankedCount else { fatalError("Bad input") }

guard let playerCount = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let playerTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let player: [Int] = playerTemp.split(separator: " ").map {
    if let playerItem = Int($0) {
        return playerItem
    } else { fatalError("Bad input") }
}

guard player.count == playerCount else { fatalError("Bad input") }

let result = climbingLeaderboard(ranked: ranked, player: player)

fileHandle.write(result.map{ String($0) }.joined(separator: "\n").data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
