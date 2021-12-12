//
//  [프로그래머스] 소수 찾기
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/12921
//

import Foundation

func solution(_ n: Int) -> Int {
    var count = 2
    
    if n == 2 {
        return 1
    } else if n == 3 {
        return 2
    }
    
    for i in 4...n {
        var num = 2
        var isPrime = true
        
        while num * num <= i {
            if i % num == 0 {
                isPrime = false
                break
            }
            
            num += 1
        }
        
        if isPrime {
            count += 1
        }
    }
    
    return count
}
