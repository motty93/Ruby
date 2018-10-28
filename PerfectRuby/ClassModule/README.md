# 主な組み込みクラス・モジュール
## クラスメソッドとインスタンスメソッド

```
module Person
  class Child
    def self.hello
      puts 'hello'
      ok
    end

    def ok
      puts 'ok'
      hello
    end
  end
end

child = Person::Child.new
child.ok

Person::Child.hello
# hello
# Traceback (most recent call last):
# from class_methods.rb:14:in `<main>'
# class_methods.rb:5:in `hello': undefined local variable or method `ok' for Person::Child:Class (NameError)

# インスタンスメソッドはクラスオブジェクトからは呼び出せない。

```

クラスメソッドはインスタンスオブジェクトからは呼び出せない。

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

### 文字列の整形

`String#squeeze`を使うと、文字列の中で同じ文字が連続している場合に１つにまとめることができる。

```
'woooooooo'.squeeze # => 'wo'
'aabbccdd'.squeeze('abc') # => 'abcdd'
```

`String#sub`はあるパターンに最初にマッチした文字列を置換する。
`String#gsub`はマッチする文字列全てを置換する。

上記２つは、第二引数の代わりにブロックを渡せる。

## Regexp

### パターンマッチ

`Regexp#=~`はマッチした位置を返す。マッチしなければnilを返す。

`true`か`false`を期待している場合は`Regexp#===`を使う。

```rb
def alice?(pattern)
  pattern === 'alice'
end

alice?(/Alice/i) # => true
alice?('alice') # => true

```


