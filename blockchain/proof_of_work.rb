require 'digest/sha2'

class ProofOfWork
  def initialize(args)
    @timestamp = args[:timestamp]
    @transactions = args[:transactions]
    @previous_hash = args[:previous_hash]
  end

  def calc_hash_with_nonce(nonce = 0)
    Digest::SHA256.hexdigest({
      timestamp: @timestamp,
      transactions: @transactions,
      previous_hash: @previous_hash,
      nonce: nonce
    }.to_json)
  end

  def do_proof_of_work
    nonce = 0
    difficulty = '0000'

    # nonceを1ずつ増やしていく
    # 増やすたびに, previous_hashとtransactionsとtimestampsとnonceを引数にしてhashを生成
    # そのハッシュが0000ではじまっていればおｋ
    loop do
      hash = calc_hash_with_nonce(nonce)

      return [nonce, hash] if hash.start_with?(difficulty)
      nonce += 1
    end
  end
end
