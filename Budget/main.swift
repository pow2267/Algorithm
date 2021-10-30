//
//  [프로그래머스] 예산에 맞춰 가장 많은 부서에게 지원해주기
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/12982
//

import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    var demands = d.sorted()
    var total = 0
    var result = 0
    
    for demand in demands {
        if total + demand <= budget {
            total += demand
            result += 1
        } else {
            break
        }
    }
    
    return result
}
