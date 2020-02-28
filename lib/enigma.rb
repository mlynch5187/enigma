require './lib/generator.rb'

class Enigma
  include Generator
  extend Generator

  attr_reader :date, :letter_set, :a_key, :b_key, :c_key, :d_key

  def initialize()
    @date = Time.now.strftime("%d/%m/%Y").to_s
    @a_key = []
    @b_key = []
    @c_key = []
    @d_key = []
    @letter_set = ("a".."z").to_a << " "
  end

  def square_date
    @date.delete("/")
  end

  def generate_keys
    generate_sample
  end

  def split_keys
    generated_keys = generate_keys

    @a_key << generated_keys[0..1]
    @b_key << generated_keys[1..2]
    @c_key << generated_keys[2..3]
    @d_key << generated_keys[3..4]
  end

  def encrypt(message, key = nil, date = nil)
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
