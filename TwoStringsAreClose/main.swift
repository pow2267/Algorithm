//
//  [리트코드] 두 문자열의 순서와 문자열에 존재하는 문자를 바꿔 서로 같은 모양으로 만들 수 있는지
//
//
//  https://leetcode.com/problems/determine-if-two-strings-are-close/
//

import Foundation

class Solution {
    func closeStrings(_ word1: String, _ word2: String) -> Bool {
        guard word1.count == word2.count else {
            return false
        }
        
        var charCount1 = Dictionary<Character, Int>()
        var charCount2 = Dictionary<Character, Int>()
        
        for value in word1 {
            charCount1[value] = (charCount1[value] ?? 0) + 1
        }
        
        for value in word2 {
            charCount2[value] = (charCount2[value] ?? 0) + 1
        }
        
        for (key, _) in charCount1 {
            if charCount2[key] == nil {
                return false
            }
        }
        
        var count1 = [Int]()
        var count2 = [Int]()
        
        for (_, value) in charCount1 {
            count1.append(value)
        }
        
        for (_, value) in charCount2 {
            count2.append(value)
        }
        
        count1.sort()
        count2.sort()
        
        for i in 0..<count1.count {
            if count1[i] != count2[i] {
                return false
            }
        }
        
        return true
    }
}
