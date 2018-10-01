class Myclass
  def ==(other)
    # 同じクラスのオブジェクトであれば必ず真を返す
    self.class == other.class
  end
end

Myclass.new = Myclass.new

