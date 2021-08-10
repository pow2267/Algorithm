//
//  [코딜리티] 배열의 요소 중 다른 요소의 약수가 아닌 요소의 개수 구하기
//
//
//  https://app.codility.com/programmers/lessons/11-sieve_of_eratosthenes/count_non_divisible/
//

import Foundation

public func solution(_ A : inout [Int]) -> [Int] {
    var result: [Int] = Array(repeating: 0, count: A.count)
    var divisors: Set<Int> = []

    for (index1, value1) in A.enumerated() {
        divisors = findDivisors(value1)

        for value2 in A {
            if !divisors.contains(value2) {
                result[index1] += 1
            }
        }
    }

    return result
}

private func findDivisors(_ num: Int) -> Set<Int> {
    var divisors: Set<Int> = []
    
    for i in 1..<num {
        if i * i > num {
            break
        }

        if num % i == 0 {
            divisors.insert(i)
            divisors.insert(num / i)
        }
    }
    divisors.insert(num)

    return divisors
}
