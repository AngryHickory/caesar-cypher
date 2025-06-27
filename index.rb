def caesar_cypher(string, shift)
  result = ""  #=> This is an empty string that will be used to build up the encrypted text

  string.each_char do |char|  #=> This says to iterate over each character in "string"
    if char =~ /[a-zA-Z]/   #=> This is a regular expression used to check if the character is a letter
      if char =~ /[A-Z]/   #=> If it is a letter, this will check if it's uppercase
        char_ascii = char.ord   #=> This returns the ASCII numerical value (A = 65, Z = 90)
        base_ascii_for_uppercase = 'A'.ord   #=> This gets the ASCII value of uppercase A (65) to use as a starting point
        
        alphabet_index = char_ascii - base_ascii_for_uppercase  #=> This will normalize the the character's position to a range of 0-25
        shifted_index = alphabet_index + shift   #=> This takes the 0-25 index and adds the shift value to it. It's the raw shifted position, which can go above or below 0-25
        wrapped_shifted_index = shifted_index % 26   #=> this uses the modulo operator % to create wrap-around logic that will keep the shifted_index in the 0-25 range
        new_char_ascii = wrapped_shifted_index + base_ascii_for_uppercase   #=> This takes the final wrapped index and adds 65 back to it, returning it to its original ASCII value
        result << new_char_ascii.chr  #=> This uses the shovel operator to append the new character to the result string
      elsif char =~ /[a-z]/   #=> If it is a letter, and isn't uppercase, this will check if it's lowercase
        char_ascii = char.ord  #=> This returns the ASCII numerical value (a = 97, z = 122)
        base_ascii_for_lowercase = 'a'.ord   #=> This gets the ASCII value of lowercase a (97) to use as a starting point

        alphabet_index = char_ascii - base_ascii_for_lowercase   #=> This will normalize the the character's position to a range of 0-25
        shifted_index = alphabet_index + shift  #=> This takes the 0-25 index and adds the value of shift to it
        wrapped_shifted_index = shifted_index % 26   #=> this uses the modulo operator % to create wrap-around logic that will keep the shifted_index in the 0-25 range
        new_char_ascii = wrapped_shifted_index + base_ascii_for_lowercase   #=> This takes the final wrapped index and adds 97 back to it, returning it to its original ASCII value
        result << new_char_ascii.chr   #=> This appends the new characer to the result string
      end
    else
      result << char  #=> if the character is NOT a letter, this else statement appends it to the result witout modifying it
    end
  end

  result
end