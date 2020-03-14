
# validate stack sequences
# input: 2 lists (pushed & popped values)
#   no repetition in the lists
# return true if could be result of push & pop ops on an empty stack,
# otherwise return false
=begin
pushed = [1,2,3,4,5]
popped = [4,5,3,2,1]
result = true

pushed = [1,2,3,4,5]
popped = [4,3,5,1,2]
result = false (can't pop 1 before 2)
=end

# 

# look at each entry in pushed, and compare to current entry in popped
# while they differ, push the entry (from pushed) onto working stack
# when the entries match, can ignore that pushed entry and update index
# into the popped stack.
# if the working stack is empty by the time we reach the end of
# both pushed & popped stacks, its a valid stack sequence

def is_valid_stack_sequence?(pushed, popped)
  return false if pushed.length != popped.length

  debug = false
  puts "pushed: #{pushed}, popped: #{popped}" if debug

  working_stack = []
    
  popped_index = 0
  pushed_index = 0
    
  while (pushed_index < pushed.length)
      puts "pop_i: #{popped_index}, push_i: #{pushed_index}" if debug
      
      # check the stack for matches
      while working_stack[-1] && working_stack[-1] == popped[popped_index]
          pop = working_stack.pop
          popped_index += 1
          puts "popped #{pop}, pop_i incr. to #{popped_index} in 1st while loop" if debug
      end
      
      # increment pushed index until we find a match with current popped
      if (pushed[pushed_index] == popped[popped_index])
          pushed_index += 1
          popped_index += 1
      else 
          # add pushed entry to stack for later comparison
          working_stack.push pushed[pushed_index]
          pushed_index += 1
      end
  end
  puts "working_stack: #{working_stack}, pop_i: #{popped_index}, push_i: #{pushed_index}" if debug
  while popped_index < popped.length 
      if popped[popped_index] == working_stack[-1]
      # we found a match
        pop = working_stack.pop
        popped_index += 1
        puts "popped #{pop}, pop_i incr. to #{popped_index}" if debug
      else
        puts "No match at end of stack. returning false" if debug
        return false
      end
  end   
      
  # if we're off the end of the popped array, we're done
  if working_stack.size > 0 || popped_index < popped.length
     puts "stack: #{working_stack}, pop_i: #{popped_index}, returning false" if debug
     return false
  end
  puts "returning true" if debug
  return true   

end
# [1,2,3,4,5], [4,3,5,1,2] => false
# [1,2,3,4,5], [4,5,3,2,1] => true
# [2,1,0], [1,2,0] => true
puts "#{ is_valid_stack_sequence?([1,2,3,4,5], [4,3,5,1,2]) }"