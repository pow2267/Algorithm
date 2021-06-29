//
//  [프로그래머스] 짝지어 제거하기
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/12973
//

import Foundation

func solution(_ s: String) -> Int{
    var chars = [Character]()
    var result = [Character]()
    
    s.forEach {
        chars.append($0)
    }
    
    for c in chars {
        if result.isEmpty {
            result.append(c)
        } else {
            if result.last == c {
                result.removeLast()
            } else {
                result.append(c)
            }
        }
    }

    return (result.isEmpty ? 1 : 0)
}
