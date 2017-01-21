require_relative '../heap_sort'
require 'minitest/autorun'

class HeapSortTest < Minitest::Test
  def test_heap_sort
    sorted_arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
  	Sorting::max_heap_sort(arr)
  	assert_equal(arr, sorted_arr)
  end
end
