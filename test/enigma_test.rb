require_relative 'test_helper'
require 'date'
require './lib/enigma'

class EngimaTest < MiniTest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

end
