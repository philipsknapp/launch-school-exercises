VALID_CHARS = "12345678910abcdefghijklmnopqrstuvwxyz"

def palindrome(str)
  str == str.reverse
end

def real_palindrome?(str)
  alpha_str = ''
  for char in str.downcase.chars do
    if VALID_CHARS.include?(char)
      alpha_str << char
    end
  end
  palindrome(alpha_str)
end

p real_palindrome?("Modem, I'm Adam")