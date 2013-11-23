class SitemapController < ApplicationController
  respond_to :xml

  def index
    @base_url = self.base_url 
    @urls = [@base_url, @base_url+'/about', @base_url+'/contact', @base_url+'/blog']
    posts = Post.find_rss(1, 30, 0)
    posts.each {|post|
      @urls << @base_url + full_post_path(:year=>post.published_on.year, :month=>post.published_on.month,
                              :slug=>post.slug) 
    }
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
    render(:template => 'sitemap/index', :formats => [:xml], :handlers => :builder, :layout => false)
  end
end
