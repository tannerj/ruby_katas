module KarateChop  

  module_function
  def chop(target, haystack)
    return do_chop(target, haystack, 0, haystack.length - 1)
  end

  private
  def self.do_chop(target, haystack, min, max)
    return -1 if min > max #target miss, return
    mid = min + ((max - min) / 2)
    local_mid = (haystack.length - 1 ) / 2
    return mid if target == haystack[local_mid] #found target, return key
    min = mid + 1 if target > haystack[local_mid]
    max = mid - 1 if target < haystack[local_mid]
    haystack.slice!(min..max)
    do_chop(target, haystack, min, max)
  end
end
