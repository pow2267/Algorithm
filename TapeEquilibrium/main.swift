//
//  [코딜리티] 테이프를 반으로 나누어 양쪽의 값을 뺀 절대값의 최소값 구하기
//
//
//  https://app.codility.com/c/run/training6DK7KN-FTK/
//

import Foundation

func solution(_ A : inout [Int]) -> Int {
    var leftSum = 0
    var rightSum = 0
    A.forEach {
        rightSum += $0
    }
    var difference = 0
    var result = 0

    for i in 1..<A.count {
        leftSum += A[i-1]
        rightSum -= A[i-1]
        difference = abs(leftSum-rightSum)

        if i == 1 {
            result = difference
        } else {
            result = (result > difference ? difference : result)
        }
    }

    return result
}
