def okay_two_sum?(arr, target)
  return false if arr.length < 2

  mid = arr.length / 2
  sum = arr[length/2] + arr[(length/2)-1]
  return true if target == sum

  if target < sum
    okay_two_sum?(arr[0...(arr.length/2)], target)
  else
    okay_two_sum?((arr[arr.length/2))+1..-1], target)
  end
end

arr = [0, 1, 5, 7]

p okay_two_sum?(arr)