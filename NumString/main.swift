//
//  [프로그래머스] 숫자와 문자열로 이루어진 영단어를 모두 숫자로 치환하기
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/81301
//

import Foundation

func solution(_ s:String) -> Int {
    
    let strings: [String] = s.map({ String($0) })
    var result: String = ""
    var temp: String = ""
    
    for string in strings {
        if Int(string) != nil {
            result += string
        } else {
            temp += string
            
            switch temp {
            case "zero":
                result += "0"
                temp = ""
                break
            case "one":
                result += "1"
                temp = ""
                break
            case "two":
                result += "2"
                temp = ""
                break
            case "three":
                result += "3"
                temp = ""
                break
            case "four":
                result += "4"
                temp = ""
                break
            case "five":
                result += "5"
                temp = ""
                break
            case "six":
                result += "6"
                temp = ""
                break
            case "seven":
                result += "7"
                temp = ""
                break
            case "eight":
                result += "8"
                temp = ""
                break
            case "nine":
                result += "9"
                temp = ""
                break
            default:
                break
            }
        }
    }
    
    return Int(result)!
}
