//
//  [프로그래머스] 뉴스 클러스터링
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/17677
//

import Foundation

func solution(_ str1:String, _ str2:String) -> Int {
    let chars1: [Character] = str1.map{$0}
    let chars2: [Character] = str2.map{$0}
    var arr1: [String] = []
    var arr2: [String] = []
    
    for i in 0..<chars1.count-1 {
        if chars1[i].isLetter && chars1[i+1].isLetter {
            arr1.append(String(chars1[i].uppercased()) + String(chars1[i+1].uppercased()))
        }
    }
    
    for i in 0..<chars2.count-1 {
        if chars2[i].isLetter && chars2[i+1].isLetter {
            arr2.append(String(chars2[i].uppercased()) + String(chars2[i+1].uppercased()))
        }
    }
    
    let sum = arr1.count + arr2.count
    if sum == 0 {
        return 65536
    }
    
    var cross = 0
    var index = 0
    
    while index < arr1.count && arr2.count > 0 {
        for i in 0..<arr2.count {
            if arr1[index] == arr2[i] {
                arr2.remove(at: i)
                cross += 1
                break
            }
        }
        index += 1
    }
    
    return Int(Double(cross) / Double(sum-cross) * 65536)
}
