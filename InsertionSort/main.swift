//
//  [자료 구조] 삽입 정렬
//
//
//  Created by kwon on 2021/07/15.
//

import Foundation

func insertionSort(_ arr: [Int]) -> [Int] {
    var result: [Int] = arr
    
    for i in 1..<result.count {
        var index = i
        let target = result[index]
        
        while index > 0 && target < result[index-1] {
            result[index] = result[index-1]
            index -= 1
        }
        
        result[index] = target
    }
    
    return result
}

print(insertionSort([4, 7, 2, 8, 1, 9, 3]))
