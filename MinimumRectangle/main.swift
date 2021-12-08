//
//  [프로그래머스] 모든 명함의 크기를 담을 수 있는 최소 직사각형의 크기 구하기
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/86491
//

import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    // 문제 해결법
    // 모든 명함을 왼쪽이 더 큰 숫자로 가게 돌린 뒤
    // 왼쪽과 오른쪽에서 가장 큰 수를 구해 곱한다.
    var width = 0
    var height = 0
    
    for size in sizes {
        // 주어진 size값 중 가로가 세로보다 길 때
        if size[0] >= size[1] {
            // 가장 큰 값 하나만 구하면 되기 때문에
            // width를 비교해서 새로운 값이 더 클 때
            // width 값을 변경함
            if width < size[0] {
                width = size[0]
            }
            // height도 마찬가지
            if height < size[1] {
                height = size[1]
            }
        // 주어진 size값 중 세로가 가로보다 길 때
        } else {
            if width < size[1] {
                width = size[1]
            }
            
            if height < size[0] {
                height = size[0]
            }
        }
    }
    
    return width * height
}
