//
//  [자료 구조] 힙 정렬
//
//
//  Created by kwon on 2021/07/17.
//

import Foundation

func heapSort(_ arr: [Int]) -> [Int] {
    var result: [Int] = []
    var temp = arr
    
    for i in (0..<arr.count).reversed() {
        if i == 0 {
            result.append(temp.removeLast())
            return result
        }
        
        temp = heapArrays(temp)
        
        let root = temp[0]
        temp[0] = temp[i]
        temp[i] = root
        
        result.append(temp.removeLast())
    }
    
    return result
}

func heapArrays(_ arr: [Int]) -> [Int] {
    var result = arr
    
    for i in 1..<arr.count {
        var childNode = i
        
        repeat {
            let root = Int((childNode - 1) / 2)
            
            if result[root] < result[childNode] {
                let temp = result[childNode]
                result[childNode] = result[root]
                result[root] = temp
            }
            
            childNode = root
        } while childNode != 0
    }
    
    return result
}

print(heapSort([4, 7, 2, 8, 1, 9, 3]))
