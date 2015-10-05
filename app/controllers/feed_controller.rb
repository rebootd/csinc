class FeedController < ApplicationController
  respond_to :xml

  def rss
  	response.headers["Expires"] = "#{10.minutes.from_now}"
    @homeurl = home_url

    response.headers["Content-Type"] = "application/xml; charset=utf-8"
    
    file = File.join(Rails.root, 'public', "posts/map.js")
    file_contents = read_file(file)
    @keys = JSON.parse(file_contents)
    @keys = @keys.take(10) unless params[:all] == 'true'

    render(:template => 'feed/rss', :formats => [:xml], :handlers => :builder, :layout => false)

  end

  def json
    response.headers["Expires"] = "#{10.minutes.from_now}"
    @homeurl = home_url

    response.headers["Content-Type"] = "application/json; charset=utf-8"
    
    file = File.join(Rails.root, 'public', "posts/map.js")
    file_contents = read_file(file)
    @keys = JSON.parse(file_contents)
    @keys = @keys.take(10) unless params[:all] == 'true'

    render(:json => @keys, :layout => false)

  end

  def all
    response.headers["Expires"] = "#{10.minutes.from_now}"
    @homeurl = home_url
    cat = params[:category]
    @posts = Post.all

    response.headers["Content-Type"] = "application/json; charset=utf-8"

    file = File.join(Rails.root, 'public', "posts/map.js")
    file_contents = read_file(file)
    keys = JSON.parse(file_contents)
    articles = []
    keys.each do |article|
      articles << JSON.parse(article)
    end

    render(:json => articles, :layout => false)
  end

  private
  def home_url
    base_url
  end

  def read_file(file_name)
    file = File.open(file_name, "r")
    data = file.read
    file.close
    return data
  end

end
