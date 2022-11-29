def cleanup(str)
  clean_str = ''
  0.upto(str.size-1) do |i|
    if str[i] =~ /[a-z]/
      clean_str << str[i]
    else
      if clean_str[-1] != ' '
        clean_str << ' '
      end
    end
  end
  clean_str
end

p cleanup("---what's my +*& line?")
