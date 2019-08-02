#!/usr/bin/ruby
require 'redcarpet'
require 'json'
require_relative 'html_file_gen'
require_relative 'file_deployment'
require_relative 'git_repo_deployment'
require_relative 'rsync_ssh_deployment'
require_relative 'site_content_generator'

outpath = './'
sourcepath = '../../../Dropbox/notes/sitecontent'
mapfile = "#{sourcepath}/contentmap.json"

# deployments = [ GitRepoDeployment.new(files: [], credentials: nil) ]
rscync_cred = DeploymentCredentials.new
rscync_cred.user = "webuser"
rscync_cred.password = "password"
rscync_cred.server = "coffmanfam.com:/var/www/html"
rscync_cred.connect_options = "12022"
deployments = [ RsyncSshDeployment.new(source_path: outpath, files: [], credentials: rscync_cred) ]

site = SiteContentGenerator.new(deployEnabled: true, 
  sourcepath: '../../../Dropbox/notes/sitecontent', 
  outpath: outpath, 
  list_markup: "list.md", 
  list_page: "list.html",
  robot_file: "robots.txt", 
  mapfile: mapfile, 
  mdfiles: Dir["#{sourcepath}/*.md"], 
  contentmap: JSON.parse(File.read(mapfile)),
  deployments: deployments)

site.generate
