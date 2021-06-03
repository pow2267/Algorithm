//
// [리트코드] 두 원소를 더해 타겟 맞추기
//
// https://leetcode.com/problems/two-sum/
//  
//

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var result = [Int]()
        for index1 in 0..<nums.count {
            for index2 in index1+1..<nums.count {
                if nums[index1] + nums[index2] == target {
                    result.append(index1)
                    result.append(index2)
                }
            }
        }
        return result
    }
}
