//
//  [코딜리티] 겹치는 디스크 조합의 수 구하기
//
//
//  https://app.codility.com/c/run/trainingC9QPZN-P2J/
//

import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    var result = 0
    var points = [[Int]]()

    for (i, v) in A.enumerated() {
        points.append([i-v, i+v])
        for j in 0..<i {
            if points[j][1] < points[i][0] {
                continue
            }
            result += 1
        }
    }

    return (result > 0 ? result : -1)
}
