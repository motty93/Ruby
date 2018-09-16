class MyClass
  def method_a
    puts 'method a!'
  end

  def method_b
    # 同じインスタンスのmethod_aを呼び出す
    method_a
  end
end

my_object = MyClass.new
my_object.method_b
