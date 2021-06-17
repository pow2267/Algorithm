//
//  [리트코드] 배열에서 타겟의 위치 찾기
//
//
//  https://leetcode.com/problems/search-insert-position/
//

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var index = (nums.count-1) / 2
        var start = 0
        var end = nums.count - 1
        var result = 0
        
        while start < end {
            if nums[index] > target {
                end = index - 1
                index = start + (end - start) / 2
            } else if nums[index] < target {
                start = index + 1
                index = start + (end - start) / 2
            } else {
                return index
            }
        }
        
        if nums[index] > target {
            result = index
        } else if nums[index] < target {
            result = index + 1
        } else {
            return index
        }
        
        return result
    }
}

var solution = Solution()
print(solution.searchInsert([1,3], 4))
