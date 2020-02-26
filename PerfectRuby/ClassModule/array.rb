ary = Array.new(3, 'native')
ary.map(&:reverse!)

# ブロックも引数にできる
block_ary = Array.new(3) { |idx| idx.succ }

array = [1, 2, 2, 3]
puts array.delete_if { |v| false } # => レシーバを返す
puts array.reject! { |v| false } # => 条件に合わないのでnil

array = [1, 2, 2, 3]
puts array.keep_if { |v| true } # => レシーバを返す
puts array.select! { |v| true } # => 条件に合わないのでnil
