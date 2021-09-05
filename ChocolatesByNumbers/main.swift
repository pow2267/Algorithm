//
//  [코딜리티] 규칙에 따라 초콜렛을 먹은 뒤 껍질을 내려놓는데, 다음번에 초콜렛 껍질을 마주치기 전까지 먹을 수 있는 초콜렛의 개수 구하기
//
//
//  https://app.codility.com/programmers/lessons/12-euclidean_algorithm/chocolates_by_numbers/
//

import Foundation

public func solution(_ N: Int, _ M: Int) -> Int {
    var result: [Int] = [0]
    var number = 0
    var share = 0

    while true {
        number += M
        share = number % N

        if result.contains(share) {
            break
        } else {
            result.append(share)
        }
    }

    return result.count
}
