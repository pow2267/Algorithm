//
//  [리트코드] 지그재그로 쓴 글자 순서대로 새로운 글자 반환하기
//
//
//  https://leetcode.com/problems/zigzag-conversion/
//

class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows == 1 {
            return s
        }
        
        var chars = [Character]()
        s.forEach {
            chars.append($0)
        }
        
        var rows = 0
        var cols = 0
        var c: Character = "!"
        
        var zigzag = Array(repeating: Array(repeating: c, count: chars.count), count: numRows)
    
        chars.forEach {
            zigzag[rows][cols] = $0
            
            if cols % (numRows-1) == 0 {
                rows += 1
            } else {
                rows -= 1
                cols += 1
            }
            
            if rows == numRows {
                rows -= 2
                cols += 1
            }
        }
        
        return String(zigzag.flatMap { value in return value}.filter { $0 != c })
    }
}
