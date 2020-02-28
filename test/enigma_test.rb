require './test/test_helper'
require './lib/enigma'

class EnigmaTest < MiniTest::Test

  def setup
    @enigma = Enigma.new
    @enigma.encrypt("hello world", "02715", "040895")
    # @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_enigma_exists
    assert_instance_of Enigma, @enigma
  end

  def test_date_is_generated
    @enigma.stubs(:date).returns("270220")

    assert_equal "270220", @enigma.date
  end

  def test_letter_set_is_created
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]

    assert_equal expected, @enigma.letter_set
  end

  def test_random_five_digit_number_can_be_generated
    @enigma.stubs(:generate_keys).returns([3, 4, 9, 6, 2])

    assert_equal [3, 4, 9, 6, 2], @enigma.generate_keys
  end

  def test_keys_can_be_split
    skip
    @enigma.split_keys

    assert_equal [], @enigma.a_key
    assert_equal [], @enigma.b_key
    assert_equal [], @enigma.c_key
    assert_equal [], @enigma.d_key
    # assert_equal [[3,4], [4, 9], [9, 6], [6, 2]], @generator.stubs(:split_keys).returns([[3,4], [4, 9], [9, 6], [6, 2]])
  end

  def test_encrpyt_returns_a_hash
    assert_instance_of Hash, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_date_can_be_squared
    assert_equal 1, @enigma.square_date
  end

  def test_messages_can_be_encrypted_with_a_key
    skip
    assert_equal ({:encryption => "keder ohulw", :key => "02715"}), @enigma.encrypt("hello world", "02715")
  end

  def test_messages_can_be_encrypted
    skip
    expected = {encryption: "keder ohulw", key: "02715", date: "040895"}

    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_messages_can_be_decrypted
    skip
    expected = {decryption: "hello world", key: "02715", date: "040895"}

    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end
end

# #decrypt a message with a key (uses today's date)
# pry(main) > enigma.decrypt(encrypted[:encryption], "02715")
# #=> # decryption hash here
#
# # encrypt a message (generates random key and uses today's date)
# pry(main)> enigma.encrypt("hello world")
# #=> # encryption hash here
