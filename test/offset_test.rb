require_relative 'test_helper'
require 'date'
require './lib/offset'

class OffsetTest < MiniTest::Test

  def setup
    @offset = Offset.new
  end

  def test_offset_exists
    assert_instance_of Offset, @offset
  end

  def test_offsets_are_strings
    assert_equal String, @offset.date.class
    assert_equal String, @offset.key.class
  end

  def test_random_keys_are_generated
    skip
  end

  def test_keys_are_being_split_into_array_indexes_of_integers
    @offset.stubs(:key => "09134")

    assert_equal [9, 91, 13, 34], @offset.split_keys
  end

  def test_date_can_be_squared
    @offset.stubs(:date => "03022020")

    assert_equal "9132604880400", @offset.square_date
  end

  def test_date_can_be_offset
    @offset.stubs(:date => "03022020")

    assert_equal [0, 4, 0, 0], @offset.offset_date
  end



end
