//
//  [프로그래머스] 문자열 압축하기
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/60057
//

import Foundation

func solution(_ s: String) -> Int {
    let strs = s.map({String($0)})
    var answer = s.count
    
    for n in 1...strs.count {
        let result = compressString(strs, n)
        
        if answer > result.count {
            answer = result.count
        }
    }
    
    return answer
}

private func compressString(_ strs: [String], _ n: Int) -> String {
    var result = ""
    var idx = 0
    var cnt = 1
    var lastStr = ""
    var str = ""
    
    while idx + n <= strs.count {
        str = ""
        
        for i in 0..<n {
            str += strs[idx + i]
        }
        
        if lastStr == "" {
            lastStr = str
        } else {
            if lastStr == str {
                cnt += 1
            } else {
                // lastStr != str일 때, lastStr만 붙여줌
                if cnt > 1 {
                    result += ("\(cnt)" + lastStr)
                } else {
                    result += lastStr
                }

                lastStr = str
                cnt = 1
            }
        }
        
        idx += n
    }
    
    // while문이 끝나고 lastStr만 붙이고 str은 붙이지 않았으므로 붙여줌
    if cnt > 1 {
        result += ("\(cnt)" + str)
    } else {
        result += str
    }
    
    // Ex) 8단어를 3개씩 끊었을 때 3 / 3 / 2 <- 에서 마지막 두글자 추가를 위해
    if idx < strs.count {
        for i in idx..<strs.count {
            result += strs[i]
        }
    }
    
    return result
}
