Classes

Enigma - parent class?, runner file

  encrypt method: The encrypt method returns a hash with three keys:
    Encrypt.new = {:key => "encrypted_string", :key => "key_used_for_encryption", :date => "MMDDYY"}

    :encryption => the encrypted String
    :key => the key used for encryption as a String
    :date => the date used for encryption as a String in the form DDMMYY

  decrypt method: The decrypt method returns a hash with three keys:
    :decryption => the decrypted String
    :key => the key used for decryption as a String
    :date => the date used for decryption as a String in the form DDMMYY

The Enigma class will respond to this interaction pattern:

pry(main)> require 'date'
#=> true

pry(main)> require './lib/enigma'
#=> true

pry(main)> enigma = Enigma.new
#=> #<Enigma:0x00007ff90f24cb78...>

# encrypt a message with a key and date
pry(main)> enigma.encrypt("hello world", "02715", "040895")
#=>
#   {
#     encryption: "keder ohulw",
#     key: "02715",
#     date: "040895"
#   }

# decrypt a message with a key and date
pry(main) > enigma.decrypt("keder ohulw", "02715", "040895")
#=>
#   {
#     decryption: "hello world",
#     key: "02715",
#     date: "040895"
#   }

# encrypt a message with a key (uses today's date)
pry(main)> encrypted = enigma.encrypt("hello world", "02715")
#=> # encryption hash here

#decrypt a message with a key (uses today's date)
pry(main) > enigma.decrypt(encrypted[:encryption], "02715")
#=> # decryption hash here

# encrypt a message (generates random key and uses today's date)
pry(main)> enigma.encrypt("hello world")
#=> # encryption hash here

Enigma as a runner file:
  Takes two command line arguments:
    existing file with message to encrypt
