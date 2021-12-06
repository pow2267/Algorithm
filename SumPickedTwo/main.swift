//
//  [프로그래머스] 행렬에서 두 수를 뽑아 만들 수 있는 모든 수를 오름차순으로 정리하기
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/68644
//

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var sums: [Int] = []
    
    for i in 0..<numbers.count-1 {
        for j in i+1..<numbers.count {
            // 두 수 더하기
            let sum = numbers[i] + numbers[j]
            
            // 더한 수를 크기 비교 후 추가하기
            if sums.count != 0 {
                for k in 0..<sums.count {
                    // 중복 확인
                    if sums[k] == sum {
                        break
                    }
                    
                    // 작은 값이 앞에 위치하도록 삽입
                    if sums[k] > sum {
                        sums.insert(sum, at: k)
                        break
                    } else {
                        if k == sums.count-1 {
                            sums.append(sum)
                            break
                        }
                    }
                }
            } else {
                // 첫 요소일 때
                sums.append(sum)
            }
        }
    }
    
    return sums
}
