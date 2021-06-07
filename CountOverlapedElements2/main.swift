//
//  [부스트코스] 자가진단 - 배열 각 요소의 중복값 찾기
//
//
//  https://blog.naver.com/boostcamp_official/221978031932
//

import Foundation

func solution(_ array: [Int]) -> [Int] {
    var result = [Int]()
    var set = Set<Int>()
    
    array.forEach { num in
        guard !set.contains(num) else { return } // set에 숫자가 이미 존재하면 반복문 skip
        set.insert(num) // set에 숫자가 없으면 추가
        
        let count = array.filter{ $0 == num }.count
        
        if (count > 1) { // 숫자가 두 개 이상으로 중복인 경우
            result.append(count)
        }
    }
    
    if result.count == 0 {
        result = [-1]
    }
    
    return result
}

print(solution([3, 2, 4, 4, 2, 5, 2, 5, 5]))
