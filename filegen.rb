#!/usr/bin/ruby
require 'redcarpet'
require 'json'
require_relative 'html_file_gen'
require_relative 'file_deployment'
require_relative 'git_repo_deployment'
require_relative 'site_content_generator'

outpath = ''
sourcepath = '../../../Dropbox/notes/sitecontent'
mapfile = "#{sourcepath}/contentmap.json"

deployments = [ GitRepoDeployment.new(files: [], credentials: nil) ]

site = SiteContentGenerator.new(deployEnabled: true, 
  sourcepath: '../../../Dropbox/notes/sitecontent', 
  outpath: '', 
  list_markup: "#{outpath}list.md", 
  list_page: "#{outpath}list.html",
  robot_file: "#{outpath}robots.txt", 
  mapfile: mapfile, 
  mdfiles: Dir["#{sourcepath}/*.md"], 
  contentmap: JSON.parse(File.read(mapfile)),
  deployments: deployments)

site.generate
