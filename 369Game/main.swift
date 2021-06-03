//
// [구름] 369 게임
//
// https://level.goorm.io/exam/48757/369-%EA%B2%8C%EC%9E%84/quiz/1
//
//

import Foundation

var n = Int(readLine()!)!
var clap = 0
var nums = [Int]()
var quotient = 0
var remainder = 0

for i in 1..<n {
    quotient = i
    repeat {
        remainder = quotient % 10
        quotient = quotient / 10
        nums.insert(remainder, at: 0)
    } while quotient != 0
}

for num in nums{
    if num == 3 || num == 6 || num == 9 {
        clap += 1
    }
}

print(clap)
