ary = ['1', 2.0, 3.0, [4]]

# クラスでまとめる
ary.group_by { |val| val.class }
ary.group_by(&:class)

# ブロックの戻り値を真偽値として使い、自身を２つのグループに分けた配列を返す
ary.partition { |n| n.even? }
ary.partition(&:even?)
