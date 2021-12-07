//
//  main.swift
//  WeekdayIn2016
//
//  Created by kwon on 2021/12/07.
//

import Foundation

func solution(_ a: Int, _ b: Int) -> String {
    // 1월 1일이 금요일이니까 배열의 1번 요소를 금요일로 지정
    let weekday = ["THU", "FRI", "SAT", "SUN", "MON", "TUE", "WED"]
    // 1~12월 마지막 날짜 (0번 요소는 사용하지 않아서 0으로 지정)
    let monthlyDays = [0, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    
    var total = 0
    
    for i in 1..<a {
        total += monthlyDays[i]
    }

    total += b
    
    return weekday[total % 7]
}
