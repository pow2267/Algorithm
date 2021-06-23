//
//  [프로그래머스] 가능한 로또 당첨 최고 순위와 최저 순위 찾기
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/77484
//

import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var lottosSet = Set<Int>()
    var highest = 0
    var lowest = 0
    
    for lotto in lottos {
        if lotto > 0 {
            lottosSet.insert(lotto)
        } else {
            highest += 1
        }
    }
    
    for num in win_nums {
        if lottosSet.contains(num) {
            highest += 1
            lowest += 1
        }
    }
    
    return [(highest > 1 ? 7-highest : 6), (lowest > 1 ? 7-lowest : 6)]
}
