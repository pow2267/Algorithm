//
//  [프로그래머스] 배열 요소의 조합을 더하거나 빼서 목표값 만들기
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/43165
//

import Foundation

var count = 0

func solution(_ numbers: [Int], _ target: Int) -> Int {
    dfs_recursive(numbers, target, 0, 0)
    
    return count
}

func dfs_recursive(_ numbers: [Int], _ target: Int, _ index: Int, _ sum: Int) {
    if index == numbers.count {
        if sum == target {
            count += 1
        }
        return
    }
    
    dfs_recursive(numbers, target, index+1, sum+numbers[index])
    dfs_recursive(numbers, target, index+1, sum-numbers[index])
}
