//
//  [프로그래머스] 짝지어 제거하기
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/12973
//

import Foundation

func solution(_ s: String) -> Int{
    var chars = [Character]()
    
    s.forEach {
        chars.append($0)
    }
    
    var i = 0
    
    while i < chars.count-1 {
        if chars[i] == chars[i+1] {
            chars.remove(at: i+1)
            chars.remove(at: i)
            if chars.count < 2 {
                break
            }
            if i > 0 {
                i -= 1
            }
        } else {
            i += 1
        }
    }
    
    return (chars.count == 0 ? 1 : 0)
}
