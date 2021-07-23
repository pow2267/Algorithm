//
//  [코딜리티] 부분 집합의 합 중 조건을 만족하는 최대값 구하기
//
//
//  https://app.codility.com/programmers/lessons/9-maximum_slice_problem/max_double_slice_sum/
//

import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    var maxResult = 0

    for X in 0..<A.count-2 {
        for Y in X+1..<A.count-1 {
            for Z in Y+1..<A.count {
                maxResult = max(maxResult, A[X+1...Z-1].reduce(0){$0+$1} - A[Y])
            }
        }
    }

    return maxResult
}
