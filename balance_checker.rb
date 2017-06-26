require 'byebug'
class BalanceCheck
  OPEN = ['{', '(', '[']
  OTHER = ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a.map {|x| x.to_s} + '\\!"#$%&\'*+,.:;<=>?@\^_`|~-/'.split("")
  attr_accessor :string

  def initialize(string)
    @string = string
  end

  def size
    string.size
  end

  def is_balanced?
    stack = []
    arr_of_chars = string.chars
    count = 0
    arr_of_chars.each do |char|
      count += 1
      if OPEN.include?(char)
        stack.push(char)
      elsif OTHER.include?(char)
        stack = stack
      else
        if stack.empty?
          return count
        end
        top = stack.pop
          if (top == '[' && char != ']') or (top == '(' && char != ')') or (top == '{' && char != '}')
            return count
          end
        end
      end

    if stack.empty?
      return "Success"
    else
      return count
    end
  end
end
