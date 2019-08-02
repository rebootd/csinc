require 'redcarpet'
require 'json'

class HtmlFileGen
  attr_accessor :input_path, :input_file, :output_path, :template_file, 
    :output_file, :page_data, :site_title, :site_description

  def initialize(input_path:, input_file:, output_path:, template_file:, page_data:, site_title:, site_description:)
  	@markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
  	@input_file = input_file
  	@output_path = output_path
  	@template_file = template_file
  	@input_path = input_path
  	@page_data = page_data
  	@site_title = site_title
  	@site_description = site_description
  end

  def generate
    md_source = File.read(@input_file)
    html_output = Markdown.new(md_source).to_html
    page_template_source = File.read(template_file)

    page_output = page_template_source.gsub("{{page.body}}", html_output)
      .gsub("{{page.title}}", @page_data["page.title"])
  	  .gsub("{{page.keywords}}", @page_data["page.keywords"])
  	  .gsub("{{page.description}}", @page_data["page.description"])
  	  .gsub("{{site.title}}", @site_title)
  	  .gsub("{{site.description}}", @site_description)
  	  .gsub("{{page.updated}}", Time.now.getutc.to_s)
    @output_file = File.basename(@input_file, ".*") + ".html"
    
    File.write("#{@output_path}/#{@output_file}", page_output)
  end
end