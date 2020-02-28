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

  def test_encrpyt_returns_a_hash
    assert_instance_of Hash, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_date_is_generated
    assert_equal "270220", @enigma.stubs(:date).returns("270220")
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
