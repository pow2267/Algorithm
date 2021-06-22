//
//  [프로그래머스] 3개의 수를 조합하여 소수가 되는 경우의 수 찾기
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/12977
//

import Foundation

func solution(_ nums:[Int]) -> Int {
    var count = 0
    
    for a in 0..<nums.count-2 {
        for b in 1..<nums.count-1 {
            for c in 2..<nums.count {
                if a < b && b < c {
                    if isPrimeNumber(nums[a]+nums[b]+nums[c]) {
                        count += 1
                    }
                }
            }
        }
    }

    return count
}

func isPrimeNumber(_ num: Int) -> Bool {
    var i = 1

    repeat {
        i += 1
        if num % i == 0 {
            return false
        }
    } while i*i <= num

    return true
}
