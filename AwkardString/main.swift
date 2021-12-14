//
//  [프로그래머스] 단어의 홀수, 짝수를 각각 소문자, 대문자로 치환하기
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/12930
//

import Foundation

func solution(_ s: String) -> String {
    // split은 분리시킨 값이 String이 아니라 String.sequence로 반환하기 때문에
    // 별도로 String으로 바꿔주기 위해 map을 한 번 거쳐야 한다.
    // var strs: [String] = s.split(separator: " ").map({String($0)})
    
    // 또한, 이 문제에서는 여분의 공백이 있는지 여부가 중요한데 split은 여분의 공백을 없애버려서
    // split 대신 components를 사용했다. (components는 바로 String을 반환해준다.)
    var strs: [String] = s.components(separatedBy: " ")
    
    for (idx, str) in strs.enumerated() {
        var letters: [String] = str.map({String($0)})
        
        for (index, letter) in letters.enumerated() {
            if index % 2 == 1 {
                // isLowercase는 Character에서 가능하지만
                // lowercased()는 String에서 가능하다.
                letters[index] = letter.lowercased()
            } else {
                letters[index] = letter.uppercased()
            }
        }

        strs[idx] = letters.joined(separator: "")
    }
    
    return strs.joined(separator: " ")
}
