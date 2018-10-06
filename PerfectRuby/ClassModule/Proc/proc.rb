def square(n)
  n * n
end

def print_func(arg, fun)
 puts fun.call(arg)
end

# squareメソッドを引数で渡す
# print_func(4, square) エラーになる（Argument Error）

# Object#methodにメソッドを渡すとMethodオブジェクトが生成される
sq = method(:square)
p sq
# NoMethodError
# p sq(1)

# メソッドをMethodオブジェクトでラップすると、それがcallされるまで評価を遅延できる
p sq.call(2)
p sq[2]
p sq.(2)
print_func(2, sq)
