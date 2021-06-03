//
// [프로그래머스] K번째수
//
// https://programmers.co.kr/learn/courses/30/lessons/42748
//
//

import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var result: [Int] = []
    for command in commands.enumerated() {
        result.append(array[command.element[0]-1...command.element[1]-1].sorted()[command.element[2]-1])
    }
    
    return result
}
