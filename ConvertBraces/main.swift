//
//  [프로그래머스] 괄호 변환하기
//  ⭐️
//
//  https://programmers.co.kr/learn/courses/30/lessons/60058
//

import Foundation

func solution(_ p: String) -> String {
    // 계산하기 쉽도록 괄호를 ( -> 1, ) -> -1로 변환
    var v: [Int] = p.map({ (brace: Character) -> Int in
        if String(brace) == "(" {
            return 1
        } else {
            return -1
        }
    })
    
    func separate(_ w: [Int]) -> [Int] {
        if w.isEmpty {
            return []
        }
        
        var u: [Int] = []
        var sum: Int = 0
        var isRight: Bool = true
        
        for (index, brace) in w.enumerated() {
            u.append(brace)
            sum += brace
            
            // -1이 된다는 건 ( 보다 )가 먼저 온다는 뜻
            // 1과 -1이 더해져 0은 될 수 있지만 온전한 괄호는 아님을 의미
            if  sum == -1 {
                isRight = false
            }
            
            if sum == 0 {
                v = w[index+1..<w.count].map({$0})
                break
            }
        }
        
        if isRight {
            return u + separate(v)
        } else {
            u.removeFirst()
            u.removeLast()
            
            u = u.map({$0*(-1)})
            
            return ([1] + separate(v) + [-1]) + u
        }
    }
    
    // 1과 -1로 표현한 값을 다시 괄호로 변환 및 배열을 문자열로 변환
    return separate(v).map({ (value: Int) -> String in
        if value == 1 {
            return "("
        } else {
            return ")"
        }
    }).reduce("", { String($0) + String($1) })
}
