//
//  [프로그래머스] 부호가 붙은 문자열을 숫자로 변환하기
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/12925
//

import Foundation

func solution(_ s: String) -> Int {
    let strs = s.map({String($0)})
    var tens = strs.count
    var sign = 0
    var val = 0
    
    for (index, value) in strs.enumerated() {
        if index == 0 {
            if value == "-" {
                sign = -1
                continue
            } else if value == "+"{
                sign = 1
                continue
            } else {
                sign = 1
            }
        }
        
        var times = 1
        
        for i in 0..<tens-index-1 {
            times *= 10
        }
        
        val += (Int(value)! * times)
    }
    
    return val * sign
}
