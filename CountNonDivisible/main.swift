//
//  [코딜리티] 배열의 요소 중 다른 요소의 약수가 아닌 요소의 개수 구하기
//
//
//  https://app.codility.com/programmers/lessons/11-sieve_of_eratosthenes/count_non_divisible/
//

import Foundation

public func solution(_ A : inout [Int]) -> [Int] {
    let aCount = A.count

    // 배열 A의 요소가 가질 수 있는 범위는 1~2*A.count (조건에 명시)
    // 1을 더해주는 건 배열의 0번째를 사용하지 않기 위함
    var elements = Array(repeating: 0, count: (aCount * 2) + 1)

    // 배열 A의 각 요소값에 해당하는 elements배열에 요소의 개수 만큼 +1
    // Ex. A[0] = 3 이면 elements[3] = 1
    for i in 0..<aCount {
        elements[A[i]] += 1
    }

    // non-divisor 요소의 개수
    var nonDivisors = Array(repeating: 0, count: aCount)

    for i in 0..<aCount {
        var divisors = 0
        var j = 1

        // A[i]의 약수 구하기
        while j * j <= A[i] {
            if A[i] % j == 0 {
                // A[i]의 약수에 해당하는 A의 요소의 개수를 합산
                divisors += elements[j]

                // A[i]가 j의 제곱일 경우 제외
                if A[i] / j != j {
                    divisors += elements[A[i]/j]
                }
            }
            
            j += 1
        }
        
        // 약수가 아닌 요소의 개수의 합이니까 총 개수에서 약수의 개수를 빼줌
        nonDivisors[i] = aCount - divisors
    }

    return nonDivisors
}

var test = [3, 1, 2, 3, 6]
print(solution(&test))
