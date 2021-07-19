//
//  [자료 구조] 트리 정렬
//
//
//  Created by kwon on 2021/07/19.
//

import Foundation

var result: [Int] = []

func treeSort(_ arr: [Int]) -> [Int] {
    guard arr.count > 2 else {
        return arr
    }
    
    let root = Node(arr[0])
    
    for i in 1..<arr.count {
        var node = root
        
        while true {
            if arr[i] < node.value {
                if node.left == nil {
                    node.left = Node(arr[i])
                    break
                } else {
                    node = node.left!
                }
            } else {
                if node.right == nil {
                    node.right = Node(arr[i])
                    break
                } else {
                    node = node.right!
                }
            }
        }
    }
    
    inOrder(node: root)
    
    return result
}

func inOrder(node: Node) {
    if node.left != nil {
        inOrder(node: node.left!)
    }
    
    result.append(node.value)
    
    if node.right != nil {
        inOrder(node: node.right!)
    }
}

class Node {
    var value: Int
    var left: Node?
    var right: Node?
    
    init(_ value: Int) {
        self.value = value
    }
}

print(treeSort([4, 7, 2, 8, 1, 9, 3]))
