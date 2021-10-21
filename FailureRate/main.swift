//
//  [프로그래머스] 실패율을 구해 내림차순으로 정렬된 스테이지를 반환하기
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/42889
//

import Foundation

func solution(_ N: Int, _ stages: [Int]) -> [Int] {
    var cleared = Array(repeating: Double(0), count: N + 1)
    var stayed = Array(repeating: Double(0), count: N + 1)
    var failure = Array(repeating: Double(0), count: N)
    
    stages.forEach({ (stage) in
        for i in 0..<stage {
            cleared[i] += 1
        }
        
        stayed[stage - 1] += 1
    })
    
    for i in 0..<failure.count {
        if stayed[i] == 0 {
            failure[i] = 0
        } else {
            failure[i] = stayed[i] / cleared[i]
        }
    }
    
    var result = Array(repeating: 0, count: N)
    
    for i in 0..<failure.count {
        var index = -1
        var failureRate = Double(-1)
        
        for j in 0..<failure.count {
            if failure[j] > failureRate {
                index = j
                failureRate = failure[j]
            }
        }
        
        result[i] = index + 1
        failure[index] = -1
    }
    
    return result
}
