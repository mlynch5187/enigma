require './lib/generator'

class Enigma
  include Generator

  attr_reader :encrypted_key, :decrypted_key

  def initialize()
    @encrypted_message = []
    @encrypted_key = {}
    @decrypted_message = []
    @decrypted_key = {}
  end

  def encrypt(message, key = encode, date = todays_date)
    split_message = message.downcase.split(//)
    offset = Offset.new(key,date).final_offset

    split_message.map do |letter|
      if letter_set.include?(letter)
        new_letter = letter_set.rotate(letter_set.index(letter) + offset[0])
        @encrypted_message << new_letter[0]
        offset.rotate!
      else
        @encrypted_message << letter
      end
    end
    @encrypted_key[:encryption] = @encrypted_message.join
    @encrypted_key[:key] = key
    @encrypted_key[:date] = date
    @encrypted_key
  end

  def decrypt(encrypted_message, key, date = todays_date)
    encrypted_message = encrypted_message.downcase.split(//)
    offset = Offset.new(key,date).final_offset

    encrypted_message.map do |letter|
      if letter_set.include?(letter)
        new_letter = letter_set.rotate(letter_set.index(letter) - offset[0])
        @decrypted_message << new_letter[0]
        offset.rotate!
      else
        @decrypted_message << letter
      end
    end
    @decrypted_key[:decryption] = @decrypted_message.join
    @decrypted_key[:key] = key
    @decrypted_key[:date] = date
    @decrypted_key
  end
end
