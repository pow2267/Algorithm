//
//  [구름] 공백을 제외한 단어의 개수 구하기
//
//
//  https://level.goorm.io/exam/47883/%EB%8B%A8%EC%96%B4%EC%9D%98-%EA%B0%9C%EC%88%98-%EC%84%B8%EA%B8%B0/quiz/1
//

let input = readLine()!
var chars = [Character]()
var words = [String]()
var word = ""

for index in input.indices {
    chars.append(input[index])
}

for char in chars {
    if char != " " {
        word.append(char)
    } else {
        if word != "" {
            words.append(word)
            word = ""
        }
    }
}

if word != "" {
    words.append(word)
}

print(words.count)
