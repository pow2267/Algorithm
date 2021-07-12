//
//  [자료 구조] 버블 정렬
//
//
//  Created by kwon on 2021/07/12.
//

import Foundation

func bubbleSort(_ arr: [Int]) -> [Int] {
    var result: [Int] = arr
    
    for i in 0..<result.count-1 {
        for j in 0..<result.count-1-i {
            if result[j] > result[j+1] {
                let temp = result[j]
                result[j] = result[j+1]
                result[j+1] = temp
            }
        }
    }
    
    return result
}

print(bubbleSort([4, 7, 2, 8, 1, 9, 3]))
