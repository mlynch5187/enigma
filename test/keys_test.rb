require './test/test_helper'
require './lib/enigma'
require './lib/keys'

class KeysTest < MiniTest::Test

  def setup
    @keys = Keys.new
    @enigma = Enigma.new
    @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_keys_exist
    assert_instance_of Keys, @keys
  end

  def test_keys_can_be_split
    @keys.split_keys

    assert_equal [02], @keys.a_key
    assert_equal [27], @keys.b_key
    assert_equal [71], @keys.c_key
    assert_equal [15], @keys.d_key
  end
end
