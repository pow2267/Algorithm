//
//  [프로그래머스] 크레인 인형뽑기 게임
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/64061
//

import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var vBoard = board
    var moved = [Int]()
    var count = 0
    
    moves.forEach { move in
        for (i, b) in vBoard.enumerated() {
            if b[move-1] > 0 {
                if (moved.count > 0 ? moved.last : 0) == b[move-1]{
                    count += 2
                    moved.removeLast()
                } else {
                    moved.append(b[move-1])
                }
                vBoard[i][move-1] = 0
                break
            }
        }
    }
    
    return count
}

print(solution([[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]], [1,5,3,5,1,2,1,4]))
