require './test/test_helper'
require './lib/enigma'
require './lib/generator'

class GeneratorTest < MiniTest::Test

  def setup
    # @generator = Generator.new
    # @generator_1 = mock("Generator 1")
  end

  def test_generator_exist
    assert_instance_of Generator, @generator
  end
end
