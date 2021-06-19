//
//  [구름] 주어진 수의 비트 연산자를 좌우로 n칸 만큼 움직이기
//
//
//  https://level.goorm.io/exam/43173/%EB%B9%84%ED%8A%B8%EC%97%B0%EC%82%B0-%EA%B8%B0%EB%B3%B8-2/quiz/1
//
import Foundation

var input = readLine()!
var number = Int(input.split(separator: " ")[0])!
let move = Int(input.split(separator: " ")[1])!
var bit = [Int]()
var result = 0

while number != 0 {
    bit.append(number%2)
    number = number/2
}

for (index, value) in bit.enumerated() {
    if index - move >= 0 {
        result += value * Int(pow(Double(2), Double(index-move)))
    }
}

print(result)
result = 0

for (index, value) in bit.enumerated() {
    result += value * Int(pow(Double(2), Double(index+move)))
}

print(result)
