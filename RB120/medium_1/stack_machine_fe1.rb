class MinilangError < StandardError
end

class InvalidCommandError < MinilangError ; end

class EmptyStackError < MinilangError ; end

class Minilang
  VALID_COMMANDS = %w(push add sub mult div mod pop print)
  attr_reader :stack, :program
  attr_accessor :register
  
  def initialize(instruction)
    @stack = []
    @register = 0
    @program = instruction
  end
  
  def eval(inputs)
    final_program = format(program, inputs)
    commands = final_program.split.map(&:downcase)
    until commands.empty?
      run_command(commands.shift)
    end
  end
  
  def run_command(command)
    if VALID_COMMANDS.include?(command)
      self.send(command.downcase)
    elsif command =~ /\A[-+]?\d+\z/
      self.register = command.to_i
    else
      raise InvalidCommandError, "Invalid command #{command}"
    end
  end
  
  def push
    stack.push(register)
  end
  
  def add
    raise EmptyStackError, "stack is empty!" if stack.empty?
    self.register += stack.pop
  end
  
  def sub
    raise EmptyStackError, "stack is empty!" if stack.empty?
    self.register -= stack.pop
  end
  
  def mult
    raise EmptyStackError, "stack is empty!" if stack.empty?
    self.register *= stack.pop
  end
  
  def div
    raise EmptyStackError, "stack is empty!" if stack.empty?
    self.register /= stack.pop
  end

  def mod
    raise EmptyStackError, "stack is empty!" if stack.empty?
    self.register %= stack.pop
  end
  
  def pop
    raise EmptyStackError, "stack is empty!" if stack.empty?
    self.register = stack.pop
  end
  
  def print
    puts register
  end
end

CENTIGRADE_TO_FAHRENHEIT =
  '5 PUSH %<degrees_c>d PUSH 9 MULT DIV PUSH 32 ADD PRINT'
  
FAHRENHEIT_TO_CENTIGRADE =
  '5 PUSH 9 PUSH 32 PUSH %<degrees_f>d SUB DIV MULT PRINT'
  
MPH_TO_KPH =
  '3 PUSH 5 PUSH %<mph>d MULT DIV PRINT'

AREA_OF_RECTANGLE = 
  '%<width>d PUSH %<height>d MULT PRINT'  
  
minilang = Minilang.new(AREA_OF_RECTANGLE)
minilang.eval(width: 2, height: 5)
# 212
