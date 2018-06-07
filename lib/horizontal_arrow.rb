require 'lib/arrow.rb'

class HorizontalArrow < Arrow
  ARROW_WIDTH = 16
  ARROW_LENGTH = 8
  LINE_WIDTH = 6
  LINE_LENGTH = 24

  def points
    [
      [
        x,
        y+(ARROW_WIDTH/2)
      ],
      [
        x+ARROW_LENGTH,
        y
      ],
      [
        x+ARROW_LENGTH,
        y+(ARROW_WIDTH/2)-(LINE_WIDTH/2)
      ],
      [
        x+ARROW_LENGTH+LINE_LENGTH,
        y+(ARROW_WIDTH/2)-(LINE_WIDTH/2)
      ],
      [
        x+ARROW_LENGTH+LINE_LENGTH,
        y
      ],
      [
        x+(2*ARROW_LENGTH)+LINE_LENGTH,
        y+(ARROW_WIDTH/2)
      ],
      [
        x+ARROW_LENGTH+LINE_LENGTH,
        y+ARROW_WIDTH
      ],
      [
        x+ARROW_LENGTH+LINE_LENGTH,
        y+(ARROW_WIDTH/2)+(LINE_WIDTH/2)
      ],
      [
        x+ARROW_LENGTH,
        y+(ARROW_WIDTH/2)+(LINE_WIDTH/2)
      ],
      [
        x+ARROW_LENGTH,
        y+ARROW_WIDTH
      ]
    ]
  end
end
