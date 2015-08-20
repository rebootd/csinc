class ApplicationController < ActionController::Base
  layout "csinc"
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

  def url_to_post(article)
    return '' if article == nil
    dt = Date.parse(article["date"])
    slug = article["slug"]
    "/blog/posts/#{dt.year}/#{dt.month}/#{slug}"
  end

end
