class Telegram
  def initialize(bytes)
    @bytes = Array.new(bytes)
  end

  def ==(rhs)
    @bytes == rhs.to_array
  end

  def to_array
    @bytes
  end
end
