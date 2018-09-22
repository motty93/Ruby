class Parent
  @@val = 'foo'

  def self.say
    puts @@val
  end
end

class Child < Parent
  def say
    @@val = 'hoge'
    puts @@val
  end

  def hoge
    puts @@val
  end
end

Parent.say
Child.say
Child.new.say
Child.new.hoge
