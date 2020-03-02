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

  def test_can_encrypt_message_with_key_and_date
    expected = {encryption: "keder ohulw", key: "02715", date: "040895"}
    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_can_encrypt_message_with_key_and_date_and_special_char
    expected = {encryption: "keder, ohulw", key: "02715", date: "040895"}
    assert_equal expected, @enigma.encrypt("hello, world", "02715", "040895")
  end

end
