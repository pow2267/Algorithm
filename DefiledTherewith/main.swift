//
//  [구름] 배열을 K개씩 나눴을 때, 모든 배열의 요소가 가장 작은 수로 바뀌는 데 걸리는 최소 횟수 구하기
//
//
//  https://level.goorm.io/exam/47881/%EA%B7%BC%EB%AC%B5%EC%9E%90%ED%9D%91/quiz/1
//

import Foundation

func solution() {
    var inputs = readLine()!.split(separator: " ")
    let N = Int(inputs[0])!
    let K = Int(inputs[1])!

    inputs = readLine()!.split(separator: " ")

    print((N-1) % (K-1) == 0 ? (N-1) / (K-1) : (N-1) / (K-1) + 1)
}
