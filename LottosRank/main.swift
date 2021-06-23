//
//  [프로그래머스] 가능한 로또 당첨 최고 순위와 최저 순위 찾기
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/77484
//

import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    let zero = lottos.filter { $0 == 0 }.count
    let lottos_win = lottos.filter { win_nums.contains($0) }.count
        
    return [(lottos_win+zero > 1 ? 7-(lottos_win+zero) : 6), (lottos_win > 1 ? 7-lottos_win : 6)]
}
