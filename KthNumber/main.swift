//
// [프로그래머스] K번째수
//
// https://programmers.co.kr/learn/courses/30/lessons/42748
//
//

import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var result = [Int]()
    
    for cmd in commands {
        result.append(array[cmd[0]-1...cmd[1]-1].sorted()[cmd[2]-1])
    }
    
    return result
}
