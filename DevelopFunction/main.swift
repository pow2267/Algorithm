//
//  [프로그래머스] 순차적으로 배포할 때, 한 번 배포할 때마다 몇개의 기능이 배포되는가
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/42586
//

import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var p = progresses
    var s = speeds
    var finish = [Int]()
    
    while !p.isEmpty {
        var deploy = 0
        
        for i in 0..<p.count {
            if p[i] < 100 {
                p[i] = (p[i] + s[i] < 100 ? p[i] + s[i] : 100)
            }
        }
        
        while p.first == 100 {
            p.removeFirst()
            s.removeFirst()
            deploy += 1
        }
        
        if deploy > 0 {
            finish.append(deploy)
        }
    }

    return finish
}
