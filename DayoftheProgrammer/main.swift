//
//  [해커랭크] 그 해의 256번째 날 구하기
//
//
//  https://www.hackerrank.com/challenges/day-of-the-programmer/problem
//

import Foundation

func dayOfProgrammer(year: Int) -> String {
    var isLeapYear = false
        
        if year > 1918 { // 그레고리력에서 윤년 구하는 법
            if (year % 4 == 0 && year % 100 != 0) || year % 400 == 0 {
                isLeapYear = true
            }
        } else { // 율리우스력에서 윤년 구하는 법
            if year % 4 == 0 {
                isLeapYear = true
            }
        }
        
        if year == 1918 { // 1918년에는 2월이 13일 적다
            return "26.09.\(year)"
        } else if isLeapYear {
            return "12.09.\(year)"
        } else {
            return "13.09.\(year)"
        }
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let year = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

let result = dayOfProgrammer(year: year)

fileHandle.write(result.data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
