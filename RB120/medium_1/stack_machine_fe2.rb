class MinilangError < StandardError
end

class InvalidCommandError < MinilangError ; end

class EmptyStackError < MinilangError ; end

class Minilang
  VALID_COMMANDS = %w(push add sub mult div mod pop print)
  attr_reader :stack, :commands
  attr_accessor :register
  
  def initialize(instruction)
    @stack = []
    @register = 0
    @commands = instruction.split.map(&:downcase)
  end
  
  def eval
    until commands.empty?
      run_command(commands.shift)
    end
  rescue MinilangError => error
    puts error.message
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
    starting_value = register
    operation_result = starting_value + pop
    self.register = operation_result
  end
  
  def sub
    self.register -= pop
  end
  
  def mult
    self.register *= pop
  end
  
  def div
    self.register /= pop
  end

  def mod
    self.register %= pop
  end
  
  def pop
    raise EmptyStackError, "stack is empty!" if stack.empty?
    self.register = stack.pop
  end
  
  def print
    puts register
  end
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)