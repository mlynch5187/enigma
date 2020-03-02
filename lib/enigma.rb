class Enigma

  def initialize()

  end

  def encrypt(message, key = 5.times.map {rand(0..9)}.join, date = Time.now.strftime("%d%m%y"))
    letter_set = ("a".."z").to_a << " "
    split_message = message.downcase.split(//)
    offset = Offset.new(key,date).final_offset
    encrypt_message = []

  end
end
