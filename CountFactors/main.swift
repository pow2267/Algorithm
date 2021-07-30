//
//  [코딜리티] 약수의 개수 구하기
//
//
//  https://app.codility.com/programmers/lessons/10-prime_and_composite_numbers/count_factors/
//

import Foundation

public func solution(_ N : Int) -> Int {
    var factors = Set<Int>()
    var index = 1

    while index * index <= N {
        if N % index == 0 {
            factors.insert(index)
            factors.insert(N / index)
        }

        index += 1
    }

    return factors.count
}
