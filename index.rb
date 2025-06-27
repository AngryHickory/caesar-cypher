def caesar_cypher(string, shift)
  result = ""

  string.each_char do |char|
    if char =~ /[a-zA-Z]/
      if char =~ /[A-Z]/
        char_ascii = char.ord
        base_ascii_for_uppercase = 'A'.ord
      elsif char =~ /[a-z]/
        char_ascii = char.ord
        base_ascii_for_lowercase = 'a'.ord
      end
    else
      result << char
    end
  end
end