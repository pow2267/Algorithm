//
//  [프로그래머스] 다트게임
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/17682
//

import Foundation

func solution(_ dartResult: String) -> Int {
    var result = 0
    // String을 배열로 변환
    let str = dartResult.map({String($0)})
    var score = -1
    var scores: [Int] = []
    var bonus: [Int] = []
    
    for s in str {
        if let num = Int(s) {
            // 숫자 0인 경우 -> 점수가 0 또는 10일 때
            if num == 0 && score > -1 {
                // 0 또는 10
                score *= 10
            } else {
                // +1 해주는 이유는 score를 -1로 초기화 했기 때문
                score += (num + 1)
            }
            continue
        }
        
        if s == "S" || s == "D" || s == "T" {
            // 점수 배열에 추가하고 다시 초기화
            scores.append(score)
            score = -1
            
            if s == "D", let last = scores.last {
                scores[scores.count-1] = last * last
            } else if s == "T", let last = scores.last {
                scores[scores.count-1] = last * last * last
            }
            continue
        }
        
        if s == "*" {
            scores[scores.count-1] *= 2
            if scores.count > 1 {
                scores[scores.count-2] *=  2
            }
            continue
        }
        
        if s == "#" {
            scores[scores.count-1] *= -1
            continue
        }
    }
    
    for s in scores {
        result += s
    }
    
    return result
}
