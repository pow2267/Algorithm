//
//  [코딜리티] 가장 처음 모든 숫자가 등장한 가장 짧은 배열의 길이 찾기
//
//
//  https://app.codility.com/c/run/training446G2S-4XK/
//

public func solution(_ X : Int, _ A : inout [Int]) -> Int {
    var result = 0
    var leaves = Set<Int>()
    var x = X

    while x != 0 {
        leaves.insert(x)
        x -= 1
    }

    for position in A {
        if leaves.contains(position) {
            leaves.remove(position)
        }

        if leaves.isEmpty {
            return result
        }

        result += 1
    }

    if !leaves.isEmpty {
        result = -1
    }

    return result
}

var arr = [1, 3, 1, 4, 2, 3, 5, 4]

print(solution(5, &arr))
