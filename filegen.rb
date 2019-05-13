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

sourcepath = '../../../Dropbox/notes/sitecontent'
outpath = './'
mapfile = "#{sourcepath}/contentmap.json"
mdfiles = Dir["#{sourcepath}/*.md"]
default_template = "#{sourcepath}/default_template.html"
markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)

map_content = File.read(mapfile)
contentmap = JSON.parse(map_content)

puts 'starting..'
robots = "User-agent: * \nDisallow: /cgi-bin/"

template_source = File.read(default_template)

contentmap.each do | entry |
  in_filename = "#{sourcepath}/#{entry["file"]}"
  puts "processing: #{in_filename}"
  md_source = File.read(in_filename)
  html_output = Markdown.new(md_source).to_html
  page_output = template_source.gsub("{{ page.body }}", html_output).gsub("{{ page.title }}", entry["title"]).gsub("{{ page.keywords }}", entry["keywords"])
  output_name = File.basename(in_filename, ".*") + ".html"
  puts "...writing: #{output_name}"
  File.write("#{output_name}", page_output)
  robots = "#{robots}\nDisallow: #{output_name}" if entry["allowsearch"] == "false"
end

File.write("robots.txt", robots + "\n")

# publish
system 'git add *.html'
system 'git commit -m "updating site content"'
# system 'git push'

puts 'done!'
