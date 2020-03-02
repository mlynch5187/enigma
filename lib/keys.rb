require './lib/generator'

class Keys
  include Generator
  extend Generator

  attr_reader :date,
              :letter_set,
              :a_key,
              :b_key,
              :c_key,
              :d_key,


  def initialize()
    @a_key = []
    @b_key = []
    @c_key = []
    @d_key = []
    @new_keys = {}
    @letter_set = ("a".."z").to_a << " "
  end

  def split_keys(keys = generated_keys)
    require "pry"; binding.pry

    @a_key << (keys[0..1].join).to_i
    @b_key << (keys[1..2].join).to_i
    @c_key << (keys[2..3].join).to_i
    @d_key << (keys[3..4].join).to_i
  end

  def generated_keys
    generate_sample
  end
end
