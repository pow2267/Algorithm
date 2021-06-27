//
//  [구름] 사칙연산 계산기 만들기
//
//
//  https://level.goorm.io/exam/43241/%EA%B3%84%EC%82%B0%EA%B8%B0/quiz/1
//

import Foundation

let input = readLine()!
let arr = input.split(separator: " ")
let num1 = Int(arr[0])!
let num2 = Int(arr[2])!
let op = String(arr[1])

switch op {
    case "+":
        print(num1 + num2)
    case "-":
        print(num1 - num2)
    case "*":
        print(num1 * num2)
    default: // case "/" 나눗셈은 소수점 2째 자리까지 표현
        print(String(format: "%.2f", (Double(num1) / Double(num2))))
}
