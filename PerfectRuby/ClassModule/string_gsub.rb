# subやgsubは第二引数の代わりにブロックを渡せる
'21-1-365'.gsub(/([0-9]+)/) { |str| str.to_i.succ }
# 組み込み変数を使って下のようにかける
'21-1-365'.gsub(/([0-9]+)/) { $1.to_i.succ }
