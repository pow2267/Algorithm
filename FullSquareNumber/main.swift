//
//  [구름] 주어진 숫자 중 완전 제곱수의 개수 구하기
//
//
//  https://level.goorm.io/exam/43152/%EC%99%84%EC%A0%84-%EC%A0%9C%EA%B3%B1%EC%88%98/quiz/1
//

let input = Int(readLine()!)!
var inputs = [Int]()

for _ in 1...input {
    inputs.append(Int(readLine()!)!)
}

var result = 0

inputs.forEach {
    var num = 1
    
    while num * num <= $0 {
        if num * num == $0 {
            result += 1
            break
        } else {
            num += 1
        }
    }
}

print(result)
