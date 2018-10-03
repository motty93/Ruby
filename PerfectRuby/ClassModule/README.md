# 主な組み込みクラス・モジュール
## Numeric

### 丸め操作

* ceil: 自身と等しいか、自身より大きい整数のうち最小のものを返す
* floor: 自身と等しいか、自身より小さい誠意数のうち最大のものを返す
* round: 自身に近い整数に丸める（単純な四捨五入に使う）
* truncate: 自身と０との間で、自身に最も近い整数を返す(ガウスの整数)

```
2.4.round
2.5.round
2.5.round(half: :even)
-1.5.round
125.round(-1)
```

`rounding.rb`参照

### Integer

整数への変換

```
'123'.to_i
Time.now.to_i
```

または`Kernel.#Integer`を用いる方法もある。

```
Integer('4423') # => 4423
Integer('3.14') # => 3
Integer('abc') # ArgumentError
Integer(nil) # TypeError
```

`to_i`と違って *例外を発生させる* ことができる。

## String

### 部分文字列の取得

```
str = 'asdf hello world 50'

str.slice(4) # => 位置を指定
str.slice(4, 6) # => 開始位置と取得文字数
str.slice(4..9) # => 文字列の範囲
str.slice(/[0-9]+/)  # => 正規表現で指定
```

かわりに`String#[]`を用いることもできる。
