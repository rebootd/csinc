class ApplicationController < ActionController::Base
  layout "bootstrap"
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :base_url, :url_to_post
  
  protected

  def base_url 
    ur = request.domain
    ur = request.subdomain + '.' + ur if request.subdomain > ''
    ur = ur + ':' + request.port.to_s if request.port != 80
    if request.ssl?
      ur = 'https://' + ur
    else
      ur = 'http://'+ur
    end
    ur
  end

  def url_to_post(post)
    return '' if post == nil
    # url_for :controller => 'post', :action => 'show', :year => post.created_at.year, 
    #  :month => post.created_at.month, :day => post.created_at.day, :slug => post.slug
    full_post_path(:year => post.published_on.year, :month => post.published_on.month, 
                 :slug => post.slug)
  end
  
end
