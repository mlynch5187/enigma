class Offset
  attr_reader :key, :date, :split_keys

  def initialize(key = 5.times.map {rand(0..9)}.join, date = Time.now.strftime("%d%m%y"))
    @key = key
    @date = date
    @split_keys = []
  end

  def split_keys
    key.split(//).each_cons(2) {|number| @split_keys << number.join}
    @split_keys.map {|key| key.to_i}
  end

  def square_date
    (date.to_i ** 2).to_s
  end

  def offset_date
    string_offset_date = square_date[-4..-1].split(//)
    string_offset_date.map {|number| number.to_i}
  end
end
