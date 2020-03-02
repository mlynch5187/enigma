require './lib/generator'

class Enigma
  include Generator
  extend Generator

  attr_reader :date,
              :letter_set,
              :a_key,
              :b_key,
              :c_key,
              :d_key,
              :a_offset,
              :b_offset,
              :c_offset,
              :d_offset,
              :a_final_shift,
              :b_final_shift,
              :c_final_shift,
              :d_final_shift

  def initialize()
    @date = Time.now.strftime("%d%m%Y")
    @a_key = []
    @b_key = []
    @c_key = []
    @d_key = []
    @a_offset = []
    @b_offset = []
    @c_offset = []
    @d_offset = []
    @a_final_shift = 0
    @b_final_shift = 0
    @c_final_shift = 0
    @d_final_shift = 0
    @letter_set = ("a".."z").to_a << " "
  end

  def split_keys(keys = generated_keys)
    @a_key << (keys.chars[0..1].join).to_i
    @b_key << (keys.chars[1..2].join).to_i
    @c_key << (keys.chars[2..3].join).to_i
    @d_key << (keys.chars[3..4].join).to_i
  end

  def square_date
    date_as_integer = @date.to_i
    date_as_integer *= date_as_integer
  end

  def last_four_digits
    square_date.to_s[-4,4].chars
  end

  def offset
    @a_offset << last_four_digits[0].to_i
    @b_offset << last_four_digits[1].to_i
    @c_offset << last_four_digits[2].to_i
    @d_offset << last_four_digits[3].to_i
  end

  def final_shift
    @a_final_shift = (@a_key + @a_offset).sum
    @b_final_shift = (@b_key + @b_offset).sum
    @c_final_shift = (@c_key + @c_offset).sum
    @d_final_shift = (@d_key + @d_offset).sum
  end

  def generated_keys
    generate_sample
  end

  def encrypt(message, key = nil, date = square_date)
    encrypted_message = {}

    split_keys(key)
    square_date
    last_four_digits
    offset
    final_shift

    if message != nil
      encrypted_message[:encryption] = message

      message.length.times do

        letter = letter_set.find do |letter|
          letter.include?(message[0]) == true
        end

        letter_index = letter_set.index(letter)
        spaces_to_shift = letter_index + a_final_shift

        # message[0] = letter_set[spaces_to_shift]
        # require "pry"; binding.pry
        # message[0]
      end
    end

    if key != nil
      encrypted_message[:key] = key
    end

    if date != nil
      encrypted_message[:date] = @date
    end

    encrypted_message
  end
end
