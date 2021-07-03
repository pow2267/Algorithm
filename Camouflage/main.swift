//
//  [프로그래머스] 위장: 가능한 모든 조합의 수 구하기
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/42578
//

import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var dic = Dictionary<String, [String]>()
    
    for value in clothes {
        if dic[value[1]] == nil {
            dic[value[1]] = [value[0]]
        } else {
            dic[value[1]] = dic[value[1]]! + [value[0]]
        }
    }
    
    var count = 1
    
    for (key, value) in dic {
        count *= (value.count + 1)
    }
    
    // -1은 아무것도 입지 않았을 경우라서 제외
    return count - 1
}
