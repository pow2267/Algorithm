//
//  [프로그래머스] 우선 순위 높은 문서를 먼저 프린트한다고 했을 때, 특정 문서가 프린트 될 순서 구하기
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/42587
//

import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var docs = priorities
    var target = location
    var count = 0
    var first = 0
    
    while target > -1 {
        first = docs.removeFirst()
        target -= 1
        count += 1
        
        for doc in docs {
            if first < doc {
                docs.append(first)
                count -= 1
                
                if target == -1 {
                    target += docs.count
                }
                break
            }
        }
    }
    
    return count
}
