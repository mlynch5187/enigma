Enigma

What is Enigma?

Enigma is a program that allows the user to encrypt or decrypt a message.


Instructions: How do I use Enigma?

To use Enigma, simply create a text file with the message you wish to encrypt.
In the Terminal command line, run ruby, followed by the file that encrypts (encrypt.rb),
the file you wish to encrypt (message.txt), and the file the encryption will be
written to (encrypted.txt)

Terminal CL: ruby encrypt.rb message.txt encrypted.txt

If successful, you will see the message 'Created 'encrypted.txt' with the key 06465 and date 030320'

Created 'decrypted.txt' with the key 06465 and date 030320

To decrypt, run ruby, followed by the file that decrypts (decrypt.rb),
the file you wish to decrypt (encrypted.rb), and the file the encryption will be
written to (decrypted.rb). You also need to include the key and date from the encrypted file:

Terminal CL: ruby decrypt.rb encrypted.txt decrypted.txt 06465 030320

Created 'decrypted.txt' with the key 06465 and date 030320


Self Evaluation

Functionality - 3

All tests are passing in the project, and encryption, decryption and the CLI are all working.

OOP - 3

The project is broken into two primary classes, the enigma and offset classes, and also includes a generator module.
No class is unreasonably small or large, and each class and module has specific responsibilities. The enigma class' responsibilities include encrypting and decrypting, the offset class holds methods that deal with offsetting the message, keys and date which are used in the enigma methods, and the generator module holds three methods that generate todays date, a random set of five keys, and a set of 27 letters and a space.

Ruby Conventions/Mechanics - 3

Code is mostly properly indented and spaced, and lines are not excessively long. Enumerables chosen are effective for
their job, and I can speak to why I chose to use them or other data structures. Hashes are implemented in a logical manner in the encrypted_key and decrypted_key variables in the enigma class.

TDD - 3

Every method is tested at both the unit and integration level, and all tests are passing. Obvious edge cases are addressed, and my git history shows that tests were written before implementation code. Test coverage metrics between the three tests are nearing 100% coverage.
