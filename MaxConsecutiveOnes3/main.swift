//
//  [리트코드] k개의 0을 1로 바꾸어 만들 수 있는 가장 긴 연속된 1의 부분 집합의 개수 구하기
//
//
//  https://leetcode.com/problems/max-consecutive-ones-iii
//

import Foundation

class Solution {
    func longestOnes(_ nums: [Int], _ k: Int) -> Int {
        var start = 0
        var sumOne = 0
        var result = 0

        for end in 0..<nums.count {
            if nums[end] == 1 {
                sumOne += 1
            }
            
            // nums[start...end] 속 0의 개수가 k보다 클 때
            // nums[start...end] 속 원소의 개수 - 1의 개수(sumOne) = 0의 개수
            if (end - start + 1 - sumOne) > k {
                sumOne -= nums[start]
                start += 1
            }
                                // nums[start...end] 속 0을 모두 1로 바꿨다고 가정
                                // 정확히 따지면 nums[start-1...end-1]임
                                // end를 포함하면 0의 개수가 k보다 크고, 두번째 if문에서 start를 1 증가시켜줬기 때문
                                // 하지만 index를 구하는 게 아니라 1의 개수(즉 1의 총합)를 구하는 거라 상관 X
            result = max(result, (end - start + 1))
        }

        return result
    }
}
