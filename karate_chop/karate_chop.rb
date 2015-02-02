module KarateChop
  module_function
  
  def chop(target, haystack)
    min = 0
    max = haystack.length - 1
    mid = min + ((max - min) / 2)
    while min <= max
      return mid if haystack[mid] == target
      min = mid + 1 if target > haystack[mid]
      max = mid - 1 if target < haystack[mid]
      mid = min + ((max - min) / 2)
    end
    -1
  end
end
