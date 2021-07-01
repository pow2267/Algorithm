//
//  [코딜리티] 벽을 만들기 위해 필요한 벽돌의 최소 개수 구하기
//
//
//  https://app.codility.com/programmers/lessons/7-stacks_and_queues/stone_wall/
//

import Foundation
import Glibc

public func solution(_ H : inout [Int]) -> Int {
    var count = 0

    // use queue
    while !H.isEmpty {
        count += 1
        let value = H.removeLast()
        var index = H.count-1
        
        while index >= 0 && value <= H[index] {
            H[index] -= value
            index -= 1
        }
        
        // 0인 요소를 제외하되, 가장 첫번째 요소부터 연속된 0만 제외
        while !H.isEmpty {
            if H.last == 0 {
                H.removeLast()
            } else {
                break
            }
        }
    }

    return count
}
