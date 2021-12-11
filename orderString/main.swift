//
//  [프로그래머스] 문자열을 내림차순으로 배치하기. 단, 대문자는 소문자보다 뒤에 위치한다.
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/12917
//

import Foundation

func solution(_ s: String) -> String {
    let chars = s.map({$0})
    var lower: [Character] = []
    var upper: [Character] = []
    
    for char in chars {
        if char.isLowercase {
            if lower.count == 0 {
                lower.append(char)
                continue
            }
            
            for (index, value) in lower.enumerated() {
                if char >= value {
                    lower.insert(char, at: index)
                    break
                }
                
                if index == lower.count - 1 {
                    lower.append(char)
                    break
                }
            }
        }
        
        if char.isUppercase {
            if upper.count == 0 {
                upper.append(char)
                continue
            }
            
            for (index, value) in upper.enumerated() {
                if char >= value {
                    upper.insert(char, at: index)
                    break
                }
                
                if index == upper.count - 1 {
                    upper.append(char)
                    break
                }
            }
        }
    }
    
    var result = ""
    
    for o in lower {
        result += String(o)
    }
    
    for o in upper {
        result += String(o)
    }
    
    return result
}
