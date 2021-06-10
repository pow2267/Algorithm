//
//  [프로그래머스] 크레인 인형뽑기 게임
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/64061
//

import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var columns = [[Int]](repeating: [Int](), count: board.count)
    
    for b in board { // 각 행을 열 별로 재정리
        for (j, v) in b.enumerated() {
            if v > 0 {
                columns[j].append(v)
            }
        }
    }
    
    var moved = [Int]()
    var count = 0
    
    for move in moves {
        if columns[move-1].count > 0 { // 집게가 집은 열에 무언가 존재할 때
            if moved.count == 0 { // 집게가 옮긴 통이 비었을 때
                moved.append(columns[move-1].first!)
            } else {
                if columns[move-1].first == moved.last {
                    count += 2 // 집게가 집은 인형과 통의 맨 위에 있는 인형 합쳐 두 개
                    moved.removeLast() // 통에 있는 인형 사라짐
                } else {
                    moved.append(columns[move-1].first!) // 인형을 통에 쌓음
                    
                }
            }
            columns[move-1].removeFirst() // 집게로 집은 인형 사라짐
        }
    }
    
    return count
}

print(solution([[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]], [1,5,3,5,1,2,1,4]))
