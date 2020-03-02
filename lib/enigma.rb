class Enigma
  attr_reader :encrypted_message

  def initialize()
    @encrypted_message = []
    @encrypted_key = {}
  end

  def encrypt(message, key = 5.times.map {rand(0..9)}.join, date = Time.now.strftime("%d%m%y"))
    letter_set = ("a".."z").to_a << " "
    split_message = message.downcase.split(//)
    offset = Offset.new(key,date).final_offset

    message.map do |letter|
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
  end
end
