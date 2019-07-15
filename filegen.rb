#!/usr/bin/ruby
require 'redcarpet'
require 'json'

# templates ideas
# 
# http://preview.themeforest.net/item/kelly-minimal-portfolio-blog-html/full_screen_preview/21347996?ref=cirvitis&clickthrough_id=1406864132&redirect_back=true
# 
#
# 
# 
	
deployEnabled = true
sourcepath = '../../../Dropbox/notes/sitecontent'
outpath = './'
list_markup = "#{outpath}list.html"
list_page = "#{outpath}list.html"
mapfile = "#{sourcepath}/contentmap.json"
mdfiles = Dir["#{sourcepath}/*.md"]
markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)

map_content = File.read(mapfile)
contentmap = JSON.parse(map_content)

default_template = "#{sourcepath}/#{contentmap["template.file"]}"
pages = contentmap["pages"]

puts 'starting..'
robots = "User-agent: * \nDisallow: /cgi-bin/"

site_template_source = File.read(default_template)

puts contentmap["site.title"]
puts contentmap["site.description"]

page_names = Array.new

pages.each do | entry |
  in_filename = "#{sourcepath}/#{entry["file"]}"
  next if !File.file?(in_filename)

  puts "processing: #{in_filename}"
  md_source = File.read(in_filename)
  html_output = Markdown.new(md_source).to_html
  page_template_source = entry["template.file"] ? File.read("#{sourcepath}/#{entry["template.file"]}") : site_template_source
  page_output = page_template_source.gsub("{{page.body}}", html_output).gsub("{{page.title}}", entry["page.title"])
  	.gsub("{{page.keywords}}", entry["page.keywords"])
  	.gsub("{{page.description}}", entry["page.description"])
  	.gsub("{{site.title}}", contentmap["site.title"])
  	.gsub("{{site.description}}", contentmap["site.description"])
  output_name = File.basename(in_filename, ".*") + ".html"
  page_names << output_name if entry["list_include"]
  puts "...writing: #{output_name}"
  File.write("#{output_name}", page_output)
  robots = "#{robots}\nDisallow: #{output_name}" if entry["allowsearch"]
end

# write robots file
robots = "#{robots}\nDisallow: list.html"
File.write("robots.txt", robots + "\n")

# now write list.md and generage list.html
puts "pages:"
puts page_names
File.open(list_page, 'w') { |file| 
  file.write("\# Site Directory\n\n\#\# pages:\n") 
  page_names.each do | entry |
    file.write("- [#{File.basename(entry, ".*")}](#{entry})\n")
  end
}

md_source = File.read(list_markup)
html_output = Markdown.new(md_source).to_html
page_output = site_template_source.gsub("{{page.body}}", html_output).gsub("{{page.title}}", "extra list pages")
  .gsub("{{page.keywords}}", "")
  .gsub("{{page.description}}", "extra list page")
  .gsub("{{site.title}}", "extra list page")
  .gsub("{{site.description}}", "extra list page")
File.write("#{list_page}", page_output)


# publish
if deployEnabled 
  system 'git add *.html'
  system 'git add *.txt'
  system 'git commit -m "updating site content"'
  system 'git push'
end

puts 'done!'
