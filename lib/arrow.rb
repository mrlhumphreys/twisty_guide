class Arrow
  def initialize(x:, y:)
    @x, @y = x, y
  end

  attr_reader :x, :y

  def points
    []
  end

  def points_string
    points.map { |p| p.join(',') }.join(' ')
  end
end
