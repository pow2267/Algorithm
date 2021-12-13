//
//  [프로그래머스] 시저 암호 만들기
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/12926
//

import Foundation

func solution(_ s: String, _ n: Int) -> String {
    let upperCase: [Character] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    let lowerCase: [Character] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    
    var chars = s.map({$0})
    
    for (idx, char) in chars.enumerated() {
        var index = 0
        
        if char.isUppercase {
            for (i, c) in upperCase.enumerated() {
                if c == char {
                    index = i
                }
            }
            
            chars[idx] = upperCase[(index + n > 25 ? (index + n - 26) : (index + n))]
        } else if char.isLowercase {
            for (i, c) in lowerCase.enumerated() {
                if c == char {
                    index = i
                }
            }
            
            chars[idx] = lowerCase[(index + n > 25 ? (index + n - 26) : (index + n))]
        }
    }
    
    var result = ""
    
    for char in chars {
        result += String(char)
    }
    
    return result
}
