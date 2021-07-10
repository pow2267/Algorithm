//
//  [프로그래머스] 주어진 숫자들로 만들 수 있는 가장 큰 수 구하기
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/42746
//

import Foundation

func solution(_ numbers:[Int]) -> String {
    var nums = [[String]]()
    var result = ""
    
    for number in numbers {
        nums.append(String(number).map{String($0)})
    }
    
    while !nums.isEmpty {
        var first = 0 // 가장 큰 첫번째 숫자
        var largest = [[String]]()
        
        for num in nums {
            first = (Int(num[0])! > first ? Int(num[0])! : first)
        }
        
        for (index, num) in nums.enumerated() {
            if Int(num[0])! == first {
                largest.append(num)
                nums[index] = ["-1"]
            }
        }
        nums = nums.filter { $0 != ["-1"] }
        
        if largest.count == 1 {
            for value in largest[0] {
                result += value
            }
            continue
        }
        
        // 첫번째 수가 같은 숫자들 순서 정하는 로직
        
        print(largest)
    }
    
    return result
}
