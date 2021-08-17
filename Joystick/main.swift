//
//  [프로그래머스] 조이스틱을 최소한으로 움직여 주어진 닉네임 만들기
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/42860
//

import Foundation

func solution(_ name: String) -> Int {
    
    var names = name.map{String($0)}
    var index = 0
    var count = countMoves(names[index])
    names[index] = "A"
    let result = Array(repeating: "A", count: names.count)
    
    while names != result {
        var next1 = 0
        var count1 = 0
        var interval1 = 0
        
        repeat {
            interval1 += 1
            next1 = index + interval1 >= names.count ? index + interval1 - names.count : index + interval1
            count1 = countMoves(names[next1])
        } while count1 == 0
        
        var next2 = 0
        var count2 = 0
        var interval2 = 0
        
        repeat {
            interval2 += 1
            next2 = index - interval2 < 0 ? names.count - 1 : index - interval2
            count2 = countMoves(names[next2])
        } while count2 == 0
        
        if interval1 < interval2 {
            index = next1
            count = count + count1 + interval1
        } else {
            index = next2
            count = count + count2 + interval2
        }
        
        names[index] = "A"
    }
    
    return count
}

func countMoves(_ word: String) -> Int {
    
    if word == "A" {
        return 0
    }
    
    let alphabets1 = " BCDEFGHIJKLMN".map{String($0)}
    let alphabets2 = " ZYXWVUTSRQPO".map{String($0)}
    var index = 0
    
    if alphabets1.contains(word) {
        while word != alphabets1[index] {
            index += 1
        }
    } else if alphabets2.contains(word) {
        while word != alphabets2[index] {
            index += 1
        }
    }
    
    return index
}

print(solution("JEROEN"))
print(solution("BABAB"))
