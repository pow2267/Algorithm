//
//  [프로그래머스] 하샤드 수 구하기
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/12947
//

import Foundation

func solution(_ x: Int) -> Bool {
    // 하샤드 수 구하는 방법: 1. 숫자의 각 자릿수를 더한다. 2. 1번의 값으로 주어진 수를 나눠서 나머지가 0이되면 하샤드 수
    //          숫자의 각 자릿수를 Int배열로 변환.           각 자릿수를 더하기
    return (x % String(x).map({Int(String($0))!}).reduce(0, { $0 + $1 }) == 0 ? true : false)
}
