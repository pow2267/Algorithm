//
//  [코딜리티] 테이프를 반으로 나누어 양쪽의 값을 뺀 절대값의 최소값 구하기
//
//
//  https://app.codility.com/c/run/training6DK7KN-FTK/
//

import Foundation

func solution(_ A : inout [Int]) -> Int {
    var totalSum = 0
    var devidedSum = 0
    var index = 0
    var result = 0
    var absSubtraction = 0

    A.forEach {
        totalSum += $0
    }

    for i in 1..<A.count {
        index = i
        devidedSum = 0
        
        if i <= A.count/2 {
            repeat {
                index -= 1
                devidedSum += A[index]
            } while index > 0
        } else {
            repeat {
                devidedSum += A[index]
                index += 1
            } while index < A.count
        }
        
        absSubtraction = abs(totalSum - devidedSum*2)

        if i == 1 {
            result = absSubtraction
        } else {
            result = (result < absSubtraction ? result : absSubtraction)
        }
    }

    return result
}
