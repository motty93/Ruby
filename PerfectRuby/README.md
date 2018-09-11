# パーフェクト Ruby 第2版

## トップレベル
クラスの定義式やモジュールの定義式の外をトップレベルと呼ぶ。

#### 特徴
* メソッド呼び出しの際レシーバを記述しない
* 関数の用に、どこからでもグローバルに呼び出すことができる

## ローカル変数
先頭が小文字のアルファベットかアンダースコアで始まる。

以下をスコープ。

* ブロック
* メソッド定義
* クラス・モジュール定義
* トップレベル

スコープ外を参照しようとするとエラーになる。

例えば、メソッド外で定義されたローカル変数をメソッドの中で参照できない。

ブロック外で定義されたものはブロックでも参照できる。

ブロック内のものは外で参照できない。

## 定数
変化しない値を扱う際に定数を使う。

同じ定数に再代入すると、エラーは出ないが警告が出る。

メソッドの中で定数を定義すると、`dynamic constant assignment(SyntaxError)`が出る。

## self
メソッドの中で、そのメソッドが属しているインスタンスを`self`という名前の擬似変数で参照できる（他の言語でのthisのようなもの）。

## 初期化
クラスの初期化は`initialize`メソッドで行う。

## クラスメソッド
メソッドの前に`self.`をつけて定義する。

* `class_method.rb` 参照
クラスメソッドの中での`self`は、そのメソッドが属するクラスになる。

したがって、`Ruler.pair`の中では`Ruler.new`の代わりに、`self.new`と書くこともできる。

## クラス変数
クラスとそのインスタンスをスコープとした変数のこと。

`@@変数`で表記する。

クラス変数はクラス定義の中やクラスメソッド、クラスメソッドから参照できる。

## 継承
Rubyでは単一継承をサポートしている。

継承された方をスーパークラス、継承した方をサブクラスという。

以下の形式。

```
class サブクラス名 < スーパークラス名
end
```

サブクラスにはスーパークラスに定義されたメソッドが継承される。

スーパークラスで既に定義されているメソッドをサブクラスで再び定義することを、メソッドの`オーバーライド`という。

`super`を使うと、スーパークラスに定義されている同じ名前のメソッドが呼び出せる。

## モジュール

Rubyといえばこいつ。`インスタンスを生成できないクラスのようなもの`。

以下の形式。

```
module モジュール名
end
```

#### 特徴
* あるクラスのインスタンスメソッドとして取り込む
* あるオブジェクトのメソッドとして取り込む
* モジュール関数として使う

```
module Brainfsck
  class Parser
  end
end

module Whitespace
  class Parser
  end
end

# ::を用いて参照する
Brainfsck::Parser
Whitespace::Parser
```

## 組み込み変数

よく使うやつたち

```
* $?  最後に終了した子プロセスの終了ステータス
* $1, $2, $3, ..., $n  最後に成功した正規表現マッチでn番目の括弧にマッチした値
* $+  最後に成功した正規表現マッチで最後の括弧にマッチした値
* $&  最後に正規表現でマッチした文字列
* $'  最後に正規表現でマッチした文字列よりも後ろの文字列
* $`  最後に正規表現でマッチした文字列よりも前の文字列
```

## ファイルの途中で処理を呼び出し元に戻す

Ruby2.4からトップレベルでも`return`を使えるようになった。

```
puts 'こんにちは'

return unless $0 == __FILE__

puts 'このファイルは直接実行されたようです。'
```

$0は$PROGRAM_NAMEと同じ意味。rubyコマンドに渡されたRubyスクリプトの名前。

* これを使う利点

ファイルが直接実行された時だけテストを実行する、というプログラムを簡潔にかけるようになる。


## プログラムの終端を明示する

```
DATA.each_line do |line|
  puts line
end

__END__
いろはにほへと
ちりぬるを
```

`__END__`はプログラムの終端を明示する。

`__END__`移行の行データはDATAという定数にFILEオブジェクトとして保持され、実行時に参照できる。

ただし、`__END__`がなければ定数DATAは定義できない。


## 例外処理
ある場所で例外が発生した時、例外はコールスタックを遡り、最終的にはトップレベルまで伝搬する。

`begin~rescue`で例外を補足する。


```
begin
  do_process  #例外が発生する可能性のある何らかの処理
rescue => e
  puts "Error occurred (#{e.class})"
  puts e.message
  puts e.backtrace
