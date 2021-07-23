//
//  [코딜리티] 부분 집합의 합 중 조건을 만족하는 최대값 구하기
//
//
//  https://app.codility.com/programmers/lessons/9-maximum_slice_problem/max_double_slice_sum/
//

import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    var leftSum = Array(repeating: 0, count: A.count)
    var rightSum = Array(repeating: 0, count: A.count)
    var result = 0

    for i in 1..<A.count-1 {
        leftSum[i] = max(0, leftSum[i-1] + A[i])
    }

    for i in (1..<A.count-1).reversed() {
        rightSum[i] = max(0, rightSum[i+1] + A[i])
    }

    for i in 1..<A.count-1 {
        result = max(result, leftSum[i-1] + rightSum[i+1])
    }

    return result
}
