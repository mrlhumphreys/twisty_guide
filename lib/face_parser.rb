class FaceParser
  COLOURS = { 
    'w' => '#ffffff',
    'y' => '#ffff00',
    'b' => '#0000ff',
    'g' => '#00ff00',
    'r' => '#ff0000',
    'o' => '#ff8000'
  } 

  OPACITY = {
    full: 1,
    faded: 0.4
  }

  def initialize(string)
    @string = string
  end

  attr_reader :string

  def to_a
    string.split(/\n/).map do |line|
      line.split(',').map(&:strip).map do |col|
        if col == '-'
          nil
        else
          colour = COLOURS[col.downcase]
          opacity = OPACITY[(/[[:upper:]]/.match(col) ? :full : :faded)]
          { colour: colour, opacity: opacity }
        end
      end
    end 
  end
end
