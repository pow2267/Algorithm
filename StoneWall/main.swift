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
    var stack = [Int]()

    // use stack
    for value in H {
        while stack.count > 0 && stack.last! > value {
            stack.removeLast()
        }

        if stack.count == 0 || stack.last! < value {
            stack.append(value)
            count += 1
        }
    }

    return count
}
