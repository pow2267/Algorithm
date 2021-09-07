//
//  [프로그래머스] 집합으로 표현된 튜플의 요소 구하기
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/64065
//

import Foundation

func solution(_ s:String) -> [Int] {
    var numbers: [[Int]] = []
    let arrays: [String] = s.components(separatedBy: "},{")
    
    // 주어진 문자열 s를 숫자로 이루어진 배열의 배열로 만들기
    for array in arrays {
        let strings: [String] = array.components(separatedBy: "\", \"")
        
        for string in strings {
            var str = string
            str = str.replacingOccurrences(of: "{", with: "")
            str = str.replacingOccurrences(of: "}", with: "")
            
            let strs = str.components(separatedBy: ",")
            var nums: [Int] = []
            
            for str in strs {
                if let number = Int(str) {
                    nums.append(number)
                }
            }
            numbers.append(nums)
        }
    }
    
    // 요소의 개수를 확인하기 위해 dictionary로 표현
    var dic = Dictionary<Int, Int>()
    
    for nums in numbers {
        for num in nums {
            if let count = dic[num] {
                dic[num] = count + 1
            } else {
                dic[num] = 1
            }
        }
    }
    
    var result: [Int] = []
    
    // 가장 많은 개수의 요소부터 result 배열에 삽입
    for i in (1...numbers.count).reversed() {
        for (key, value) in dic {
            if value == i {
                result.append(key)
                dic[key] = nil // deinit
            }
        }
    }
    
    return result
}
