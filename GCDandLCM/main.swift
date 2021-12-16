//
//  [프로그래머스] 최대공약수와 최소공배수 구하기
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/12940
//

import Foundation

func solution(_ n: Int, _ m: Int) -> [Int] {
    var large = 0
    var small = 0
    
    if n > m {
        large = n
        small = m
    } else if n < m {
        large = m
        small = n
    } else {
        // 숫자 n과 m이 같은 수일 때 최대공약수 = 최소공배수
        return [n, m]
    }
    
    // 유클리드 호제법
    // Ex. (142, 16)(처음 n과 m) -> (16, 14)(그 다음 m과 n%m) -> (14, 2) -> (2,0) 마지막 나머지가 0이면 끝!
    while small > 0 {
        let temp = small
        small = (large % small)
        large = temp
    }
    
    return [large, (n * m / large)]
}
