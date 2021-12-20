//
//  [프로그래머스] 메뉴 리뉴얼
//  ⭐️
//
//  https://programmers.co.kr/learn/courses/30/lessons/72411
//

import Foundation

func solution(_ orders: [String], _ course: [Int]) -> [String] {
    var menuSet: [String: Int] = [:]

    // 모든 경우의 수를 구할 때는 재귀 함수를 쓸 것!
    func combination(_ menu: [Character], _ index: Int, _ full: String) {
        // course의 수에 해당하는 조합만 필요하기 때문
        if full.count > 1 && course.contains(full.count) {
            // 아래 과정을 한줄로 축약할 수 있음
            // default 값을 지정해서 해당 key의 값이 nil일 때는 nil 대신 default값을 반환
            menuSet[full, default: 0] += 1
            /*
            if menuSet.keys.contains(full) {
                menuSet[full]! += 1
            } else {
                menuSet[full] = 1
            }
            */
        }
        // 글자1개 조합부터 점점 늘려나가기 위해
        for i in index+1..<menu.count {
            combination(menu, i, "\(full)\(menu[i])")
        }
    }
    
    for order in orders {
        let menu: [Character] = order.map({$0}).sorted()
        
        for (index, char) in menu.enumerated() {
            combination(menu, index, String(char))
        }
    }
    
    var result: [String] = []
    
    for c in course {
        // 2번 이상 언급된 메뉴 중 가장 많은 메뉴 고르기
        if let max = menuSet.filter({ $0.key.count == c && $0.value > 1 }).max(by: { $0.value < $1.value })?.value {
            result += menuSet.filter({ $0.key.count == c && $0.value == max }).map({ $0.key })
        }
    }
    
    return result.sorted()
}
