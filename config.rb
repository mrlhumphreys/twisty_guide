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

@app.data.sections.map { |c| [c.guide, c.phase] }.uniq.each do |guide_name, phase|
  guide = @app.data.guides.find { |g| g.name == guide_name } 
  if guide.phases_count == 1 
    proxy "/puzzles/#{guide.name}.html", "/phase.html", locals: {guide: guide, phase: phase }
  else
    proxy "/puzzles/#{guide.name}/phases/#{phase}.html", "/phase.html", locals: {guide: guide, phase: phase }
  end
end

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

helpers do
  require './lib/cubic/iso_view'
  require './lib/cubic/top_grid'
  require './lib/cubic/front_grid'
  require './lib/cubic/right_grid'
  require './lib/cubic/facing_grid'
  require './lib/cubic/bordered_grid'
  require './lib/cubic/top_square_factory'
  require './lib/cubic/front_square_factory'
  require './lib/cubic/right_square_factory'
  require './lib/skewb/top_skewb_grid'
  require './lib/skewb/left_skewb_grid'
  require './lib/skewb/right_skewb_grid'
  require './lib/square_one/face'
  require './lib/vertical_arrow'
  require './lib/horizontal_arrow'
  require './lib/diagonal_down_arrow'
  require './lib/diagonal_up_arrow'
  require './lib/pyraminx_grid'
  require './lib/pyraminx_triangle'
  require './lib/megaminx/face'

  def iso_view(args)
    Cubic::IsoView.new(**args) 
  end

  def top_grid(args)
    Cubic::TopGrid.new(**args)
  end

  def front_grid(args)
    Cubic::FrontGrid.new(**args)
  end

  def right_grid(args)
    Cubic::RightGrid.new(**args)
  end

  def facing_grid(args)
    Cubic::FacingGrid.new(**args)
  end

  def bordered_grid(args)
    Cubic::BorderedGrid.new(**args)
  end

  def top_square(args)
    Cubic::TopSquareFactory.new(**args).build
  end
  
  def front_square(args)
    Cubic::FrontSquareFactory.new(**args).build
  end

  def right_square(args)
    Cubic::RightSquareFactory.new(**args).build
  end


  def top_skewb_grid(args)
    Skewb::TopSkewbGrid.new(**args)
  end

  def left_skewb_grid(args)
    Skewb::LeftSkewbGrid.new(**args)
  end

  def right_skewb_grid(args)
    Skewb::RightSkewbGrid.new(**args)
  end
  
  def square_one_face(args)
    SquareOne::Face.new(**args)
  end

  def vertical_arrow(args)
    VerticalArrow.new(**args)
  end

  def horizontal_arrow(args)
    HorizontalArrow.new(**args)
  end

  def diagonal_down_arrow(args)
    DiagonalDownArrow.new(**args)
  end

  def diagonal_up_arrow(args)
    DiagonalUpArrow.new(**args)
  end

  def pyraminx_grid(args)
    PyraminxGrid.new(**args)
  end

  def pyraminx_triangle(args)
    PyraminxTriangle.new(**args)
  end

  def megaminx_face(args)
    Megaminx::Face.new(**args)
  end
end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

configure :build do
  set :http_prefix, '/twisty_guide'
#   activate :minify_css
#   activate :minify_javascript
end
