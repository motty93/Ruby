class Parent
  def greet
    puts 'hi'
  end
end

class Child < Parent
  def greet(name)
    puts "hi, #{name}"
  end
end

class GrandChild < Child
  def greet(name)
    super

    puts 'Nice'
  end
end

grandchild = GrandChild.new
grandchild.greet 'ruby'
