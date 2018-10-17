str = 'alice, bob, charlie'

str.split(', ')
str.split(/,\s/)

# 第二引数を与えると、その数だけ配列の要素に分割する
str.split(/,\s/, 2)

# 空白を基準に配列にする
str.split

# 文字列から文字の配列を取得する
str.split(//)
str.each_char.to_a
