//
//  [프로그래머스] 3명 중 가장 많은 답을 맞춘 사람 찾기
//
//
//  https://programmers.co.kr/learn/courses/30/lessons/42840
//

import Foundation

func solution(_ answers: [Int]) -> [Int] {
    var answers1 = person1(answers.count)
    var answers2 = person2(answers.count)
    var answers3 = person3(answers.count)
    
    for i in 0..<answers.count {
        if answers[i] != answers1[i] {
            answers1[i] = 0
        }
        if answers[i] != answers2[i] {
            answers2[i] = 0
        }
        if answers[i] != answers3[i] {
            answers3[i] = 0
        }
    }
    
    var counts = [
        answers1.filter{$0 > 0}.count,
        answers2.filter{$0 > 0}.count,
        answers3.filter{$0 > 0}.count
    ]
    let largest = counts.sorted(by: >)[0]
    var result = [Int]()
    
    for i in 0..<counts.count {
        if largest == counts[i] {
            result.append(i+1)
        }
    }
    
    return result
}

func person1(_ questions: Int) -> [Int] {
    var answers = [Int]()
    
    while answers.count < questions {
        answers.append(answers.count%5 + 1)
    }
    
    return answers
}

func person2(_ questions: Int) -> [Int] {
    var answers = [2]
    let options = [1, 3, 4, 5]
    var index = 0
    
    while answers.count < questions {
        if (answers.count) % 2 == 0 {
            answers.append(2)
        } else {
            answers.append(options[index%4])
            index += 1
        }
    }
    
    return answers
}

func person3(_ questions: Int) -> [Int] {
    var answers = [Int]()
    var options = [3, 1, 2, 4, 5]
    
    while answers.count < questions {
        answers.append(options[(answers.count/2)%5])
    }
    
    return answers
}
