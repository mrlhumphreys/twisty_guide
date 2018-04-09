Position = Struct.new(:x,:y) do
  def +(other)
    Position.new(self.x + other.x, self.y + other.y)
  end 

  def -(other)
    Position.new(self.x - other.x, self.y - other.y)
  end 

  def *(scale)
    Position.new(self.x*scale, self.y*scale)
  end
end
