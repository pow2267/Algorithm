//
//  [구름] 완전수 찾기
//
//
//  https://level.goorm.io/exam/43275/%EC%99%84%EC%A0%84%EC%88%98/quiz/1
//

import Foundation

let input = readLine()!
var A = Int(input.split(separator: " ")[0])!
A = (A == 1 ? 2 : A)
let B = Int(input.split(separator: " ")[1])!
var result = [Int]()

for num in A...B {
    var sum = 1
    
    for i in 2..<num {
        if num % i == 0 {
            sum += num / i
        }
        if sum > num {
            break
        }
    }
    if sum == num {
        result.append(num)
    }
}

result.forEach {
    print($0, terminator: " ")
}
