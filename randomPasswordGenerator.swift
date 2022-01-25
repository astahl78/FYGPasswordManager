// This test uses the .randomElement method. Let's see if it works.

var password: String = ""

let defaultChar: Set = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z" ]
let specialChar: Set = ["?", "!", "$", "$"]
let numChar: Set = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

func passwordGenerator(length userChosenLength: Int, useSpecialChar: Bool, useNumbers: Bool) -> Void {
    var charList = Set<String>()

    /* If-then statement determines if the user's requested password length is long enough. If so, a series of if-then statements 
    determine which collection of sets should be drawn from in generating the password, based on whether the user requested that the password
    contain special characters, numbers, or just letters. */

    if userChosenLength < 8 {
        
        print("Passwords must be at least eight characters in length. Please try again.")

        password = ""

        // This (test) file merely prints the result of the function. In actual usage, the func should return a String, in the form of the password variable.

        // Below code determines the list of characters eligible for inclusion in randomized password.

    } else {
        
        if useSpecialChar && useNumbers {
            
            charList = defaultChar.union(specialChar).union(numChar)
            print("You chose to include both special characters and numbers in your password. Excellent!")

        } else if useSpecialChar {
            
            charList = defaultChar.union(specialChar)
            print("You chose to include special characters in your password. Next time, consider including numbers, as well.")

        } else if useNumbers {
            
            charList = defaultChar.union(numChar)
            
            print("You chose to include numbers in your password. Next time, consider including special characters, as well.")

        } else {
            
            charList = defaultChar
            print("You chose to include only letters in your password. For increased security, next time choose to include numbers or special characters (or preferable both!).")
          
        }

        // Note to self on the below - had to use "!" to force the compiler into including the element instead of returning an optional. Not about to mess about with if-let statements here.

        // maybe embed the below in an if-then statement that runs a while loop for each possible definition of charList. Easiest thing to do, then, would be to define the list as a function to avoid repetitious code. I dunno.
        
        var passwordCompliant:Bool = false //declares variable used to terminate while loop
        
        var passwordSet = Set<String>() //declares variable used to verify generated password is compliant with user-requested conditions
        
        // while loop generates a string by iterating through a for-in loop, each time adding a random element of the previously determined set to the variable "password" while also adding the same character to a Set composed of the same characters that comprise "password".
      
        while !passwordCompliant {
            for _ in 1...userChosenLength {
                let char = "\(charList.randomElement()!)"
                password += char
                passwordSet.insert(char)
                
            }
          
          // This feels inefficient, but was the only way I could think to do it. Declares three new sets which contain the intersection of the string (and set) generated by the above for-in loop and each category of characters which could be selected from in generating the password (i.e., letters, special, and numbers).
            
            let defaultChecker = passwordSet.intersection(defaultChar)
            let specialCharChecker = passwordSet.intersection(specialChar)
            let numChecker = passwordSet.intersection(numChar)

            if useSpecialChar && useNumbers {
                if defaultChecker.isEmpty || specialCharChecker.isEmpty || numChecker.isEmpty { //if any intersection results in an empty set, "password" is reset for another loop

                password = ""

            } else {

                passwordCompliant = true

            }
            } else if useSpecialChar {

            if defaultChecker.isEmpty || specialCharChecker.isEmpty {

                  password = ""

                } else {

                    passwordCompliant = true

                }

            } else if useNumbers {
                if defaultChecker.isEmpty || numChecker.isEmpty {

                  password = ""

                } else {

                    passwordCompliant = true

                }
            } else {

                passwordCompliant = true

            }
        }

        // while !password..contain
        /*  for _ in 1...userChosenLength {
             password += "\(charList.randomElement()!)"

         }
         */

        // return password (in actual generator, it should return the value for storage or whatever)
        print("Your randomized password is \(password)")

    }
}


//Sample function call
passwordGenerator(length: 19, useSpecialChar: true, useNumbers: true)


