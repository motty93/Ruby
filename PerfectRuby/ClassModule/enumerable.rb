(1..3).reverse_each do |val|
  put val
end

# 要素をn個ずつ区切って表示
(1..5).each_slice 2 do |a, b|
  puts [a, b]
end

# n個の連続した要素を１つずつずらしながら繰り返す
(1..4).each_cons 2 do |a, b|
  puts [a, b]
end

# レシーバの要素を先頭から末尾まで繰り返し、永遠に繰り返す
(1..3).cycle do |n|
  puts n
  break if n % 3 == 0
end


# 全ての要素が真であればtrue
[true, true, true].all?
[true, true, false].all?

# 全ての要素が偽であればtrue
[true, true, true].none?
[false, false, false].none?

# １つでも真の要素があればtrue
# ブロックの結果がわかった時点で繰り返しが終了する
[true, true, true].any?
[false, false, true].any?

# １つでも真の要素があればtrue
[true, true, true].one?
[false, false, true].one?
