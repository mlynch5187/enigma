require './test/test_helper'
require './lib/enigma'
require './lib/generator'

class GeneratorTest < MiniTest::Test

  def setup
    @generator = Generator.new
    @generator_1 = mock("Generator 1")
  end

  def test_generator_exist
    assert_instance_of Generator, @generator
  end

  def test_letter_set_is_created
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]

    assert_equal expected, @generator.letter_set
  end

  def test_random_five_digit_number_can_be_generated
    # @generator_1.generate_keys

    # assert_equal [3, 4, 9, 6, 2], @generator_1.stubs(:generate_keys).returns([3, 4, 9, 6, 2])
  end

  def test_keys_can_be_split
    @generator.split_keys

    assert_equal [], @generator.a_key
    assert_equal [], @generator.b_key
    assert_equal [], @generator.c_key
    assert_equal [], @generator.d_key

    # assert_equal [[3,4], [4, 9], [9, 6], [6, 2]], @generator.stubs(:split_keys).returns([[3,4], [4, 9], [9, 6], [6, 2]])
  end
end
