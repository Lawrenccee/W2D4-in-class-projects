def my_min_1(arr)
  arr.each do |el1|
    if arr.all? { |el2| el1 <= el2 }
      return el1
    end
  end
end

def my_min_2(arr)
  smallest = arr.first

  arr.each do |el|
    smallest = el if el < smallest
  end

  smallest
end

def largest_contiguous_subsum_1(arr)
  sub_arr = []

  (0...arr.length).each do |idx1|
    (idx1...arr.length).each do |idx2|
      sub_arr << arr[idx1..idx2]
    end
  end

  sum = sub_arr[0].reduce(:+)
  sub_arr.each do |subset|
    sub_sum = subset.reduce(:+)
    sum = sub_sum if sub_sum > sum
  end

  sum
end

def largest_contiguous_subsum_2(arr)
  idx = 0
  largest = arr[0]
  current_sum = 0

  while idx < arr.length
    current_sum += arr[idx]
    largest = current_sum if current_sum > largest

    if current_sum < 0
      if current_sum < arr[idx]
        idx -= 1
      end
      current_sum = 0
    end
    idx += 1
  end

  largest
end

def first_anagram?(str1, str2)
  perms = str1.chars.permutation
  perms.include?(str2.chars)
end

def second_anagram?(str1, str2)
  chars1 = str1.chars
  chars2 = str2.chars

  length = chars1.length

  length.times do
    letter = chars1[0]

    if chars2.include?(letter)
      idx1 = chars1.index(letter)
      idx2 = chars2.index(letter)
      chars1.delete_at(idx1)
      chars2.delete_at(idx2)
    else
      return false
    end
  end

  chars1.empty? && chars2.empty?
end

def third_anagram?(str1, str2)
  str1 = str1.chars.sort
  str2 = str2.chars.sort

  str1 == str2
end

def fourth_anagram?(str1, str2)
  counts1 = Hash.new(0)

  str1.chars.each do |letter|
    counts1[letter] += 1
  end

  counts2 = Hash.new(0)

  str2.chars.each do |letter|
    counts2[letter] += 1
  end

  counts1 == counts2

end

def fifth_anagram?(str1, str2)
  counts1 = Hash.new(0)

  str1.chars.each do |letter|
    counts1[letter] += 1
  end

  str2.chars.each do |letter|
    counts1[letter] -= 1
  end

  counts1.all? { |_, v| v == 0 }
end
