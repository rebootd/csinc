class PostsController < ApplicationController
  layout 'application'
  helper :all
  protect_from_forgery :except => :import
  respond_to :html, :json

  PAGE_SIZE = 30

  def index
  	response.headers["Expires"] = "#{10.minutes.from_now}"

    file = File.join(Rails.root, 'public', "posts/map.js")
    file_contents = read_file(file)
    @keys = JSON.parse(file_contents)
    respond_with @keys

  end

  def show

    response.headers["Expires"] = "#{10.minutes.from_now}"
    file = File.join(Rails.root, 'public', "posts/#{params[:slug].downcase}.md")
    file_contents = File.read(file)
    render :text => markdown(file_contents)

  end

  private
  def read_file(file_name)
  file = File.open(file_name, "r")
  data = file.read
  file.close
  return data
end

  def markdown(text)
    options = {
      filter_html:     true,
      hard_wrap:       true, 
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true, 
      fenced_code_blocks: true
    }

    extensions = {
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end


end
