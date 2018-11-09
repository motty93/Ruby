[1, 2, 3, 4].sum
{ 1 => 2, 3 => 4}.sum { |k, v| k + v }

# 空配列の挙動が異なる
# sumの初期値には0が使われる
[].sum # => 0
[].inject(:+) # => nil

# 初期値を明示しないと動かないことがあるので注意
%W(ori gami).sum('')
%W(ori gami).sum
