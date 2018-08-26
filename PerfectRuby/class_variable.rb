class Myclass
  @@hello = "hello"

  def hello_in_method
    puts @@hello
  end

  def self.hello_in_class_method
    puts @@hello
  end
end

my_object = Myclass.new

my_object.hello_in_method
Myclass.hello_in_class_method
