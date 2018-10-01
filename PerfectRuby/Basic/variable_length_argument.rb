# 可変長引数
# 仮引数の頭に*をつけると、そのメソッドは任意の数の引数を配列として受け取れるようになる。

def greet(name, *messages)
  messages.each do |message|
    puts "#{message}, #{name}."
  end
end

# 単に引数を無視したい場合にも使うことができる
def greeting(name, *)
  puts "Hello, #{name}."
end

greet 'Ruby', 'Hello', 'こんにちは'
greeting 'Ruby', 'こんにちは！', 'foo'
