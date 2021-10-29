//
//  [프로그래머스] 10진법 수를 3진법으로 구하고, 이를 역순으로 해서 다시 10진법 수를 구하기
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/68935
//

import Foundation

func solution(_ n: Int) -> Int {
    let reversedTernary = makeTernaryReverse(n)
    var result = 0
    
    for (index, number) in reversedTernary.enumerated() {
        if number > 0 {
            var pow = 1
            // 제곱 구하기
            for _ in index..<reversedTernary.count-1 {
                pow *= 3
            }
            
            result += (number * pow)
        }
    }
    
    return result
}

// 원래 n진법 수를 구할 때는 마지막에 .reversed()를 해줘야 하지만
// 이 문제에서는 n진법을 뒤집어야 하기 때문에 그대로 출력
private func makeTernaryReverse(_ n: Int) -> [Int] {
    var ternary: [Int] = []
    var quotient = n / 3
    var remainder = n % 3
    
    while quotient > 0 {
        ternary.append(remainder)
        // remainder가 quotient보다 먼저 수행되어야 함
        remainder = quotient % 3
        quotient = quotient / 3
    }
    
    // 마지막 남은 나머지까지 배열에 포함시켜야 함
    ternary.append(remainder)
    
    return ternary
}
