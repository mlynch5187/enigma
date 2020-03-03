require_relative 'test_helper'
require 'date'
require './lib/enigma'
require './lib/offset'

class EngimaTest < MiniTest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_enigma_can_encrypt_message_with_key_and_date
    expected = {encryption: "keder ohulw", key: "02715", date: "040895"}
    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_enigma_can_encrypt_massage_with_key_and_todays_date
    expected = {encryption: "lib sdmcvpu", key: "02715", date: "020320"}
    assert_equal expected, @enigma.encrypt("hello world", "02715")
  end

  def test_enigma_can_decrypt_message_with_key_and_date
    expected = {decryption: "hello world", key: "02715", date: "040895"}
    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_enigma_can_decrypt_message_with_key_and_todays_date
    expected = {decryption: "hello world", key: "02715", date: "020320"}
    assert_equal expected, @enigma.decrypt("lib sdmcvpu", "02715")
  end
end
