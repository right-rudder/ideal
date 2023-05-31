# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://idealaviationstl.com"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end

  add '/contact'
  add '/about-ideal-aviation'
  add '/our-team'
  add '/visit-ideal-aviation'
  add '/quiz'
  add '/discovery-flight'
  add '/rental-checkout'
  add '/how-to-become-a-pilot'
  add '/pilot-programs'
  add '/fixed-wing-airplane-fleet'
  add '/rotary-wing-helicopter-fleet'
  add '/airplane-pilot-training'
  add '/helicopter-pilot-training'
  add '/private-pilot-training'
  add '/advanced_training'
  add '/news'
  add '/pilot-resources'
  add '/pilot-resources'

  Post.find_each do |post|
    add post_path(post), :lastmod => post.updated_at
  end
  
end
