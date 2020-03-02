require './test/test_helper'
require './lib/enigma'
require './lib/keys'
require './lib/offset'

class OffsetTest < MiniTest::Test

  def setup
    @offset = Offset.new
    @enigma = Enigma.new
    @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_offset_exists
    assert_instance_of Offset, @offset
  end

  def test_date_is_generated
    Date.today.stubs(:now).returns(Time.new("03032020"))

    assert_equal "03032020", @enigma.date
  end

  def test_date_can_be_squared
    assert_equal 9193145280400, @offset.square_date
  end

  def test_last_four_digits_are_returned
    assert_equal ["0", "4", "0", "0"], @enigma.last_four_digits
  end

  def test_last_four_digits_are_being_set_to_offsets
    @offset.offset

    assert_equal [0], @offset.a_offset
    assert_equal [4], @offset.b_offset
    assert_equal [0], @offset.c_offset
    assert_equal [0], @offset.d_offset
  end

  def test_final_shift
    assert_equal 2,  @enigma.a_final_shift
    assert_equal 31, @enigma.b_final_shift
    assert_equal 71, @enigma.c_final_shift
    assert_equal 15, @enigma.d_final_shift
  end

end
