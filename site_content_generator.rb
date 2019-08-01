require 'redcarpet'
require 'json'
require_relative 'html_file_gen'
require_relative 'file_deployment'
require_relative 'git_repo_deployment'

class SiteContentGenerator
  attr_accessor :deployEnabled, :sourcepath, :outpath, :list_markup, :list_page,
    :robot_file, :mapfile, :mdfiles, :contentmap, :default_template, :pages, :deployments

  def initialize(deployEnabled:, sourcepath:, outpath:, list_markup:, list_page:,
      robot_file:, mapfile:, mdfiles:, contentmap:, deployments:)

    @deployEnabled, @sourcepath, @outpath, @list_markup, @list_page, 
    @robot_file, @mapfile, @mdfiles, @contentmap, @deployments = deployEnabled, sourcepath, outpath, list_markup, list_page, 
      robot_file, mapfile, mdfiles, contentmap, deployments

    @default_template = "#{@sourcepath}/#{@contentmap["template.file"]}"
    @pages = @contentmap["pages"]

  end

  def generate()
  	puts 'starting..'
	robots = "User-agent: * \nDisallow: /cgi-bin/"

	site_template_source = File.read(default_template)

	puts @contentmap["site.title"]
	puts @contentmap["site.description"]

	page_names = []
	files = []

	@pages.each do | entry |
	  in_filename = "#{@sourcepath}/#{entry["file"]}"
	  next if !File.file?(in_filename)

	  puts "processing: #{in_filename}"
	  page_template_file = entry["template.file"] ? "#{@sourcepath}/#{entry["template.file"]}" : @default_template

	  html_gen = HtmlFileGen.new( input_path: @sourcepath, 
	    input_file: in_filename, 
	    output_path: @outpath, 
	    template_file: page_template_file, 
	    page_data: entry, 
	    site_title: @contentmap["site.title"], 
	    site_description: @contentmap["site.description"] )

	  html_gen.generate

	  puts "completed: #{html_gen.output_file}"
	  page_names << html_gen.output_file if entry["list_include"]
	  
	  files << html_gen.output_file

	  # File.write("#{html_gen.output_file}", page_output)
	  robots = "#{robots}\nDisallow: #{html_gen.output_file}" if entry["allowsearch"]
	end

	# write robots file
	robots = "#{robots}\nDisallow: list.html"
	File.write(@robot_file, robots + "\n")

	files << robot_file

	# now write list.md and generage list.html
	# puts "pages:"
	# puts page_names
	File.open(@list_markup, 'w') { |file| 
	  file.write("\# Site Directory\n\n\#\# pages:\n") 
	  page_names.each do | entry |
	    file.write("- [#{File.basename(entry, ".*")}](#{entry})\n")
	  end
	}

	list_entry = JSON.parse("{\"page.title\":\"extra list pages\",\"page.keywords\":\"\",\"page.description\":\"extra list page\",\"site.title\":\"extra list page\",\"site.description\":\"extra list page\"}")

	list_gen = HtmlFileGen.new( input_path: @sourcepath, 
	    input_file: @list_markup, 
	    output_path: @outpath, 
	    template_file: @default_template, 
	    page_data: list_entry, 
	    site_title: @contentmap["site.title"], 
	    site_description: @contentmap["site.description"] )

	list_gen.generate
	files << list_page

	# publish
	if deployEnabled 
	  deployments.each do | deployment |
	  	deployment.files = files
	  	puts "\r\ndeployment files:"
	  	puts deployment.files
	    deployment.deploy() if deployment.class < FileDeployment
	  end
	end

	puts 'done!'
  end

end