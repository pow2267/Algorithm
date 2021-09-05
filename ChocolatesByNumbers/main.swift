//
//  [코딜리티] 규칙에 따라 초콜렛을 먹은 뒤 껍질을 내려놓는데, 다음번에 초콜렛 껍질을 마주치기 전까지 먹을 수 있는 초콜렛의 개수 구하기
//
//
//  https://app.codility.com/programmers/lessons/12-euclidean_algorithm/chocolates_by_numbers/
//

import Foundation
import Glibc

public func solution(_ N: Int, _ M: Int) -> Int {
    var large = (N >= M ? N : M)
    var small = (N >= M ? M : N)
    var temp = 0

    while large % small != 0 {
        temp = large % small // 몫
        large = small
        small = temp
    }

    return (N / small)
}
