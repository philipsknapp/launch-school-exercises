class Clock
  def self.at(hr, mn = 0)
    Clock.new(hr, mn)
  end

  def initialize(hr, mn)
    added_hrs, mn = mn.divmod(60)
    @hr = (hr + added_hrs) % 24
    @mn = mn
  end

  def +(added_mn)
    Clock.new(hr, mn + added_mn)
  end

  def -(sub_mn)
    Clock.new(hr, mn - sub_mn)
  end

  def to_s
    format("%02d:%02d", hr, mn)
  end

  def ==(other)
    self.class == other.class && hr == other.hr && mn == other.mn
  end

  protected

  attr_reader :hr, :mn
end
