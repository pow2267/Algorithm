//
//  [프로그래머스] 주어진 숫자들로 만들 수 있는 가장 큰 수 구하기
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/42746
//

import Foundation

func solution(_ numbers:[Int]) -> String {
    // Int -> String으로 변환
    var nums = numbers.map { String($0) }
    
    // 두 숫자를 합쳐서 더 큰 숫자가 되는 걸 앞에 배치
    nums.sort { $0+$1 > $1+$0 }
    
    // [0, 0, 0]경우 "000"으로 표기되므로 "0"으로 반환
    if nums[0] == "0" {
        return "0"
    }
    
    // 배열을 풀어서 하나의 String으로 반환
    return nums.joined()
}
