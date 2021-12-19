//
//  [프로그래머스] 행렬 가장자리 회전하기
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/77485
//

import Foundation

func solution(_ rows: Int, _ columns: Int, _ queries: [[Int]]) -> [Int] {
    var arr: [[Int]] = Array(repeating: Array(repeating: 0, count: columns), count: rows)
    var num = 1
    
    for i in 0..<rows {
        for j in 0..<columns {
            arr[i][j] = num
            num += 1
        }
    }
    
    var result: [Int] = []
    
    for query in queries {
        // row와 col 값이 0이 아니라 1부터 시작이라 계산하기 편하도록 1씩 빼줌
        let minY = query[0] - 1
        let minX = query[1] - 1
        let maxY = query[2] - 1
        let maxX = query[3] - 1

        // 빈칸처럼 취급할 값
        let empty = arr[minY][minX]
        var min = empty

        // 왼쪽 줄 위로
        // for의 범위 및 방향: 퍼즐을 한칸씩 옮길 때 손이 움직이는 방향
        // 퍼즐은 위로 올려지지만, 전체적인 손의 방향은 한칸씩 내려감
        // 좌상단 바로 아래 칸을 위로 올리고
        // 그 아래 칸을 다시 위로 올리기 때문
        for i in minY..<maxY {
            min = (min <= arr[i+1][minX] ? min : arr[i+1][minX])
            arr[i][minX] = arr[i+1][minX]
        }

        // 아랫쪽 줄 왼쪽으로
        for i in minX..<maxX {
            min = (min <= arr[maxY][i+1] ? min : arr[maxY][i+1])
            arr[maxY][i] = arr[maxY][i+1]
        }

        // 오른쪽 줄 아래로
        for i in (minY..<maxY).reversed() {
            min = (min <= arr[i][maxX] ? min : arr[i][maxX])
            arr[i+1][maxX] = arr[i][maxX]
        }

        // 윗쪽 줄 오른쪽으로
        for i in (minX..<maxX).reversed() {
            min = (min <= arr[minY][i] ? min : arr[minY][i])
            arr[minY][i+1] = arr[minY][i]
        }

        arr[minY][minX+1] = empty
        
        result.append(min)
    }
    
    return result
}
