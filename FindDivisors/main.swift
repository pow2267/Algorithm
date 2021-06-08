//
//  [구름] 약수 구하기
//
//
//  https://level.goorm.io/exam/43255/%EC%95%BD%EC%88%98-%EA%B5%AC%ED%95%98%EA%B8%B0/quiz/1
//

import Foundation

func solution() -> [Int] {
    let input = Int(readLine()!)!
    var number = 0
    var result1 = [Int]()
    var result2 = [Int]()

    repeat {
        number += 1
        if input % number == 0 {
            if number != result2.last && number * number != input {
                result1.append(number)
                result2.append(input / number)
            } else if number * number == input {
                result1.append(number)
                break
            } else {
                break
            }
        }
    } while number < input
    
    for i in 1...result2.count {
        result1.append(result2[result2.count-i])
    }
    
    return result1
}

print(solution())
