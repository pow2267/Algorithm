//
//  [리트코드] 인접한 중복 문자열 제거하기
//
//
//  https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string-ii/
//

import Foundation

class Solution {
    func removeDuplicates(_ s: String, _ k: Int) -> String {
        var stack = [(Character, Int)]()
        
        for char in s {
            if stack.isEmpty || stack.last!.0 != char {
                stack.append((char, 1))
            } else {
                stack[stack.count - 1].1 += 1
                
                if stack.last!.1 == k {
                    stack.removeLast()
                }
            }
        }
        
        var result = [Character]()
        
        for element in stack {
            for _ in 0..<element.1 {
                result.append(element.0)
            }
        }
        
        return String(result)
    }
}
