require_relative 'test_helper'
require './lib/generator'

class GeneratorTest < MiniTest::Test
  include Generator

  def test_alphabet_is_generated
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, letter_set
  end

  def test_a_five_digit_number_is_generated
    assert_equal 5, encode.length
  end

  def test_five_digit_number_is_random
    first_number = encode
    second_number = encode
    third_number = encode
    fourth_number = encode

    assert_equal true, first_number != second_number
    assert_equal true, first_number != third_number
    assert_equal true, second_number != third_number
    assert_equal false, third_number = fourth_number
  end
end
