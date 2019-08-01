#!/usr/bin/ruby
require 'redcarpet'
require 'json'
require_relative 'html_file_gen'
require_relative 'file_deployment'
require_relative 'git_repo_deployment'

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
robot_file = "robots.txt"

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
files = []

pages.each do | entry |
  in_filename = "#{sourcepath}/#{entry["file"]}"
  next if !File.file?(in_filename)

  puts "processing: #{in_filename}"
  page_template_file = entry["template.file"] ? "#{sourcepath}/#{entry["template.file"]}" : default_template

  html_gen = HtmlFileGen.new( input_path: sourcepath, 
    input_file: in_filename, 
    output_path: outpath, 
    template_file: page_template_file, 
    page_data: entry, 
    site_title: contentmap["site.title"], 
    site_description: contentmap["site.description"] )

  page_names << html_gen.output_file if entry["list_include"] && html_gen.output_file
  puts "...writing: #{html_gen.output_file}"
  html_gen.generate
  files << html_gen.output_file

  # File.write("#{html_gen.output_file}", page_output)
  robots = "#{robots}\nDisallow: #{html_gen.output_file}" if entry["allowsearch"]
end

# write robots file
robots = "#{robots}\nDisallow: list.html"
File.write(robot_file, robots + "\n")

files << robot_file

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

files << list_page

# deployment handlers
puts files
repo = GitRepoDeployment.new(files: files, credentials: nil)
deployments = [ repo ]

# publish
if deployEnabled 

  deployments.each do | deployment |
    deployment.deploy() if deployment.class < FileDeployment
  end
  # system 'git add *.html'
  # system 'git add *.txt'
  # system 'git commit -m "updating site content"'
  # system 'git push'
end

puts 'done!'
