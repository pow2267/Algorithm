//
//  [프로그래머스] 카펫의 가로세로 너비 구하기
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/42842
//

import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var index = 1
    var width = 0
    var length = 0
    
    while index * index <= yellow {
        if yellow % index == 0 {
            width = yellow / index + 2
            length = index + 2
            
            if width * length - yellow == brown {
                break
            }
        }
        
        index += 1
    }
    
    return [width, length]
}
