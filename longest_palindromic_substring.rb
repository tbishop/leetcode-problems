=begin
Longest Palindromic Substring

Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.

Example 1:

Input: "babad"
Output: "bab"
Note: "aba" is also a valid answer.

Example 2:

Input: "cbbd"
Output: "bb"
=end

# @param {String} s
# @return {String}
def longest_palindrome(s)
    debug = false
    # easiest case: entire string is palindrome
    if s == s.reverse
        return s
    end

    # find center of each palindrome - may be 1 or 2 chars
    ctr_left = 0
    ctr_right = 0
    
    # track boundaries of palindrome
    left = 0
    right = 0
    
    longest_pal = s[ctr_left]
    
    puts "s: #{s}" if debug
    
    # find each potential palindrome center
    while ctr_right < s.length
        # increment ctr_right if we've got contiguous matching chars
        if s[ctr_left] == s[ctr_left + 1]
            puts "contiguous: #{s[ctr_left]} at #{ctr_left}, #{ctr_left+1}" if debug
            ctr_right = ctr_left + 1
            while s[ctr_right + 1] == s[ctr_left]
                ctr_right += 1
            end
        end
        current_pal = s[ctr_left..ctr_right]
        puts "current_pal: #{current_pal}" if debug
        left = ctr_left
        right = ctr_right
        
        # expand window until no longer palindrome
        while (left >= 0) && (right < s.length) && (s[left..right] == s[left..right].reverse)
            # if longer than longest_pal, replace longest_pal
            current_pal = s[left..right]
            puts "current_pal: #{current_pal}" if debug
            
            if current_pal.length > longest_pal.length
                longest_pal = current_pal
                puts "longest_pal: #{longest_pal} at #{left}, #{right}" if debug
            end
            left -= 1 if left > 0
            right += 1
            puts "left: #{left}, right: #{right}" if debug
        end

        # otherwise, shift center to the right
        ctr_left += 1
        ctr_right = ctr_left
        puts "shifted center to #{ctr_left}" if debug
    end

    return longest_pal
end