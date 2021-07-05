//
//  [리트코드] 모든 요소를 곱한 배열이 주어진 숫자 k보다 작은 배열의 수 구하기
//
//
//  https://leetcode.com/problems/subarray-product-less-than-k/
//

class Solution {
    func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
        var count = 0
        var index = 0
        var multi = 1
        
        for i in 0..<nums.count {
            multi *= nums[i]
            
            while multi >= k && index <= i {
                multi /= nums[index]
                index += 1
            }
            
            count += (i - index + 1)
        }

        return count
    }
}

var sol = Solution()
print(sol.numSubarrayProductLessThanK([10,5,2,6], 100))
