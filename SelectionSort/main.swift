//
//  [자료 구조] 선택 정렬
//
//
//  Created by kwon on 2021/07/13.
//

import Foundation

func SelectionSort(_ arr: [Int]) -> [Int] {
    var result: [Int] = arr
    
    for i in 0..<result.count {
        var index =  i
        var minIdx = index
        var min = result[index]
        index += 1
          
        while index < result.count {
            if result[index] < min {
                min = result[index]
                minIdx = index
            }
            
            index += 1
        }
        
        let temp = result[i]
        result[i] = result[minIdx]
        result[minIdx] = temp
    }
    
    return result
}

print(SelectionSort([4, 7, 2, 8, 1, 9, 3]))
