def rpn(expression)
  operators = {'+' => 1, '-' => 1, '*' => 2, '/' => 2 }

  output = []
  stack = []

  tokens = expression.scan(/\d+|[-+*\/()]|\S+/)

  tokens.each do |token|
    if token.match?(/\d+/)
      output.push(token)
    elsif operators.key?(token)
      while stack.any? && operators.key?(stack.last) && operators[token] <= operators[stack.last]
        output.push(stack.pop)
      end
      stack.push(token)
    elsif token == '('
      stack.push(token)
    elsif token == ')'
      while stack.any? && stack.last != '('
        output.push(stack.pop)
      end
      stack.pop if stack.last == '('
    end
  end

  while stack.any?
    output.push(stack.pop)
  end

  output.reject! { |token| token == '(' || token == ')' }

  output.join(' ')
end

expression = ARGV.join('')
puts rpn(expression)
