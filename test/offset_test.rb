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


end
