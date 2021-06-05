//
//  [리트코드] 로마 숫자 10진법 수로 변환하기
//
//
//  https://leetcode.com/problems/roman-to-integer/
//

import Foundation

class Solution {
    func romanToInt(_ s: String) -> Int {
        var result = 0
        var romans = s.map({ String($0) })
        var maxIndex = romans.count
        
        while maxIndex > 1 {
            if romanValue(romans[0]) >= romanValue(romans[1]) {
                result += romanValue(romans[0])
                romans.removeFirst()
                maxIndex -= 1
            } else {
                result += romanValue(romans[1]) - romanValue(romans[0])
                romans.removeSubrange(0...1)
                maxIndex -= 2
            }
        }
        
        if maxIndex == 1 {
            result += romanValue(romans[0])
        }
        
        return result
    }
    
    func romanValue(_ s: String) -> Int {
        switch s {
        case "I":
            return 1
        case "V":
            return 5
        case "X":
            return 10
        case "L":
            return 50
        case "C":
            return 100
        case "D":
            return 500
        case "M":
            return 1000
        default:
            return 0
        }
    }
}
