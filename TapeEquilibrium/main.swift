//
//  [코딜리티] 테이프를 반으로 나누어 양쪽의 값을 뺀 절대값의 최소값 구하기
//
//
//  https://app.codility.com/c/run/training6DK7KN-FTK/
//

import Foundation

func solution(_ A : inout [Int]) -> Int {
    var left = 0
    var right = 0
    var index = 0
    var result = 0

    for i in 1..<A.count {
        left = 0
        right = 0

        index = i
        repeat {
            index -= 1
            left += A[index]
        } while index > 0

        index = i
        repeat {
            right += A[index]
            index += 1
        } while index < A.count
        
        if i == 1 {
            result = abs(left-right)
        } else {
            result = (result > abs(left-right) ? abs(left-right) : result)
        }
    }

    return result
}
