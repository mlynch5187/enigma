require './lib/generator.rb'

class Enigma
  include Generator
  extend Generator

  attr_reader :date, :letter_set, :a_key, :b_key, :c_key, :d_key

  def initialize()
    @date = Time.now.strftime("%d%m%Y")
    @a_key = []
    @b_key = []
    @c_key = []
    @d_key = []
    @letter_set = ("a".."z").to_a << " "
  end

  def square_date
    date_as_integer = @date.to_i
    date_as_integer *= date_as_integer
  end

  def last_four_digits
    square_date.to_s[-4,4].chars
  end

  def generated_keys
    generate_sample
  end

  def split_keys(keys = generated_keys, date = nil)
    # generated_keys = generate_keys
    # key_hash = {}
    # key_hash[a_key] = generated_keys[0..1]

    @a_key << keys.chars[0..1].join
    @b_key << keys.chars[1..2].join
    @c_key << keys.chars[2..3].join
    @d_key << keys.chars[3..4].join
  end


  def encrypt(message, key = nil, date = squared_date)
    encrypted_message = {}

    if message != nil
      encrypted_message[:encryption] = message
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
