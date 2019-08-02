require_relative 'deployment_credentials'

class RsyncSshDeployment < FileDeployment
  
  def deploy() 
  	# puts @files
  	@files.each { |file| 
  	  # puts "#{@source_path}#{file}"
  	  system "rsync -avH #{@source_path}#{file} -e \"ssh -p#{@credentials.connect_options}\" #{@credentials.user}@#{@credentials.server}/"
  	}

  	# system "rsync -avH ~/dev/computerist/csinc/list.html -e \"ssh -p12022\" webuser@coffmanfam.com:/var/www/html/list.html"
  	# system "rsync -avH ~/dev/computerist/csinc/list.html -e \"ssh -p#{@credentials.connect_options}\" #{@credentials.user}@#{@credentials.server}/list.html"
  end

end