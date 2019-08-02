require_relative 'deployment_credentials'

class RsyncSshDeployment < FileDeployment
  def initialize(credentials)
  	@credentials = credentials
  end

  def deploy() 
  	# system `rsync -avH ~/dev/computerist/csinc/list.html -e "ssh -p12022" webuser@coffmanfam.com:/var/www/html/list.html`
  end
end