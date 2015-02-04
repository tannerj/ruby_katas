module KarateChop  

  module_function
  def chop(target, haystack)
    return do_chop(target, haystack, 0, haystack.length - 1)
  end

  private
  def self.do_chop(target, haystack, min, max)
    return -1 if min > max
    mid = min + ((max - min) / 2)
    return mid if target == haystack[mid]
    min = mid + 1 if target > haystack[mid]
    max = mid - 1 if target < haystack[mid]
    do_chop(target, haystack, min, max)
  end
end
