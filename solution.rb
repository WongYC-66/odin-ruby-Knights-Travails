def knight_moves(start_pos, end_pos)
  # start_pos = [x1, y1]
  # end_pos = [x2, y2]
  # shows the shortest possible way to get from one square to another

  
  dirs = [
    [-2, -1],   # btmleft_1
    [-1, -2],   # btmleft_2
    [+1, -2],   # btmright_1
    [+2, -1],   # btmright_1
    [+2, +1],   # topright_1
    [+1, +2],   # topright_2
    [-1, +2],   # topleft_1
    [-2, +1],   # topleft_2
  ]
  
  # BFS
  q = [[start_pos, [start_pos]]]     # [[x, y], [paths]]
  seen = Set.new()

  while(!q.empty?)
    pos, path = q.shift()
    x, y = pos

    if pos == end_pos
      return path
    end
    
    dirs.each do |dx, dy|
      new_x = x + dx
      new_y = y + dy
      next if new_x < 0 || new_x > 7
      next if new_y < 0 || new_y > 7
      
      new_pos = [new_x, new_y]

      next if seen.include?(new_pos)  # hash set to avoid duplicate step
      seen.add(new_pos)

      new_path = path + [new_pos]

      q.push([new_pos, new_path])
    end

  end


end



def print_found(path)
  p "#########"
  if path.length == 1
    puts "You're already at #{path[0]}!"
  else
    puts "From : #{path[0]} , To : #{path[-1]}" 
    puts "You made it in #{path.length - 1} moves!  Here's your path:"
    path.each do |x,y|
      puts "[#{x},#{y}]"
    end
  end
end

# Test
print_found(knight_moves([3,3],[4,3]))

print_found(knight_moves([0,0],[3,3]))

print_found(knight_moves([3,3],[0,0]))

print_found(knight_moves([0,0],[7,7]))

print_found(knight_moves([0,0],[0,0]))  # Edge case test

# Ok completed within 35mins ?.
# lets ask chatgpt to code review


# 1 more thing. Does Set() in ruby check array correcty? YES! it does!
#   - Javascript Set can't check array directly
# ok we done. TQ.
