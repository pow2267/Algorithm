//
//  [프로그래머스] 규칙에 맞는 아이디 추천하기
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/72410
//

import Foundation

func solution(_ new_id:String) -> String {
    var revised_id = [Character]()
    
    for char in new_id.lowercased() {
        revised_id.append(char)
    }
    
    revised_id = revised_id.filter { !"~!@#$%^&*()=+[{]}:?,<>/".contains($0) }
    
    var i = 0
    while i < revised_id.count-1 {
        if revised_id[i] == "." && revised_id[i+1] == "." {
            revised_id.remove(at: i)
            i -= 1
        }
        i += 1
    }
    
    if !revised_id.isEmpty && revised_id[0] == "." {
        revised_id.removeFirst()
    }
    
    if !revised_id.isEmpty && revised_id[revised_id.count-1] == "." {
        revised_id.removeLast()
    }
    
    if revised_id.isEmpty {
        revised_id = ["a"]
    }
    
    if revised_id.count > 15 {
        revised_id.removeSubrange(15..<revised_id.count)
    }
    
    if revised_id[revised_id.count-1] == "." {
        revised_id.removeLast()
    }
    
    if revised_id.count < 3 {
        let last = revised_id[revised_id.count-1]
        for _ in 1...3-revised_id.count {
            revised_id.append(last)
        }
    }
    
    var result = ""
    
    revised_id.forEach {
        result.append($0)
    }
    
    return result
}
