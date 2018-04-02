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

data.cases.map(&:puzzle).uniq.each do |puzzle|
  data.cases.select { |c| c.puzzle == puzzle }.map(&:phase).uniq.each do |phase|
    proxy "/puzzles/#{puzzle}/phases/#{phase}.html", "/phase.html", locals: { puzzle: puzzle, phase: phase }
  end
end

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

helpers do
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
