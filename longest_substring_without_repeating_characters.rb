=begin
Longest Substring Without Repeating Characters

Given a string, find the length of the longest substring without repeating characters.

Example 1:

Input: "abcabcbb"
Output: 3 
Explanation: The answer is "abc", with the length of 3. 
Example 2:

Input: "bbbbb"
Output: 1
Explanation: The answer is "b", with the length of 1.
Example 3:

Input: "pwwkew"
Output: 3
Explanation: The answer is "wke", with the length of 3. 
             Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
=end

# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
	debug = false
    start = 0
    stop = 1
    substr = s[start]
    max = 1
    return 0 if !s || s.empty?

    puts "s: #{s}" if debug

    while stop < s.length        
        while stop < s.length && (! substr.include? s[stop])
            substr << s[stop]
            stop += 1
        end
        
        if stop == s.length
            break
        else
            max = substr.length > max ? substr.length : max
            start += 1
            substr = s[start]
            stop = start + 1
        end
        puts "start: #{start},stop: #{stop}"#, substr: #{substr}" if debug           
    end

    return max < substr.length ? substr.length : max
end