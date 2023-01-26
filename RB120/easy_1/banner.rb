class Banner
  def initialize(message, banner_width = message.size)
    @message = message
    @banner_width = [banner_width, 0].max
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private
  
  def horizontal_rule
    '+-' + '-' * @banner_width + '-+'
  end

  def empty_line
    '| ' + ' ' * @banner_width + ' |'
  end

  def message_line
    if @message.size > @banner_width
      cutoff = ((@message.size) - @banner_width) / 2
      print_message = @message[cutoff, @banner_width]
    else  
      print_message = @message.center(@banner_width)
    end
    "| #{print_message} |"
  end
end

banner = Banner.new('To boldly go where no one has gone before', 30)
puts banner