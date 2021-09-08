//
//  [리트코드] (2*i) + 1로 이루어진 배열의 모든 요소를 같은 값으로 만들기 위해 필요한 동작 개수
//
//
//  https://leetcode.com/problems/minimum-operations-to-make-array-equal/
//

import Foundation

class Solution {
    func minOperations(_ n: Int) -> Int {
        var nums = Array(repeating: 0, count: n)
        
        for i in 0..<n {
            nums[i] = (2 * i) + 1
        }
        
        let mid = (n-1) / 2
        let target: Int
        
        if n % 2 == 0 {
            target = (nums[mid] + nums[mid+1]) / 2
        } else {
            target = nums[mid]
        }
        
        var count = 0
        
        for i in 0...mid {
            count += (target - nums[i])
        }
        
        return count
    }
}
