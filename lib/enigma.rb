class Enigma

  def initialize()

  end

  def encrypt(encryption, key, date)
    encrypted_message = {}

    encrypted_message[:encryption] = encryption
    encrypted_message[:key] = key
    encrypted_message[:date] = date

    encrypted_message
  end
end
