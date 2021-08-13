//
//  [프로그래머스] 입장, 퇴장, 닉네임 변경 등 마지막에 출력되는 문구 구하기
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/42888
//

import Foundation

func solution(_ record:[String]) -> [String] {
    var acts: [(String, String)] = []
    var nicknames: Dictionary<String, String> = [:]
    
    for i in 0..<record.count {
        let words: [String] = record[i].components(separatedBy: " ")
        acts.append((words[0], words[1]))
        
        if words[0] != "Leave" {
            nicknames[words[1]] = words[2]
        }
    }
    
    var result: [String] = []
    
    for i in 0..<acts.count {
        if acts[i].0 == "Enter" {
            result.append("\(nicknames[acts[i].1]!)님이 들어왔습니다.")
        } else if acts[i].0 == "Leave" {
            result.append("\(nicknames[acts[i].1]!)님이 나갔습니다.")
        }
    }
    
    return result
}
