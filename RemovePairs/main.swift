//
//  [프로그래머스] 짝지어 제거하기
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/12973
//

import Foundation

func solution(_ s: String) -> Int{
    var chars = [Character]()
    var overlap = true
    
    s.forEach {
        chars.append($0)
    }
    
    repeat {
        overlap = checkOverlap(chars).0
        chars = checkOverlap(chars).1
    } while overlap && chars.count > 0
    
    return (chars.count == 0 ? 1 : 0)
}

func checkOverlap(_ c: [Character]) -> (Bool, [Character]) {
    var chars = c
    var overlap = false
    
    for i in 0..<chars.count-1 {
        if chars[i] == chars[i+1] {
            chars.remove(at: i+1)
            chars.remove(at: i)
            overlap = true
            break
        }
    }
    
    return (overlap, chars)
}
