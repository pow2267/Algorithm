//
//  [프로그래머스] 체육복이 2벌인 학생이 앞뒤 학생 중 체육복이 없는 학생에게 체육복 빌려주기
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/42862
//

import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var students = [Int](repeating: 1, count: n+1) // 1번부터 n번까지 표현하기 위해 n+1개의 배열 생성
    
    for i in reserve { // 체육복 2개인 학생 계산
        students[i] += 1
    }
    
    for i in lost { // 체육복 잃어버린 학생 계산
        students[i] -= 1
    }
    
    for i in 1...n {
        if students[i] == 2 {
            if (i-1) > 0 && students[i-1] == 0 {
                students[i] -= 1
                students[i-1] += 1
            } else if (i+1) < n && students[i+1] == 0 {
                students[i] -= 1
                students[i+1] += 1
            }
        }
    }
    
    var count = 0
    
    for i in 1...n { // 0번은 없는 학생이므로 제외
        if students[i] > 0 {
            count += 1
        }
    }
    
    return count
}
