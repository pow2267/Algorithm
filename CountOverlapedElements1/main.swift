//
//  [부스트코스] 자가진단 - 배열 각 요소의 중복값 찾기
//
//
//  https://blog.naver.com/boostcamp_official/221978031932
//

import Foundation

func solution(_ array: [Int]) -> [Int] {
    var overlapedArr = [Int]()
    var dic = Dictionary<Int, Int>()
    
    array.forEach { num in // dic에 array의 각 숫자와 숫자가 언급된 횟수를 입력
        if let count = dic[num] {
            dic[num] = count + 1
        } else {
            dic[num] = 1
            overlapedArr.append(num) // Dictionary는 순서가 없기 때문에 순서를 위해 사용
        }
    }
    
    var result: [Int] = overlapedArr.compactMap { num in
        let count = dic[num] ?? 0 // Dictionary의 value는 optional값
        return count > 1 ? count : nil
    }
    
    if result.count == 0 {
        result.append(-1)
    }
    
    return result
}

print(solution([3, 2, 4, 4, 2, 5, 2, 5, 5]))
