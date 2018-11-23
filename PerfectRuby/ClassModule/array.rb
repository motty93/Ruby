ary = Array.new(3, 'native')
ary.map(&:reverse!)

# ブロックも引数にできる
block_ary = Array.new(3) { |idx| idx.succ }

