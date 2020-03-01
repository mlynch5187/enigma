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
    Time.stubs(:now).returns(Time.new("29022020"))

    assert_equal "29022020", @enigma.date
  end

  def test_letter_set_is_created
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]

    assert_equal expected, @enigma.letter_set
  end

  def test_random_five_digit_number_can_be_generated
    @enigma.stubs(:generate_sample).returns([0, 2, 7, 1, 5])

    assert_equal [0, 2, 7, 1, 5], @enigma.generated_keys
  end

  def test_keys_can_be_split
    @enigma.split_keys("32321")

    assert_equal [02], @enigma.a_key
    assert_equal [27], @enigma.b_key
    assert_equal [71], @enigma.c_key
    assert_equal [15], @enigma.d_key
  end

  def test_encrpyt_returns_a_hash
    assert_instance_of Hash, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_date_can_be_squared_return_last_four_digits
    assert_equal 842277644880400, @enigma.square_date
    assert_equal ["0", "4", "0", "0"], @enigma.last_four_digits
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
