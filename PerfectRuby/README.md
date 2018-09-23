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
#=> {:alice=>"アリス", :bob=>"ボブ", :others=>{:charlie=>"チャーリィ", :dave=>"デブ"}}

# 引数の順番を変えることもできる
p keywords_with_options charlie: 'チャーリィ', bob: 'ボブ', alice: 'アリス'
#=> {:alice=>"アリス", :bob=>"ボブ", :others=>{:charlie=>"チャーリィ"}}

# **のついた仮引数にはデフォルトでは空のハッシュがはいる
p keywords_with_options bob: 'ボブ', alice: 'アリス'
#=> {:alice=>"アリス", :bob=>"ボブ", :others=>{}}
```

## 仮引数の順序

複数の仮引数がある場合、仮引数の並ぶ順番には制限がある。

以下の順序で並んでいるひつようがある。

* 通常の引数・省略可能な引数
* ＊で指定できる可変長の引数
* キーワード引数
* ＊＊で指定できるハッシュの引数
* &で指定できるブロックの引数

## ::を使ったメソッド呼び出し

```
Time::now #=> 2018-09-12 ~~~~~
```
上記のようにメソッドを呼び出すことができる。

`::`はメソッドの呼び出しよりも*定数の参照*に使われることが多い。

## メソッドに別名をつける

`alias`を用いて既存のメソッドに別名をつけることができる。

```
alias greet puts

greet 'hi'
```

もし、aliasしたあとに元のメソッドの定義を取り消した場合でも、別名のメソッドまで取り消されることはない。

```
undef puts

greet 'jooooooooo'
```

## 文字列の入出力

`puts/print/printf`は受け取っら引数が文字列でない場合、`to_s`メソッドの戻り地を出力する。

また、`Kernel.#p`は`inspect`メソッドの戻り地を出力する。

inspectメソッド
https://ref.xaio.jp/ruby/classes/hash/inspect

## 外部コマンドの実行

`system/exec/spawn`メソッドには、第一引数にハッシュを指定でき、外部コマンドのプロセスの環境変数を上書きしたり追加したりできる。

```
ENV['HOGE'] = 'huga'

system('echo $HOGE')

system({'HOGE' => 'piyo'}, 'echo $HOGE')

pid = spawn({'HOGE' => 'piyo'}, 'echo $HOGE')

Process.waitpid pid

exec({'HOGE' => 'piyo'}, 'echo $HOGE')
```

## インスタンスメソッド

```
class Brownie
  def initialize
    @baked = false
  end

  def bake!
    @baked = true

    self
  end

  def baked?
    @baked
  end
end

b = Brownie.new
p b.baked?
p b.bake!
p b.baked?
```

* オブジェクトの状態を真偽値で返すメソッドには疑問符を用いて定義する。
* 同じ処理をする２つのメソッドがあるとこい、プログラマに対してより注意を促したいメソッドの名前には感嘆符をつける。
* 処理に失敗した際に偽を返すメソッドと例外を発生されるメソッドがある場合、例外を発生させる方のメソッドには感嘆符をつける。(ActiveRecordのsave!メソッドとか)

## クラスの継承

継承するクラスは、 `class SubClass < SuperClass`のように`<`を用いて指定する。

サブクラスはスーパークラスのインスタンスメソッド、クラスメソッドを継承する。ただし、サブクラスはインスタンス変数についての情報は継承しない。

サブクラスからはスーパークラスの定数を参照できる。

```
class Parent
  PARENT = 'constant in parent'
end

class Child < Parent
end

p Child.constants   # => Childクラスの定数一覧
p Child::PARENT
```

## メソッドのオーバーライド

```
class Parent
  def greet
    puts 'hi'
  end
end

class Child < Parent
  def greet(name)
    puts "hi, #{name}"
  end
end

class GrandChild < Child
  def greet(name)
    super

    puts 'Nice'
  end
end

grandchild = GrandChild.new
grandchild.greet 'ruby'
```

サブクラスで受け取った引数とは別の値を渡したい場合には、superに引数を渡す。引数を一切渡したくない場合は、`super()`と括弧を記述して引数がないことを明示する。

## クラス変数とそのスコープ

クラス変数は、そのクラスとサブクラスのクラス定義の中や、クラスメソッド、インスタンスメソッドで共有することができる変数のこと。

```
class Parent
  @@val = 'foo'

  def self.say
    puts @@val
  end
end

class Child < Parent
  def say
    @@val = 'hoge'
    puts @@val
  end

  def hoge
    puts @@val
  end
end

Parent.say
Child.say
Child.new.say
Child.new.hoge
```

クラス変数はそのクラスとサブクラス以外からは参照できない。

## ネストした定数の参照

トップレベルに定義された定数とクラスに定義された定数がそれぞれあるとする。

このときクラスから定数を参照すると`クラス::定数`の値が返る。

```
VALUE = 'toplevel'.freeze

class Foo
  VALUE = 'in Foo class'

  def self.value
    VALUE
  end
end

Foo.value
# => 'in Foo class'
```

ネストしたクラス・モジュール内で定数を参照した際には、まずそのクラス・モジュールに定数があれば選ばれ、なければネストがより低い位置の定数が探索される。

上記の例で`Foo::VALUE`が定義されていなければ、`Foo.value`はトップレベルのVALUEが持つ値を返す。

定数探索は自身からトップレベル方向に進み、最初に見つかった定数が参照される。

クラス定義・モジュール定義がネストしている場合は、トップレベルに比べて自身に近い定数が参照される。

```
VALUE = 'toplevel'.freeze

class Foo
  #VALUE = 'in Foo class'

  class Bar
    def self.value
      VALUE
    end
  end
end

Foo::Bar.value
# => in Foo class
```
