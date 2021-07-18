//
//  [자료 구조] 퀵 정렬
//
//
//  Created by kwon on 2021/07/18.
//

import Foundation

func quickSort(_ arr: [Int]) -> [Int] {
    guard arr.count > 1 else {
        return arr
    }
    
    var result = arr

    let pivot = result.removeLast() // 피봇을 남겨둘 경우 피봇까지 중복으로 체크되는 상황 제거
    let smaller = result.filter { $0 < pivot }
    let bigger = result.filter { $0 >= pivot } // 피봇과 중복된 요소가 있을 경우를 위해 등호 포함
    
    return quickSort(smaller) + [pivot] + quickSort(bigger)
}

print(quickSort([4, 7, 2, 8, 1, 9, 3]))
