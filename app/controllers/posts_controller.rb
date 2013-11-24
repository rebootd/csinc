class PostsController < ApplicationController
  helper :all
  protect_from_forgery :except => :import  
  respond_to :html, :json
  

  PAGE_SIZE = 30

  def index
  	response.headers["Expires"] = "#{10.minutes.from_now}"
    @page = params[:page].to_i
    @page = 1 if @page == 0
    @category = params[:category] || 'all'
    # category_id = Category.find_id(@category);
    
    #@posts = Post.where(:published_on.lte => Time.now).limit(10).order_by([[:published_on, :desc]]) #find_summary(@page, 10, @category, !logged_in?)
    if @category == 'all'
      @posts = Post.get_page(@page, PAGE_SIZE, true)
    else
      @posts = Post.get_category(@page, PAGE_SIZE, @category, true)
    end

    @hasolder = (@page * PAGE_SIZE) < Post.count
    
    respond_with @posts
  end

  def show
    response.headers["Expires"] = "#{10.minutes.from_now}"
    @post = Post.first(:conditions => { :id => params[:id]}) if params[:id]
    @post ||= Post.find_by_slug(params[:slug].downcase, true )

    #render missing_post_path and return if @post == nil
    redirect_to(posts_path) if @post == nil
    if @post.published_on.year.to_s != params[:year] || @post.published_on.month.to_s != params[:month]
      redirect_to full_post_path(:year=>@post.published_on.year, :month=>@post.published_on.month,
                              :slug=>@post.slug), :status => 301
      return
    end
    respond_with @post
  end

  def get
    response.headers["Expires"] = "#{10.minutes.from_now}"
    @post = Post.first(:conditions => { :id => params[:id]}) if params[:id]
    @post ||= Post.find_by_slug(params[:slug].downcase, true )

    respond_with @post
  end
  
end
