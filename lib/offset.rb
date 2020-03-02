require './lib/generator'

class Offset
  include Generator
  extend Generator

  attr_reader :a_offset,
              :b_offset,
              :c_offset,
              :d_offset,
              :a_final_shift,
              :b_final_shift,
              :c_final_shift,
              :d_final_shift

  def initialize()
    @date = Time.now.strftime("%d%m%Y")
    @a_offset = []
    @b_offset = []
    @c_offset = []
    @d_offset = []
    @a_final_shift = 0
    @b_final_shift = 0
    @c_final_shift = 0
    @d_final_shift = 0
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
end
