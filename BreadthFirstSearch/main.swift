//
//  [자료 구조] 넓이 우선 탐색 구현
//
//
//  Queue를 통한 구현
//

import Foundation

func bfs_queue(_ graph: [String: [String]], _ start: String) -> [String] {
    var visitedQueue: [String] = [] // 이미 방문한 노드들
    var visitQueue: [String] = [start] // 앞으로 방문해야하는 남은 노드들
    var node: String
    
    while !visitQueue.isEmpty {
        node = visitQueue.removeFirst()
        
        if !visitedQueue.contains(node) {
            visitedQueue.append(node)
            visitQueue += graph[node] ?? []
        }
    }
    
    return visitedQueue
}

let graph: [String: [String]] = [
    "A" : ["B", "C"],
    "B" : ["A", "D", "E"],
    "C" : ["A", "G"],
    "D" : ["B", "F"],
    "E" : ["B"],
    "F" : ["D"],
    "G" : ["C", "H", "I"],
    "H" : ["G"],
    "I" : ["G"]
]

print(bfs_queue(graph, "A"))
