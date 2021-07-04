//
//  [리트코드] 링크드 리스트 재정렬하기
//
//
//  https://leetcode.com/problems/odd-even-linked-list/
//

public class ListNode {
    public var val: Int
    public var next: ListNode?
    
    public init() {
        self.val = 0
        self.next = nil
        
    }
    public init(_ val: Int) {
        self.val = val
        self.next = nil
        
    }
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
        
    }
}
 
class Solution {
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        var odd: ListNode? = head
        var even: ListNode? = head?.next
        let evenHead: ListNode? = even
        
        while odd != nil && even != nil && odd?.next != nil && even?.next != nil {
            odd?.next = even?.next
            odd = odd?.next
            even?.next = odd?.next
            even = even?.next
        }
        
        odd?.next = evenHead
        return head
    }
}
