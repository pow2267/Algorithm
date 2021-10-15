//
//  [Leetcode] 연결 리스트를 이용하여 삽입 정렬 구현하기
//
//
//  https://leetcode.com/problems/insertion-sort-list/
//

import Foundation


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        // 정렬된 요소들을 저장할 새 저장 공간
        let dummyNode = ListNode()
        // 정렬시킬 타겟 요소
        var currNode: ListNode? = head
        
        // ListNode의 가장 마지막 요소를 정렬할 때까지 계속 loop를 돈다.
        while currNode != nil {
            // 새로운 타겟 요소를 정렬할 때마다 맨 처음 요소부터 비교하며 정렬하기 위해
            var prevNode: ListNode? = dummyNode
            var nextNode: ListNode? = dummyNode.next
            
            while nextNode != nil {
                // 기존에 존재하는 sorted list들은 모두 이미 정렬됐다는 가정 하에 진행하기 때문에
                // nextNode.val보다 currNode.val(타겟)이 작으면 loop를 멈춘다.
                if currNode!.val < nextNode!.val {
                    break
                }
                // 한 칸씩 다음으로 옮기기
                prevNode = prevNode?.next
                nextNode = nextNode?.next
            }
            
            // 다음 loop때 정렬할 타겟 요소
            let tempNode = currNode?.next
            
            // 새로운 타겟을 prevNode와 nextNode에 연결한다.
            currNode?.next = nextNode
            prevNode?.next = currNode
            
            // 다음 요소를 정렬하기 위한 타겟을 currNode에 입력
            // 원래는 curr = currNode.next여야 하지만
            // 위에서 currNode.next를 nextNode로 바꿔줬기 때문에
            // 임시로 원래 currNode.next를 저장할 tempNode가 필요하다.
            currNode = tempNode
        }
        
        return dummyNode.next
    }
}
