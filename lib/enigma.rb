require 'date'

class Enigma
  attr_reader :date

  def initialize()
    @date = Time.now.strftime("%d/%m/%Y").to_s
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
