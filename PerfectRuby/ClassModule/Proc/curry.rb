# カリー化
# 複数の引数を取るようなProcオブジェクトがある場合に、それをその一部の引数だけを受けとれるようなものに変えること

# def join_ist(body)
#   body + 'ist'
# end
#
# def join_er(body)
#   body + 'er'
# end
#
# def join_ian(body)
#   body + 'ian'
# end

# 上記はDRYに反するので共通処理をひとつのメソッドでくくる
def join(suffix, body)
  body + suffix
end

def join_ist(body)
  join('ist', body)
end

def join_er(body)
  join('er', body)
end

def join_ian(body)
  join('ian', body)
end

# 以下はうまく行かないのでMethodオブジェクトを渡してやる
# p %w[real social ruby].map(&:join_ist)1
p %w[real social ruby].map(&method(:join_ist))
p %w[real social ruby].map(&method(:join_er))
p %w[real social ruby].map(&method(:join_ian))


# カリー化を使うと。。。
join = ->suffix,body{body + suffix}.curry
p %w[real social ruby].map(&join['ist'])
p %w[real social ruby].map(&join['er'])
p %w[real social ruby].map(&join['ian'])
# 上記のメソッドが不必要になる
