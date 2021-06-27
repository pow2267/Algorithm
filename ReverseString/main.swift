//
//  [구름] 문자열 거꾸로 출력하기
//
//
//  https://level.goorm.io/exam/43219/%EB%AC%B8%EC%9E%90%EC%97%B4-%EB%92%A4%EC%A7%91%EA%B8%B0/quiz/1
//

let str: String = readLine()!

for i in 0..<str.count {
    print(str[str.index(str.endIndex, offsetBy: -1-i)], terminator:"")
}
