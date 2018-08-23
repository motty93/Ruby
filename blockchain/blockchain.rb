require 'digest/sha2'
require_relative 'block'
require_relative 'proof_of_work'
require 'time'

class BlockChain
  def initialize
    # ここにblockが追加されていく
    @blocks = []
    @blocks << BlockChain.genesis_block
  end

  # ブロックチェーンの最後のブロックを渡す
  def last_block
    @blocks.last
  end

  # 新しいブロックをつくる
  def next_block(transactions)
    height = last_block.height + 1
    timestamp = Time.now.to_i
    previous_hash = last_block.hash

    # 0000をnonceで見つける作業のこと
    pow = ProofOfWork.new(
      timestamp: timestamp,
      previous_hash: previous_hash,
      transactions: transactions
    )

    nonce, hash = pow.do_proof_of_work

    block = Block.new(
      hash: hash,
      height: height,
      transactions: transactions,
      timestamp: timestamp,
      nonce: nonce,
      previous_hash: previous_hash
    )
  end

  # 最初のブロックを生成する
  def self.genesis_block
    Block.create_genesis_block
  end

  def is_valid_new_block?(new_block, previous_block)
    unless previous_block.height + 1 == new_block.height
      puts 'invalid height'
      return false
    end

    unless previous_hash.hash == new_block.previous_hash
      puts 'invalid hash : previous hash'
      return false
    end

    unless new_block.hash == calculate_hash_for_block(new_block)
      puts 'invalid hash : hash'
      return false
    end

    return true
  end

  def is_valid_chain?(block_chain)
    return false unless block_chain.block.first == BlockChain.genesis_block

    tmp_blocks = []
    tmp_blocks << block_chain.blocks.first

    block_chain.blocks[1..-1].each_with_index do |block, index|
      if block_chain.is_valid_new_block?(block, tmp_blocks[index - 1])
        tmp_blocks << block
      else
        return false
      end
    end

    return true
  end

  private

  def calculate_hash_for_block(block)
    Digest::SHA256.hexdigest({
      timestamp: block.timestamp,
      transactions: block.transactions,
      previous_hash: block.previous_hash,
      nonce: block.nonce
    }.to_json)
  end

  def size
    @blocks.size
  end
end