end
```
rescue節は複数記述することができ、例外が最初にマッチしたrescue節で捕捉される。

また、*ひとつのrescue節で複数の例外クラスを指定する*こともできる。

下記の用に例外の有無にかかわらず、最後に実行したい処理は`ensure`節に記述する。

```
begin
  file = File.open('test.txt')

  do_process file
rescue
  puts 'なにかがおきたよ！'
ensure
  file.close if file
end
```
例えば、ファイル操作に失敗した場合でも確実にファイルをクローズしたいときに上記の用にする。

`ensure`でなく`else`を使うと、例外が発生しなかった場合だけ行う処理を記述できる。

### 例外処理の戻り値

* `ensure`は実行されるが戻り値にはならない
* rescue節で捕捉され、戻り値になる

## メソッドと定数

メソッド名はスネークケースで記述するのが一般的。

大文字で始まるメソッドをレシーバ・引数無しで呼び出す場合には、括弧を省略することが出来ない。レシーバを記述するか、括弧をつけてメソッド呼び出してあることを明示する必要がある。

```
def Hello
  puts 'こんにちは'
end

Hello # => NameError
Hello() # => ちゃんと動く
```

## 配列の展開

メソッドの呼び出しで実引数の頭に＊をつけると、１つの配列を複数の引数として渡せる。

```
def greet_twice(name, first_message, second_message)
  puts "#{first_message}, #{name}."
  puts "#{second_message}, #{name}."
end

greeting = %w(Hello Hola)

greet_twice 'Ruby', *greeting
```

greet_twiceメソッドは引数を３つとるが、呼び出し時には2つの変数しか渡していないことに注意。

配列greetingが＊によって複数の引数として展開される。


## ブロック
### yield

ブロックを引数に取ることができる。

```
def block_sample
  puts 'stand up'
  yield
  puts 'sit down'
end

block_sample do
  puts 'walk'
end
```
`block_sample`メソッドの中で`yield`が呼び出されると、メソッド呼び出し時に渡したブロックが実行される。

yieldを呼び出すメソッドをブロック無しで呼び出すと、`LocalJumpError`という例外が発生する。

yieldを呼び出せるのはブロックが与えられている時だけ。

### 仮引数としてブロックを受け取る

```
def block_sample(&block)
  puts 'stand up'

  block.call if block

  puts 'sit down'
end

block_sample do
  puts 'walk'
end
```

仮引数の先頭に&をつけることで、メソッドに渡されたブロックを仮引数として受け取ることができる。

&を使った仮引数は、１つのメソッドに１つのみ指定できる。


### オブジェクトをブロックとして渡す

```
people = %w(alice bob charlie)
block = Proc.new { |name| puts name }

people.each &block
```

&を使って引数を渡す方法はProcオブジェクト以外にも使える。

```
p1 = Proc.new { |val| val.upcase }
p2 = :upcase.to_proc

p1.call('hi')
p2.call('hi')
```

`map`を使うともっと綺麗な形へと進化する。

```
people = %w(alice bob charlie)
people.map(&:upcase)
```

これが `Symbol#to_proc`を用いた処理。結構使う。

### 繰り返し以外に用いられるブロック

* ファイルのオープン・クローズ
* DBへの接続・切断
* トランザクションの開始・終了
* ロックと解放


### ブロックの記法

* ブロックの中が一行に収まる場合は`{...}`をつかう。複数行になる場合は`do...end`を使う
* ブロックを、値を返す式として書く場合は`{...}`を使い、手続きを実行する文として書く場合は`do...end`を使う。


## キーワード引数

キーワード引数の一部をまとめてハッシュとして扱うには、**付きの仮引数を使う。

頭に**をつけた仮引数は、仮引数にないキーワード引数を１つのハッシュにまとめて受け取ることができる。

```
def keywords_with_options(alice: nil, bob: nil, **others)
  {alice: alice, bob: bob, others: others}
end

# キーワード引数として存在しないものはothersに渡される
p keywords_with_options alice: 'アリス', bob: 'ボブ', charlie: 'チャーリィ', dave: 'デブ'

# 引数の順番を変えることもできる
p keywords_with_options charlie: 'チャーリィ', bob: 'ボブ', alice: 'アリス'

# **のついた仮引数にはデフォルトでは空のハッシュがはいる
p keywords_with_options bob: 'ボブ', alice: 'アリス'
```
