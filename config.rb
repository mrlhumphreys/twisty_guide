# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# ) 

PHASES = [
  { puzzle: '3x4x5-cuboid', number: 1 },
  { puzzle: '3x4x5-cuboid', number: 2 },
  { puzzle: '3x4x5-cuboid', number: 3 },
  { puzzle: '3x4x5-cuboid', number: 4 },
  { puzzle: '3x4x5-cuboid', number: 5 },
  { puzzle: '3x4x5-cuboid', number: 6 }
]

PHASES.each do |phase|
  proxy "/puzzles/#{phase[:puzzle]}/phases/#{phase[:number]}.html", "/phase.html", locals: {puzzle: phase[:puzzle], phase: phase[:number] }
end

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/



helpers do

  class FacingGrid
    def initialize(x:, y:, units:, squares: )
      @x, @y = x, y
      @units = units
      @squares = squares
    end

    attr_reader :x, :y, :units, :squares

    def width
      squares.first.size 
    end

    def height
      squares.size
    end
    def max_x 
      x + width * units
    end 

    def max_y
      y + height * units
    end

    def unit_x(n)
      x + n * units
    end

    def unit_y(n)
      y + n * units
    end
  end

  class FacingSquare
    def initialize(x: , y:, units:, colour:, opacity:)
      @x, @y = x, y
      @units = units
      @colour = colour
      @opacity = opacity
    end

    attr_reader :x, :y, :units, :colour, :opacity

    def max_x
      x + units
    end

    def max_y
      y + units
    end
  end

  def facing_grid(args)
    FacingGrid.new(args)
  end

  def facing_square(args)
    FacingSquare.new(args)
  end

  def top_square(x,y)
    "#{x+20},#{y} #{x+40},#{y+10} #{x+20},#{y+20} #{x},#{y+10}"
  end

  def front_square(x,y)
    "#{x},#{y} #{x+20},#{y+10} #{x+20},#{y+30} #{x},#{y+20}"
  end

  def right_square(x,y)
    "#{x+20},#{y} #{x+20},#{y+20} #{x},#{y+30} #{x},#{y+10}"
  end
end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# configure :build do
#   activate :minify_css
#   activate :minify_javascript
# end
