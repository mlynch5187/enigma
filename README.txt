Self Evaluation


Functionality - 2

Although all tests are passing for encrypt and decrypt, and the command line interface works for encrypting, I am unable to successfully
run decryption through the command line. I am not sure if the decryption is not working correctly or if 
I am running the command line incorrectly, considering that decryption testing is passing.

OOP - 3 

The project is broken into two primary classes, the enigma and offset classes, and also includes a generator module.
No class is unreasonably small or large, and each class and module has specific responsibilities. The enigma class' responsibilities include encrypting and decrypting, the offset class holds methods that deal with offsetting the message, keys and date which are used in the enigma methods, and the generator module holds three methods that generate todays date, a random set of five keys, and a set of 27 letters and a space.

Ruby Conventions/Mechanics - 3

Code is mostly properly indented and spaced, and lines are not excessively long. Enumerables chosen are effective for 
their job, and I can speak to why I chose to use them or other data structures. Hashes are implemented in a logical manner in the encrypted_key and decrypted_key variables in the enigma class.

TDD - 3

Every method is tested at both the unit and integration level, and all tests are passing. Obvious edge cases are addressed, and my git history shows that tests were written before implementation code. Test coverage metrics between the three tests are nearing 100% coverage.
