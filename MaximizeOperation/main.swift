//
//  [프로그래머스] 수식의 우선 순위를 변경하여 수식 결과 값 최대화하기
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/67257
//

import Foundation

func solution(_ expression: String) -> Int64 {
    let strs: [String] = expression.map({String($0)})
    // 숫자와 수식을 나눠서 배열에 입력
    // Ex) "1+2*3" -> ["1", "+", "2", "*", "3"]
    var exps: [String] = []
    // 숫자 제외 수식만 배열에 입력
    var oprs: [String] = []
    var numIdx = 0
    
    for (idx, str) in strs.enumerated() {
        // str이 숫자가 아닌 수식일 때
        if Int(str) == nil {
            // 숫자 추가(숫자는 1자리 이상일 수 있으니 numIdx부터 idx전까지)
            exps.append(strs[numIdx..<idx].reduce("", { $0 + $1 }))
            // 수식 추가
            exps.append(str)
            
            if !oprs.contains(str) {
                oprs.append(str)
            }
            
            numIdx = idx + 1
        }
    }
    // for문에는 "1+2*3"중 "1+2*"까지만 입력되므로 마지막 수식 뒤 숫자 추가
    exps.append(strs[numIdx..<strs.count].reduce("", { $0 + $1 }))
    
    var biggest: Int64 = 0
    
    // 주어진 수식으로 만들 수 있는 모든 수식 우선 순위 조합으로 결과값 계산하기
    for oprs in allOperations(oprs) {
        var tempExps = exps
        
        for opr in oprs {
            var idx = 0
            
            while tempExps.count > 1 && idx < tempExps.count{
                var sum: Int64 = 0
                
                if opr == tempExps[idx] {
                    switch opr {
                        case "*": sum += (Int64(tempExps[idx-1])!*Int64(tempExps[idx+1])!)
                        case "+": sum += (Int64(tempExps[idx-1])!+Int64(tempExps[idx+1])!)
                        default : sum += (Int64(tempExps[idx-1])!-Int64(tempExps[idx+1])!)
                    }
                    
                    // ["1", "+", "2", "*", "3"] -> ["3", "*", "3"]으로 바꿔주기
                    tempExps.replaceSubrange((idx-1...idx+1), with: [String(sum)])
                    idx = 0
                } else {
                    idx += 1
                }
            }
        }
        
        let sum = Int64(tempExps.first!)!
        let result = (sum > 0 ? sum : sum * -1)
        biggest = (biggest >= result ? biggest : result)
    }
    
    return biggest
}

// 주어진 수식으로 만들 수 있는 모든 수식 우선 순위 조합 만들기
// 모든 조합을 구할 때는 >>재귀 함수 사용<<
private func allOperations(_ oprs: [String]) -> [[String]] {
    var operations: [[String]] = []
    
    // 수식 조합 만들기    주어진 수식 전체,  opr중 사용할 수식의 인덱스,  이전까지 만들어진 수식 조합 결과물
    func getOperations(_ opr: [String], _ idx: Int, _ before: [String]) {
        var o = opr
        var b = before
        
        if o.count == 1 {
            b.append(o.first!)
            // 완성된 수식 조합을 결과에 추가
            operations.append(b)
        } else {
            b.append(o.remove(at: idx))
            
            for i in 0..<o.count {
                getOperations(o, i, b)
            }
        }
    }
    
    // 주어진 수식 각각을 첫번째 요소로 하는 조합을 만들기 위해
    for i in 0..<oprs.count {
        getOperations(oprs, i, [])
    }
    
    return operations
}
