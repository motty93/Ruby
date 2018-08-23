require_relative 'transaction_input'
require_relative 'transaction_output'
require 'digest/sha2'

class Transaction
  attr_reader :tx_id, :inputs, :outputs

  def initialize(args)
    @inputs = args[:inputs]
    @outputs = args[:outputs]
    @tx_id = args[:tx_id]
  end

  class << self
    def calcurate_for_hash(tx_in, tx_out)
      Digest::SHA256.hexdigest({
        tx_in: tx_in,
        tx_out: tx_out
      }.to_json)
    end

    # create coinbase transaction
    def new_coinbase_transaction(address, data)
      subsidy = 50
      if data.nil?
        data = "Reward to #{address}"
      end

      tx_in = [
        Input.new(
          tx_id: nil,
          v_out: -1,
          script_sig: data
        )
      ]

      tx_out = [
        Output.new(
          value: subsidy,
          script_pubkey: address
        )
      ]

      Transaction.new (
        tx_id: calcurate_for_hash(tx_in, tx_out),
        inputs: tx_in,
        outputs: tx_out
      )
    end
  end
end
