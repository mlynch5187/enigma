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


end
