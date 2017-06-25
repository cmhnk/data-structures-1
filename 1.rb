class BalanceCheck
  OPEN = {curly: '{', paren: "(", bracket: "["}
  CLOSE = {curly: '}', paren: ')', bracket: ']'}

  attr_accessor :string

  def initialize(string)
    @string = string
  end

  def size
    string.size
  end

  def stack
    the_stack = []
    counter = 0
    while input.size > 0
      if OPEN.map {|_, v| v.match(input[counter])}.any? || CLOSE.map {|_, v| v.match(input[counter])}.any?
        the_stack << input[counter]
      end
      counter += 1
    end
    puts the_stack
  end
end
