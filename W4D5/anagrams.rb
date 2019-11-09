require 'byebug'
def first_anagram?(str1, str2)

  chars = str1.split('')

  anagrams = perms(chars)

  anagrams.each do |anagram|
    return true if anagram == str2
  end
  false
end

def second_anagram?(str1, str2)
  str2 = str2.split("")
  str1.each_char do |char|
    # idx = str2.split('').index(char)
    # return false if idx == nil
    # str2.(idx)
    str2.delete(char)
  end
  str2.empty?
end

def third_anagram?(str1, str2)
  str1 = str1.split("")
  str2 = str2.split("")

  str1.sort == str2.sort
end

def fourth_anagram?(str1, str2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  str1.each_char {|char1| hash1[char1] += 1 }
  str2.each_char {|char2| hash2[char2] += 1}
  hash1 == hash2
end

def perms(chars)
  return [chars[0]] if chars.length == 1
  result = []
  perm = perms(chars[1..-1])
  current = chars[0]
  perm.each do |combo|
    (0..combo.length).each do |i|
      # debugger
      copy = combo.dup
      result << copy.insert(i, current)
    end
  end
  return result
end

p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true
