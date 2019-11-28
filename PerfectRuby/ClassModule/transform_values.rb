# 全ての値をブロックの実行結果で置き換えた新しいハッシュを返す
names = { a: 'alice', b: 'bob', c: 'carol' }

names.transform_values { |name| name.capitalize }
#=> valueの頭文字を大文字へ
