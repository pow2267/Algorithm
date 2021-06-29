//
//  [프로그래머스] 짝지어 제거하기
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/12973
//

import Foundation

func solution(_ s: String) -> Int{
    var str = s[s.startIndex]
    var chars = [str]

    for i in 1..<s.count {
        str = s[s.index(s.startIndex, offsetBy: i)]
        if chars.last == str {
            chars.removeLast()
        } else {
            chars.append(str)
        }
    }

    return (chars.isEmpty ? 1 : 0)
}
