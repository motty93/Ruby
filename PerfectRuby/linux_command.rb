num = 10
#puts `head -#{num} ~/.vimrc`
`head -#{num} ~/.vimrc`

# 外部コマンドの出力が必要でない場合
system('uname')
puts $? # 直後に実行したコマンドの終了ステータスを表示する組み込み変数

pid = spawn('uname') # Linuxと表示
Process.waitpid pid

# Kernel.#execは外部コマンドのプロセスになる。コマンドの実行が終了するとそこで制御が終わる
#exec 'uname'
#puts 'hello' # この行は実行されない


