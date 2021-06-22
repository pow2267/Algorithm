//
//  [자료 구조] 깊이 우선 탐색 구현
//
//
//  Stack+Queue를 통한 구현 / 재귀 함수를 통한 구현
//

import Foundation

func dfs_stack(_ graph: [String: [String]], _ start: String) -> [String] {
    var visitedQueue: [String] = [] // 이미 방문한 노드들
    var visitStack: [String] = [start] // 앞으로 방문해야하는 남은 노드들
    var node: String
    
    while !visitStack.isEmpty {
        node = visitStack.removeLast()
        
        if !visitedQueue.contains(node) {
            visitedQueue.append(node)
            visitStack += graph[node] ?? []
        }
    }
    
    return visitedQueue
}

var visited: [String] = [] // 재귀 함수의 경우, 방문한 노드 리스트를 함수 밖에 선언
func dfs_recursive(_ graph: [String: [String]], _ start: String) {
    if !visited.contains(start) {
        visited.append(start)
        
        for node in graph[start] ?? [] {
            dfs_recursive(graph, node)
        }
    }
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

print(dfs_stack(graph, "A"))

dfs_recursive(graph, "A")
print(visited)
