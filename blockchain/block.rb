require_relative 'transaction'
require_relative 'proof_of_work'
require 'time'

class Block
  attr_reader :hash, :height, :transactions, :timestamp, :nonce, :previous_hash

  def initialize(args)
    @hash = args[:hash]
    @height = args[:height]
    @transactions = args[:transactions]
    @timestamp = args[:timestamp]
    @nonce = args[:nonce]
    @previous_hash = args[:previous_hash]
  end

  # ジェネシスブロックを生成する
  def self.create_genesis_block
    address = "62e907b15cbf27d5425399ebf6f0fb50ebb88f18"
    timestamp = Time.parse("2009/1/3").to_i
    previous_hash = '0'

    genesis_coinbase_data = "The Times 03/Jan/2009 Chancellor on brink of second bailout for banks"
    transactions = [Transaction.new_coinbase_transaction(address, genesis_coinbase_data)]

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
end
