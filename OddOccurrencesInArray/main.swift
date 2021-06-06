//
//  [코딜리티] 쌍을 이루지 않는 값 찾기
//
//
//  https://app.codility.com/programmers/lessons/2-arrays/odd_occurrences_in_array/
//

import Foundation

// you can write to stdout for debugging purposes, e.g.
// print("this is a debug message")

public func solution(_ A : inout [Int]) -> Int {
    var dic = Dictionary<Int, Int>()
    
    for i in 0..<A.count {
        if dic[A[i]] == nil {
            dic[A[i]] = 1
        } else {
            dic[A[i]]! += 1
        }
    }
    
    var result = 0
    
    for (key, value) in dic {
        if value % 2 == 1 {
            result = key
            break
        }
    }
    
    return result
}
