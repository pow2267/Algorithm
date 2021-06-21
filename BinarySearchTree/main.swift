//
//  [자료 구조] 2진 탐색 트리 구현
//
//
//  
//

import Foundation

class Node<T: Comparable> { // 비교 가능한 Comparable 프로토콜을 채택한 제네릭
    var data: T
    var left: Node?
    var right: Node?
    
    init(data: T) {
        self.data = data
    }
}

class BinarySearchTree<T: Comparable> {
    var root: Node<T>?
    
    func insert(_ data: T) {
        guard let root = self.root else {
            return self.root = Node.init(data: data)
        }
        
        var currentNode = root
        
        while true {
            if data < currentNode.data {
                guard let nextNode = currentNode.left else {
                    return currentNode.left = Node.init(data: data)
                }
                currentNode = nextNode
            } else {
                guard let nextNode = currentNode.right else {
                    return currentNode.right = Node.init(data: data)
                }
                currentNode = nextNode
            }
        }
    }
    
    func search(_ data: T) -> Bool {
        if root == nil {
            return false
        }
        
        var currentNode = root
        
        while let node = currentNode {
            if data < node.data {
                currentNode = node.left
            } else if data > node.data {
                currentNode = node.right
            } else {
                return true
            }
        }
        
        return false
    }
    
    func drawDiagram() {
        print(diagram(for: self.root))
    }
     
    private func diagram(for node: Node<T>?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
        guard let node = node else {
            return root + "nil\n"
        }
        
        if node.left == nil && node.right == nil {
            return root + "\(node.data)\n"
        }
        
        return diagram(for: node.right, top + " ", top + "┌──", top + "│ ")
            + root + "\(node.data)\n"
            + diagram(for: node.left, bottom + "│ ", bottom + "└──", bottom + " ")
    }
}

let bst = BinarySearchTree<Int>()
bst.insert(10)
bst.insert(20)
bst.insert(11)
bst.insert(5)
bst.insert(13)
bst.insert(7)

bst.drawDiagram()

print(bst.search(11))
print(bst.search(5))
print(bst.search(20))
// true
print(bst.search(30))
print(bst.search(28))
print(bst.search(3))
// false
