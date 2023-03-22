class Machine
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  def on?
    switch == :on
  end

  private
  attr_accessor :switch
    
  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

mine = Machine.new
mine.start
mine.stop

p mine.on?