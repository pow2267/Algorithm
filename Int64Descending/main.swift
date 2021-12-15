//
//  [프로그래머스] 주어진 정수의 각 자릿수를 내림차순으로 바꿔 새로운 정수로 만들기
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/12933
//

import Foundation

func solution(_ n: Int64) -> Int64 {
    var result: [Int64] = []
    
    for num in String(n).map({Int64(String($0))!}) {
        if result.count == 0 {
            result.append(num)
            continue
        }
        
        for (index, value) in result.enumerated() {
            if num >= value {
                result.insert(num, at: index)
                break
            } else {
                // 🌟마지막 인덱스까지 살펴봤는데도 위 if에 속하지 않을 때🌟
                // 즉, num이 result에 속한 어느 요소보다 작은 수일 때
                if index == result.count-1 {
                    result.append(num)
                }
            }
        }
    }
    
    var total: Int64 = 0
    
    for (idx, num) in result.enumerated() {
        var times: Int64 = 1
        
        for _ in idx..<result.count-1 {
            times *= 10
        }
        
        total += (num * times)
    }
    
    return total
}
