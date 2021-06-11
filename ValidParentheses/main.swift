//
//  [리트코드] 유효한 괄호인지 확인하기
//
//
//  https://leetcode.com/problems/valid-parentheses/
//

import Foundation

class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [Int]()
        var parenthese: Int
        
        for i in s.indices {
            parenthese = calParentheses(s[i])
            
            if stack.isEmpty {
                stack.append(parenthese)
            } else {
                if stack.last! + parenthese != 0 || stack.last! > parenthese {
                    stack.append(parenthese)
                } else {
                    stack.removeLast()
                }
            }
        }
        
        return stack.isEmpty
    }
    
    func calParentheses(_ c: Character) -> Int {
        switch c{
            case "(":
                return -1
            case ")":
                return +1
            case "{":
                return -2
            case "}":
                return +2
            case "[":
                return -3
            case "]":
                return +3
            default:
                return 0
        }
    }
}


var solution = Solution()

print(solution.isValid("{}[])("))
