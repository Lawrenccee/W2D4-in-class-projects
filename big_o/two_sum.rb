def bad_two_sum?(arr, target_sum)
  (0...arr.length).each do |idx1|
    ((idx1 + 1)...arr.length).each do |idx2|
      return true if (arr[idx1] + arr[idx2]) == target_sum
    end
  end

  false
end

def okay_two_sum?(arr, target_sum)
  arr = arr.sort

  arr.each_with_index do |el, idx|
    if (arr[0...idx] + arr[idx + 1..-1]).bsearch do |el2|
      el2 == (target_sum - el)
    end

      return true
    end
  end

  false
end

def two_sum?(arr, target_sum)
  results = Hash.new

  arr.each do |el|
    if results[el]
      return true
    else
      results[target_sum - el] = true
    end
  end

  false
end
