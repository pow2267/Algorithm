//
//  [프로그래머스] 약수의 개수에 따른 숫자 합/차 구하기
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/77884
//

import Foundation

func solution(_ left: Int, _ right: Int) -> Int {
    var sum: Int = 0
    
    for i in left...right {
        var count = countDivisor(i)
        
        // 짝수
        if count % 2 == 0 {
            sum += i
        } else {
            sum -= i
        }
    }
    
    return sum
}

private func countDivisor(_ num: Int) -> Int {
    if num == 1 {
        return num
    }
    
    var count = 2 // 약수에는 무조건 1과 자기 자신이 포함되므로
    
    for i in 2..<num {
        if num % i == 0 {
            count += 1
        }
    }
    
    return count
}
