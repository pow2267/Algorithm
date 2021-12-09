//
//  [프로그래머스] 10진법을 2진법으로 변환한 뒤, 두 배열을 합쳐 0이면 공백, 1이면 벽으로 표현하기
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/17681
//

func solution(_ n: Int, _ arr1: [Int], _ arr2: [Int]) -> [String] {
    var sumArr: [[Int]] = []
    
    for i in 0..<n {
        let converted1 = convertBinary(n, arr1[i])
        let converted2 = convertBinary(n, arr2[i])
        
        var sum = Array(repeating: 0, count: n)
        
        for j in 0..<n {
            sum[j] = converted1[j] + converted2[j]
        }
        
        sumArr.append(sum)
    }
    
    var result: [String] = []
    
    for sum in sumArr {
        var str = ""
        
        for e in sum {
            if e > 0 {
                str += "#"
            } else {
                str += " "
            }
        }
        
        result.append(str)
    }
    
    return result
}

// 10진수를 2진수로 변환
func convertBinary(_ total: Int, _ number: Int) -> [Int] {
    var result = [Int]()
    var num = number
    
    while true {
        result.insert(num % 2, at: 0)
        num = num / 2
        
        if num == 0 {
            // 2진수로 만들고 남은 나머지 칸을 0으로 채우기 위해
            for _ in result.count..<total {
                result.insert(0, at: 0)
            }
            
            break
        }
    }
    
    return result
}
