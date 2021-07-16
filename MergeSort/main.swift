//
//  [자료 구조] 병합 정렬
//
//
//  Created by kwon on 2021/07/16.
//

import Foundation

func mergeSort(_ arr: [Int]) -> [Int] {
    guard arr.count > 1 else { return arr }
    
    let midIdx = arr.count / 2
    let left = mergeSort(Array(arr[0..<midIdx]))
    let right = mergeSort(Array(arr[midIdx..<arr.count]))
    
    return mergeArrays(left, right)
}

func mergeArrays(_ left: [Int], _ right: [Int]) -> [Int] {
    var leftIdx = 0
    var rightIdx = 0
    var result: [Int] = []
    
    while leftIdx < left.count && rightIdx < right.count {
        if left[leftIdx] < right[rightIdx] {
            result.append(left[leftIdx])
            leftIdx += 1
        } else if left[leftIdx] > right[rightIdx] {
            result.append(right[rightIdx])
            rightIdx += 1
        } else {
            result.append(left[leftIdx])
            leftIdx += 1
            result.append(right[rightIdx])
            rightIdx += 1
        }
    }
    
    while leftIdx < left.count {
        result.append(left[leftIdx])
        leftIdx += 1
    }
    
    while rightIdx < right.count {
        result.append(right[rightIdx])
        rightIdx += 1
    }
    
    return result
}

print(mergeSort([4, 7, 2, 8, 1, 9, 3]))
