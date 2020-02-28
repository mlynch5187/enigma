require './test/test_helper'
require './lib/enigma'
require './lib/generator'

class GeneratorTest < MiniTest::Test

  def setup
    @generator = Generator.new
  end

  def test_generator_exist
    assert_instance_of Generator, @generator
  end

  def test_random_five_digit_number_can_be_generated
    assert_equal [3, 4, 9, 6, 2], @generator.stubs(:generate_keys).returns([3, 4, 9, 6, 2])
  end
end

# The generator are created by generating a random five digit number, like 02715, and splitting it up like so:
#
# A key: first two digits (02)
# B key: second and third digits (27)
# C key: third and fourth digits (71)
# D key: fourth and fifth digits (15)
