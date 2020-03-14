=begin
Median of Two Sorted Arrays

Share
There are two sorted arrays nums1 and nums2 of size m and n respectively.

Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).

You may assume nums1 and nums2 cannot be both empty.

Example 1:

nums1 = [1, 3]
nums2 = [2]

The median is 2.0
Example 2:

nums1 = [1, 2]
nums2 = [3, 4]

The median is (2 + 3)/2 = 2.5
=end

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
    debug = false
    combined = (nums1 + nums2).sort
    
    puts "combined: #{combined}" if debug
    (find_median combined).to_f
end

def find_median(arr) 
    puts "arr len: #{arr.length}" if debug
    
    # if it's an odd number of ints, return the middle one
    if arr.length % 2 == 1
        return arr[arr.length/2]
    end
    
    left = arr[(arr.length-1)/2]
    right = arr[((arr.length-1)/2)+1]
    puts "left: #{left}, right: #{right}" if debug
    
    return (left + right)/2.to_f
end