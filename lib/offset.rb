require './lib/generator'

class Offset
  include Generator

  attr_reader :key, :date, :split_keys, :offset_keys

  def initialize(key = encode, date = todays_date)
    @key = key
    @date = date
    @split_keys = []
    @offset_keys = []
  end

  def split_keys
    key.split(//).each_cons(2) { |number| @split_keys << number.join }
    @split_keys.map { |key| key.to_i }
  end

  def square_date
    (date.to_i ** 2).to_s
  end

  def offset_date
    string_offset_date = square_date[-4..-1].split(//)
    string_offset_date.map { |number| number.to_i }
  end

  def final_offset
    @offset_keys << (offset_date[0] + split_keys[0])
    @offset_keys << (offset_date[1] + split_keys[1])
    @offset_keys << (offset_date[2] + split_keys[2])
    @offset_keys << (offset_date[3] + split_keys[3])
    @offset_keys
  end
end
