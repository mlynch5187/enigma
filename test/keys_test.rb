require 'minitest/autorun'
require 'minitest/pride'
require 'date'
require './lib/enigma'
require './lib/keys'

class KeysTest < MiniTest::Test

  def setup
    @keys = Keys.new
  end

  def test_keys_exist
    assert_instance_of Keys, @keys
  end

  def test_random_five_digit_number_can_be_generated
    assert_equal [], @keys.generate_keys
  end
end

# The keys are created by generating a random five digit number, like 02715, and splitting it up like so:
#
# A key: first two digits (02)
# B key: second and third digits (27)
# C key: third and fourth digits (71)
# D key: fourth and fifth digits (15)
