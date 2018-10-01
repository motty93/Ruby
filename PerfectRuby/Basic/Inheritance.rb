# スーパークラス
class Parent
  def hello
    puts 'Hello, Parent class.'
  end
end

# Parentを継承したサブクラス
class Child < Parent
  def hello
    super # Parent#helloが呼び出される

    puts 'Hello, Child class.'
  end

  def hi
    puts 'Hello, Child class.'
  end
end

child = Child.new
child.hello
child.hi
