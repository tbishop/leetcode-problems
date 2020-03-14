=begin
You are given two non-empty linked lists representing two non-negative integers. 
The digits are stored in reverse order and each of their nodes contain a single 
digit. Add the two numbers and return it as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

Example:

Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
Output: 7 -> 0 -> 8
Explanation: 342 + 465 = 807.
=end

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
	debug = false
    carry = 0
    lsum = ListNode.new 0
    head = lsum

    while l1 || l2 do
        if l1 && l2
            sum = l1.val + l2.val
        elsif !l1
            sum = l2.val
        elsif !l2
            sum = l1.val
        end
        puts "sum: #{sum}, carry: #{carry}" if debug

        sum += carry
        carry = 0
        puts "sum += carry: #{sum}" if debug
        puts "carry is now #{carry}" if debug
        if sum > 9
            carry = 1
            sum = sum % 10
        end
        lsum.val = sum
        l1 = l1.next if l1
        l2 = l2.next if l2
        if l1 || l2
            lsum.next = ListNode.new 0
            lsum = lsum.next
        end

        if carry > 0 && !(l2 || l1)
            puts "creating new last node with val of 1" if debug
            lsum.next = ListNode.new 1
        end
        
    end
    return head
end

# sample input (needs to be converted to lists) [2,4,3], [5,6,4]
