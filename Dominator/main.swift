//
//  [코딜리티] 배열의 절반 이상을 차지하는 도미네이터의 인덱스 반환하기
//
//
//  https://app.codility.com/programmers/lessons/8-leader/dominator/
//

import Foundation
import Glibc

public func solution(_ A : inout [Int]) -> Int {
    var dic = Dictionary<Int, Int>()
    
    A.forEach {
        if dic[$0] == nil {
            dic[$0] = 1
        } else {
            dic[$0]! += 1
        }
    }

    var dmn = 0 // dmn: dominator
    var idx = 0 // idx: dominator's index
    var cnt = 0 // cnt: dominator's count
    
    for (key, value) in dic { // key: 숫자, value: 숫자가 나온 횟수
        if value > A.count/2 && value > cnt {
            cnt = value
            dmn = key
        }
    }

    if cnt == 0 {
        return -1
    }
    
    for (index, value) in A.enumerated() {
        if value == dmn {
            idx = index
            break
        }
    }

    return idx
}
