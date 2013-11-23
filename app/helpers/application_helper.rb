module ApplicationHelper

  def menu_class(page)
    # puts '--------------------------------- ' + (params[:action]==page).to_s
    return 'active' if params[:controller] == 'posts' && page == 'blog'
    if params[:action] == page && params[:controller] != 'posts'
      'active'
    else
      ''
    end
  end

  def is_mobile?
    #is_mobile_device? or params[:mobile] != nil
    false
  end

end
