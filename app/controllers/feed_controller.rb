class FeedController < ApplicationController
  respond_to :xml
  
  def rss
  	response.headers["Expires"] = "#{10.minutes.from_now}"
    @homeurl = home_url 
    cat = params[:category]
    @posts = Post.find_rss(1, 10, cat)

    response.headers["Content-Type"] = "application/xml; charset=utf-8"
    #render :layout => false
    render(:template => 'feed/rss', :formats => [:xml], :handlers => :builder, :layout => false)
    
  end

  private
  def home_url
    base_url
  end
end
