# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions



activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :deploy do |deploy|
  deploy.deploy_method = :git
  # Optional Settings
  # deploy.remote   = 'custom-remote' # remote name or git url, default: origin
  # deploy.branch   = 'custom-branch' # default: gh-pages
  # deploy.strategy = :submodule      # commit strategy: can be :force_push or :submodule, default: :force_push
  # deploy.commit_message = 'custom-message'      # commit message (can be empty), default: Automated commit at `timestamp` by middleman-deploy `version`
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

@app.data.cases.map { |c| [c.guide, c.phase] }.uniq.each do |guide, phase|
  if phase.nil?
    proxy "/puzzles/#{guide}.html", "/phase.html", locals: {guide: guide, phase: phase }
  else
    proxy "/puzzles/#{guide}/phases/#{phase}.html", "/phase.html", locals: {guide: guide, phase: phase }
  end
end

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

helpers do
  require './lib/top_grid'
  require './lib/front_grid'
  require './lib/right_grid'
  require './lib/square'
  require './lib/facing_grid'
  require './lib/facing_square'
  require './lib/bordered_grid'
  require './lib/vertical_arrow'
  require './lib/horizontal_arrow'
  require './lib/diagonal_down_arrow'
  require './lib/diagonal_up_arrow'

  def top_grid(args)
    TopGrid.new(args)
  end

  def front_grid(args)
    FrontGrid.new(args)
  end

  def right_grid(args)
    RightGrid.new(args)
  end

  def square(args)
    Square.new(args)
  end

  def facing_grid(args)
    FacingGrid.new(args)
  end

  def facing_square(args)
    FacingSquare.new(args)
  end

  def bordered_grid(args)
    BorderedGrid.new(args)
  end

  def vertical_arrow(args)
    VerticalArrow.new(args)
  end

  def horizontal_arrow(args)
    HorizontalArrow.new(args)
  end

  def diagonal_down_arrow(args)
    DiagonalDownArrow.new(args)
  end

  def diagonal_up_arrow(args)
    DiagonalUpArrow.new(args)
  end
end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

configure :build do
  set :http_prefix, '/twisty_guide'
#   activate :minify_css
#   activate :minify_javascript
end
