# def my_min(arr)
#   min = arr[0]
#   arr.each do |ele|
#     min = ele if ele <= min
#   end
#   return min
# end

# # list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# # p my_min(list)  # =>  -5

# def largest_subsum(arr)
#   subs = []
#   arr.each_with_index do |ele1, i|
#     arr.each_with_index do |ele2, j|
#       subs << arr[i..j]
#     end
#   end
#   max = nil
#   subs.each do |sub|
#     if max == nil || sub.sum > max 
#       max = sub.sum
#     end
#   end
# end

def lcs1(arr)
  best_arr = [arr[0]]
  curr_arr = []
  arr.each do |ele|
    curr_arr = curr_arr.push(ele)
    if curr_arr.sum > best_arr.sum
      best_arr = curr_arr.dup
    end
    if curr_arr.sum < 0
      curr_arr = []
    end
  end
  return best_arr.sum
end

def lcs(arr)
  best = arr[0]

  (0...arr.length).each do |i|
    current = arr[0..i]
    if current > best
      best = current
    end
  end
  best
end

list = [2, 3, -6, 7, -6, 7]
p lcs1(list) # => 8 (from [7, -6, 7])
