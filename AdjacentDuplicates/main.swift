//
//  [리트코드] 인접한 중복 문자열 제거하기
//
//
//  https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string-ii/
//

import Foundation

class Solution {
    func removeDuplicates(_ s: String, _ k: Int) -> String {
        var words: [String] = s.map {String($0)}
        var duplicated: Bool = true
        var count = words.count
        
        repeat {
            if words.count < k {
                break
            }
            
            var i = 0
            while i <= words.count-k {
                duplicated = true
                
                for j in 1..<k {
                    if words[i].isEmpty || words[i] != words[i+j] {
                        duplicated = false
                        break
                    }
                }
                
                if duplicated {
                    for j in 0..<k {
                        words[i + j] = ""
                    }
                    i += 3
                } else {
                    i += 1
                }
                
            }
            
            count = words.count
            words = words.filter { !$0.isEmpty }
        } while count != words.count
        
        return words.joined()
    }
}
