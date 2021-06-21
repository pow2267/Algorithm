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
    
    func remove(_ data: T) -> Bool {
        guard let root = self.root else {
            return false
        }
        
        var parentNode = root
        var currentNode: Node? = root
        
        // 해당 데이터 노드 찾기
        while let node = currentNode {
            if data < node.data {
                currentNode = node.left
            } else if data > node.data {
                currentNode = node.right
            } else {
                break
            }
            parentNode = node
        }
        
        // 해당 데이터 노드가 없을 때
        guard let deleteNode = currentNode else {
            return false
        }
        
        // 1) 삭제하려는 노드의 자식 노드가 존재하지 않을 때
        if deleteNode.left == nil && deleteNode.right == nil {
            if data < parentNode.data {
                parentNode.left = nil
            } else {
                parentNode.right = nil
            }
            return true
        }
        
        // 2-1) 삭제하려는 노드의 왼쪽 자식 노드만 존재할 때
        if (deleteNode.left != nil && deleteNode.right == nil) {
            if data < parentNode.data {
                parentNode.left = deleteNode.left
            } else {
                parentNode.right = deleteNode.left
            }
            return true
        }
        
        // 2-2) 삭제하려는 노드의 오른쪽 자식 노드만 존재할 때
        if (deleteNode.left == nil && deleteNode.right != nil) {
            if data < parentNode.data {
                parentNode.left = deleteNode.right
            } else {
                parentNode.right = deleteNode.right
            }
            return true
        }
        
        // 3-1) 삭제하려는 노드가 두 개의 자식을 가질 때, 삭제할 노드의 오른쪽 자식 노드 중 가장 작은 값을 부모 노드가 가리키게 함
        if deleteNode.left != nil && deleteNode.right != nil {
            guard let rightNode = deleteNode.right else {
                return false
            }
            
            var changeNode = rightNode
            var changeParentNode = rightNode
            
            while let nextNode = changeNode.left {
                changeParentNode = changeNode
                changeNode = nextNode
            }
            
            if let changeChildNode = changeNode.right {
                changeParentNode.left = changeChildNode
            } else {
                changeParentNode.left = nil
            }
            
            if data < parentNode.data {
                parentNode.left = changeNode
            } else {
                parentNode.right = changeNode
            }
            
            changeNode.left = deleteNode.left
            changeNode.right = deleteNode.right
            
            return true
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
bst.insert(15)
bst.insert(10)
bst.insert(20)
bst.insert(11)
bst.insert(5)
bst.insert(13)
bst.insert(7)
bst.insert(22)
bst.insert(28)
bst.insert(17)
bst.insert(24)
bst.insert(21)

bst.drawDiagram()

print(bst.remove(22))

bst.drawDiagram()
