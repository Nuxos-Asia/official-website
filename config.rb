###
# Compass
###

# Change Compass configuration
compass_config do |config|
  config.output_style = :compact
end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

page '/jobs.html', layout: 'jobs_layout'
page '/th/jobs.html', layout: 'jobs_layout'


###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

helpers do
  def col_for_collection(collection)
    case collection.size
      when 4
        3
      when 3
        4
      when 2
        6
      when 3
        12
    end
  end
end


# Build-specific configuration

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"

  # create favicon
  activate :favicon_maker do |f|
    f.template_dir  = File.join(root, 'source/images')
    f.output_dir    = File.join(root, 'build/images')
    f.icons = {
        '_favicon_template.png' => [
            { icon: 'apple-touch-icon-152x152-precomposed.png' },
            { icon: 'apple-touch-icon-144x144-precomposed.png' },
            { icon: 'apple-touch-icon-114x114-precomposed.png' },
            { icon: 'apple-touch-icon-72x72-precomposed.png' },
            { icon: 'apple-touch-icon-precomposed.png', size: '57x57' },
            { icon: 'favicon.png', size: '16x16' },
            { icon: 'favicon.ico', size: '64x64,32x32,24x24,16x16' }
        ]
    }
  end
end

configure :development do
  activate :livereload
end

activate :i18n#, templates_dir: 'layouts'
