# Enumerable#detect(find)
%w(4 4 2 3).map(&:to_i).detect(&:even?)

array = [1, 2, 3, 4, 5]

# 3以下を取得
array.take(3)
# ブロックが最初に偽を返すまで要素の配列を返す
array.take_while { |n| n < 3 }
# 3より先を取得
array.drop(3)
# ブロックが最初に偽を返してから要素の配列を返す
array.drop_while { |n| n < 3 }
