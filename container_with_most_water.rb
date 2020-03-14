=begin
Container With Most Water
Medium

5043

526

Add to List

Share
Given n non-negative integers a1, a2, ..., an , where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.

Note: You may not slant the container and n is at least 2.


    x         x
    x         x   x
    x x       x   x
    x x   x   x   x
    x x   x x x   x
    x x   x x x x x
    x x x x x x x x
  x x x x x x x x x
    _______________

The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water 
(underlined section) the container can contain is 49.


Example:

Input: [1,8,6,2,5,4,8,3,7]
Output: 49=end

# @param {Integer[]} height
# @return {Integer}
def max_area(height)
	debug = false
    # give input a better name
    walls = height
    #puts "walls: #{walls}"
    left_wall = 0
    right_wall = walls.length - 1
    
    current_volume = max_volume = [walls[left_wall],walls[right_wall]].min * (right_wall - left_wall)
    puts "walls: #{left_wall}, #{right_wall}; current_volume: #{current_volume}" if debug
    
    # find the biggest water area
    while left_wall < right_wall
        if walls[left_wall] < walls[right_wall]
            # move left wall in
            left_wall += 1
        else
            # move right wall in
            right_wall -= 1
        end
        current_volume = [walls[left_wall],walls[right_wall]].min * (right_wall - left_wall)
        if current_volume > max_volume
            max_volume = current_volume
        end
    end
    
    return max_volume
end
