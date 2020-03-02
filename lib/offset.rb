class Offset
  attr_reader :key, :date

  def initialize(key = 5.times.map {rand(0..9)}.join, date = Time.now.strftime("%d%m%y"))
    @key = key
    @date = date
  end

end
