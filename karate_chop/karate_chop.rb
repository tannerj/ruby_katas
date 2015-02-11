module KarateChop
  module_function
  
  def chop(target, haystack)
    return -1 if haystack.length == 0
    #catch target out of bounds 
    return -1 if target < haystack.min || target > haystack.max
    mid = (haystack.length / 2.0).ceil
    return mid - 1 if target == haystack[mid - 1]
    haystack_front_length = mid
    while haystack.length > 1
      haystack_front = haystack.slice!(0, haystack_front_length)
      return mid - 1 if haystack_front.max == target
      if haystack_front.max > target
        haystack_front_length = (haystack_front.length / 2.0).ceil
        mid -= haystack_front_length
        haystack = haystack_front 
      else 
        haystack_front_length = (haystack.length / 2.0).ceil
        mid += haystack_front_length
      end
    end
    return haystack.max == target ? mid - 1 : -1
  end
end
