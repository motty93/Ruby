module Person
  class Child
    def self.hello
      puts 'hello'
      ok
    end

    def ok
      puts 'ok'
      hello
    end
  end
end

child = Person::Child.new
child.ok
# クラスメソッドはインスタンスオブジェクトからは呼び出せない。

Person::Child.hello
# hello
# Traceback (most recent call last):
# from class_methods.rb:14:in `<main>'
# class_methods.rb:5:in `hello': undefined local variable or method `ok' for Person::Child:Class (NameError)

# インスタンスメソッドはクラスオブジェクトからは呼び出せない。
