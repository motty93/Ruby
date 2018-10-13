class X
  n = 2
  %w[a b c].each do |name|
    # define_methodメソッドは、クラスやモジュールにメソッドを定義します。defによるメソッド定義を使わずにメソッドを定義できる。
    # 引数にはメソッド名を渡し、メソッドの本体はブロックで記述します。
    define_method(name) do
      n += 1
    end
  end
end

# 実行すればわかる影響範囲
x = X.new
p x.a # => 3
p x.b # => 4
p x.c # => 5
p x.a # => 6
p x.b # => 7

x2 = X.new
p x2.a # => 8
p x2.b # => 9
p x2.c # => 10
