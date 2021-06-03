//
// [코딜리티] 정수의 2진법 표현 중 1과 1사이 0의 최대 개수 구하기
//
// https://app.codility.com/c/run/trainingG6KKHK-UY2/
//
//

import Foundation

public func solution(_ N : Int) -> Int {
    var array = [Int]()
    var quotient = N
    var remainder = 0
    
    repeat {
        remainder = quotient % 2
        quotient = quotient / 2
        array.insert(remainder, at: 0)
    } while quotient != 0
        
    var startIdx = 0
    var endIdx = 0
    var countZero = 0
    
    for index in 0..<array.count {
        if array[index] == 1 {
            startIdx = endIdx
            endIdx = index
            
            if countZero < endIdx - startIdx - 1 {
                countZero = endIdx - startIdx - 1
            }
        }
    }
    
    return countZero
}
