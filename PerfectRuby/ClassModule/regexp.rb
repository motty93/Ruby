# Regexp#=== は真偽値を返す
# 文字列も評価できる
p /[0-9]/ === 'ruby'
p /[0-9]/ === 'ruby0'
p 'ruby' === 'ruby'

# Regexp#=~ マッチした位置を返す
p /[0-9]/ =~ 'ruby'
p /[0-9]/ =~ 'ruby0'

# String#scan は与えられた正規表現にマッチした部分文字列を配列で返す
# 括弧によるグルーピングがある場合には配列の配列を返す
# ブロックを渡すこともできる
str = 'sasamoto yamaguchi yamamoto'

p str.scan(/\w+moto/)
p str.scan(/(\w+)moto/)
str.scan(/\w+moto/) { |s| puts s.upcase }
str.scan(/(\w+)moto/) { |s| puts s[0].upcase }
