//
//  [구름] 정렬된 두 배열 합치기
//
//
//  https://level.goorm.io/exam/43250/%EB%B0%B0%EC%97%B4-%ED%95%A9%EC%B9%98%EA%B8%B0/quiz/1
//

import Foundation

let counts = readLine()!.split(separator: " ")
let count1 = Int(counts[0])!
let count2 = Int(counts[1])!

let nums1 = readLine()!.split(separator: " ").map{Int($0)!}
let nums2 = readLine()!.split(separator: " ").map{Int($0)!}

var result: [Int] = []
var index1 = 0
var index2 = 0

while index1 < count1 && index2 < count2 {
    if nums1[index1] <= nums2[index2] {
        result.append(nums1[index1])
        index1 += 1
    } else {
        result.append(nums2[index2])
        index2 += 1
    }
}

while index1 < count1 {
    result.append(nums1[index1])
    index1 += 1
}

while index2 < count2 {
    result.append(nums2[index2])
    index2 += 1
}

for i in 0..<result.count {
    print(result[i], terminator: " ")
}
