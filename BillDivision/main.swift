//
//  [해커랭크] 주어진 값과 실제 계산 값이 맞는지 확인하기
//
//
//  https://www.hackerrank.com/challenges/bon-appetit/problem
//

import Foundation

func bonAppetit(bill: [Int], k: Int, b: Int) -> Void {
    var total = 0
    
    bill.forEach {
        total += $0
    }
    
    let cost = (total - bill[k]) / 2
    
    if cost == b {
        print("Bon Appetit")
    } else {
        print(b - cost)
    }
}

guard let firstMultipleInputTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let firstMultipleInput = firstMultipleInputTemp.split(separator: " ").map{ String($0) }

guard let n = Int(firstMultipleInput[0])
else { fatalError("Bad input") }

guard let k = Int(firstMultipleInput[1])
else { fatalError("Bad input") }

guard let billTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let bill: [Int] = billTemp.split(separator: " ").map {
    if let billItem = Int($0) {
        return billItem
    } else { fatalError("Bad input") }
}

guard bill.count == n else { fatalError("Bad input") }

guard let b = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

bonAppetit(bill: bill, k: k, b: b)
