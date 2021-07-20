//
//  [프로그래머스] 주어진 숫자로 가능한 모든 조합 중 소수의 개수 구하기
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/42839
//

import Foundation

func solution(_ numbers: String) -> Int {
    let nums: [String] = numbers.map({String($0)})
    var checkList: [Int] = Array(repeating: 0, count: nums.count)
    var result = Set<Int>()
    var number = ""
    
    func dfs(_ depth: Int, _ string : String, _ length: Int) {
        if depth == length {
            if isPrimeNumber(Int(string)!) {
                result.insert(Int(string)!)
            }
        } else {
            for i in 0..<nums.count {
                if checkList[i] == 0 {
                    number += nums[i]
                    checkList[i] = 1
                    dfs(depth + 1, number, length)
                    checkList[i] = 0
                    number = string
                }
            }
        }
    }

    func isPrimeNumber(_ number: Int) -> Bool {
        guard number > 1 else {
            return false
        }

        guard number != 2 else {
            return true
        }

        var i = 2
        var result = true

        while i * i <= number {
            if number % i == 0 {
                result = false
                break
            }

            i += 1
        }
        
        return result
    }
    
    for i in 1...nums.count {
        dfs(0, "", i)
    }
    
    return result.count
}

