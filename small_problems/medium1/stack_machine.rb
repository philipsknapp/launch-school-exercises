NEEDS_STACK = %w(ADD SUB MULT DIV MOD POP)

def mini_push(stack, register)
  stack.push(register)
  [stack, register]
end

def mini_add(stack, register)
  register += stack.pop
  [stack, register]
end

def mini_sub(stack, register)
  register -= stack.pop
  [stack, register]
end

def mini_mult(stack, register)
  register *= stack.pop
  [stack, register]
end

def mini_div(stack, register)
  register /= stack.pop
  [stack, register]
end

def mini_mod(stack, register)
  register %= stack.pop
  [stack, register]
end

def mini_pop(stack, register)
  register = stack.pop
  [stack, register]
end

def mini_print(stack, register)
  puts register
  [stack, register]
end

def task_assign(stack, register, command)
  return [stack, command.to_i] if command.to_i.to_s == command
  return ["error", "Error! Stack is empty, cannot perform #{command}"] \
    if NEEDS_STACK.include?(command) && stack.empty?
  case command
  when 'PUSH'   then mini_push(stack, register)
  when 'ADD'    then mini_add(stack, register)
  when 'SUB'    then mini_sub(stack, register)
  when 'MULT'   then mini_mult(stack, register)
  when 'DIV'    then mini_div(stack, register)
  when 'MOD'    then mini_mod(stack, register)
  when 'POP'    then mini_pop(stack, register)
  when 'PRINT'  then mini_print(stack, register)
  else ["error", "Error! #{command} is not a valid command."]
  end
end

def minilang(command)
  stack = []
  register = 0
  command_stack = command.split.reverse
  until command_stack.empty?
    stack, register = task_assign(stack, register, command_stack.pop)
    return register if stack == "error"
  end
  nil
end