//
//  [프로그래머스] 거리두기
//  ⭐️
//
//  https://programmers.co.kr/learn/courses/30/lessons/81302
//

import Foundation

func solution(_ places:[[String]]) -> [Int] {
    var result: [Int] = []
    
    for place in places {
        var seats: [[String]] = []
        var positions = Array(repeating: Array(repeating: 0, count: 5), count: 5)
        
        for (index, room) in place.enumerated() {
            let seat: [String] = room.map({String($0)})
            seats.append(seat)
            
            for (i, s) in seat.enumerated() {
                if s == "P" {
                    // 사람이 앉은 좌석과 상하좌우를 각각 -1 해줌
                    positions[index][i] -= 1
                    
                    if index + 1 < 5 {
                        positions[index+1][i] -= 1
                    }
                    
                    if index - 1 > 0 {
                        positions[index-1][i] -= 1
                    }
                    
                    if i + 1 < 5 {
                        positions[index][i+1] -= 1
                    }
                    
                    if i - 1 > 0 {
                        positions[index][i-1] -= 1
                    }
                }
                
                // 파티션이 있는 자리는 -2보다 큰 값을 주어 더함
                if s == "X" {
                    positions[index][i] += 5
                }
            }
        }
        
        var isSpaceAvailable = true
        
        for i in 0..<5 {
            for j in 0..<5 {
                // 사람이 앉은 좌석과 그 상하좌우가 겹쳐 -2 이하가 되면 파티션이 없거나 혹은 충분히 떨어져 앉지 않았다는 것이므로
                // 거리두기가 되지 않은 것
                if positions[i][j] <= -2 {
                    isSpaceAvailable = false
                }
            }
        }
        
        result.append((isSpaceAvailable ? 1 : 0))
    }
    
    return result
}
