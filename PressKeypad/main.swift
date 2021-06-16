//
//  [프로그래머스] 키패드 누르기
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/67256
//

import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    var result = ""
    var exLeft = 10
    var exRight = 12
    var push = ""
    
    for number in numbers {
        switch number {
        case 1, 4, 7:
            push = "L"
        case 3, 6, 9:
            push = "R"
        default:
            push = findNearHand(number, exLeft, exRight, hand)
        }
        result += push
        if push == "L" {
            exLeft = number
        } else {
            exRight = number
        }
    }
    
    return result
}

func findNearHand(_ number: Int, _ exLeft: Int, _ exRight: Int, _ hand: String) -> String {
    var result = ""
    
    let num = (number == 0 ? 11 : number)
    let exL = (exLeft == 0 ? 11 : exLeft)
    let exR = (exRight == 0 ? 11 : exRight)
    
    let number_x = (num-1) / 3
    let number_y = (num-1) % 3
    
    let exLeft_x = (exL-1) / 3
    let exLeft_y = (exL-1) % 3
    
    let exRight_x = (exR-1) / 3
    let exRight_y = (exR-1) % 3
    
    if abs(number_x-exLeft_x) + abs(number_y-exLeft_y) > abs(number_x-exRight_x) + abs(number_y-exRight_y) {
        result = "R"
    } else if abs(number_x-exLeft_x) + abs(number_y-exLeft_y) < abs(number_x-exRight_x) + abs(number_y-exRight_y) {
        result = "L"
    } else {
        result = (hand == "left" ? "L" : "R")
    }
    
    return result
}

print(solution([7, 0, 8, 2, 8, 3, 1, 5, 7, 6, 2], "left"))
