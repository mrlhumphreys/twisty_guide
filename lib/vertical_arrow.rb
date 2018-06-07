require 'lib/arrow.rb'

class VerticalArrow < Arrow
  ARROW_WIDTH = 16
  ARROW_LENGTH = 8
  LINE_WIDTH = 6
  LINE_LENGTH = 24 

  def points
    [
      [
        x+(ARROW_WIDTH/2),
        y
      ],
      [
        x+ARROW_WIDTH,
        y+ARROW_LENGTH
      ],
      [
        x+(ARROW_WIDTH/2)+(LINE_WIDTH/2),
        y+ARROW_LENGTH
      ],
      [
        x+(ARROW_WIDTH/2)+(LINE_WIDTH/2),
        y+ARROW_LENGTH+LINE_LENGTH
      ],
      [
        x+ARROW_WIDTH,
        y+ARROW_LENGTH+LINE_LENGTH
      ],
      [
        x+(ARROW_WIDTH/2),
        y+(ARROW_LENGTH*2)+LINE_LENGTH
      ],
      [
        x,
        y+ARROW_LENGTH+LINE_LENGTH
      ],
      [
        x+(ARROW_WIDTH/2)-(LINE_WIDTH/2),
        y+ARROW_LENGTH+LINE_LENGTH
      ],
      [
        x+(ARROW_WIDTH/2)-(LINE_WIDTH/2),
        y+ARROW_LENGTH
      ],
      [
        x,
        y+ARROW_LENGTH
      ]
    ]
  end

end
