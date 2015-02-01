require 'minitest/autorun'
require_relative 'karate_chop'

class KarateChopTest < MiniTest::Unit::TestCase
  def test_chop_with_empty_array
    assert_equal -1, KarateChop.chop(3, [])
  end

  def test_chop_with_target_miss
    assert_equal -1, KarateChop.chop(3, [1])
  end
  
  def test_chop_with_target_hit_array_size_1
    assert_equal 0, KarateChop.chop(1, [1])
  end

  def test_chop_with_target_hit_array_size_3 
    assert_equal 0, KarateChop.chop(1, [1, 3, 5])
    assert_equal 1, KarateChop.chop(3, [1, 3, 5])
    assert_equal 2, KarateChop.chop(5, [1, 3, 5])
  end

  def test_chop_with_target_miss_array_size_3
    assert_equal -1, KarateChop.chop(0, [1, 3, 5])
    assert_equal -1, KarateChop.chop(2, [1, 3, 5])
    assert_equal -1, KarateChop.chop(4, [1, 3, 5])
    assert_equal -1, KarateChop.chop(6, [1, 3, 5])
  end
  
  def test_chop_with_target_hit_array_size_4
    assert_equal 0, KarateChop.chop(1, [1, 3, 5, 7])
    assert_equal 1, KarateChop.chop(3, [1, 3, 5, 7])
    assert_equal 2, KarateChop.chop(5, [1, 3, 5, 7])
    assert_equal 3, KarateChop.chop(7, [1, 3, 5, 7])
  end

  def test_chop_with_target_miss_array_size_4
    assert_equal -1, KarateChop.chop(0, [1, 3, 5, 7])
    assert_equal -1, KarateChop.chop(2, [1, 3, 5, 7])
    assert_equal -1, KarateChop.chop(4, [1, 3, 5, 7])
    assert_equal -1, KarateChop.chop(6, [1, 3, 5, 7])
    assert_equal -1, KarateChop.chop(8, [1, 3, 5, 7])
  end

  def test_chop_with_target_hit_array_size_100
    assert_equal 56, KarateChop.chop(57, (1..100).to_a)
    assert_equal -1, KarateChop.chop(101, (1..100).to_a)
  end

  def test_chop_with_target_miss_in_range_with_array_size_100
    assert_equal -1, KarateChop.chop(5, (1..100).to_a.drop(10))
  end
end
