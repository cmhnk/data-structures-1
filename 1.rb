class BalanceCheck
  OPEN = {curly: '{', paren: "(", bracket: "["}
  CLOSE = {curly: '}', paren: ')', bracket: ']'}
  OTHER = ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a + '\\!"#$%&\'*+,.:;<=>?@\^_`|~-/'.split("")
  attr_reader :string
  attr_writer :string

  def initialize(string)
    @string = string
  end

  def size
    string.size
  end

  def is_balanced?
    stack = []
    string.each_char do |char|
      if OPEN.values.include?(char)
        stack.push(char)
      elsif stack.empty?
        return false
      else
        top = stack.pop
          if (top = '[' && char != ']') | (top = '(' && char != ')') | (top = '{' && char != '}')
            return false
          end
        end
      end
    return stack.empty?
  end
end

  #     if OPEN.map {|_, v| v.match(input[counter])}.any?
  #
  #
  #
  #        CLOSE.map {|_, v| v.match(input[counter])}.any?
  #       the_stack << input[counter]
  #     end
  #     counter += 1
  #   end
  #   puts the_stack
  # end
# end
