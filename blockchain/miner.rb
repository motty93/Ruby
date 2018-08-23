require 'openssl'

class Miner
  attr_reader :name, :block_chain

  def initialize(args)
    @name = args[:name]
    # 公開鍵
    @rsa = OpenSSL::PKey::RSA.generate(2048)
    @block_chain = BlockChain.new
  end

  # previous_hashが前のブロックのhashになっていること
  # hashを計算した結果が正しいかというのを見ていく
  def accept(receive_block_chain)
    if receive_block_chain.size > @block_chain.size
      if BlockChain.is_valid_chain?(receive_block_chain)
        puts "#{@name} accepted received blockchain"
        @block_chain = receive_block_chain.clone
      else
        puts 'Received blockchain invalid'
      end
    end
  end

  def add_new_block

  end

end
