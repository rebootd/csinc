require_relative 'deployment_credentials'

class FileDeployment
  attr_accessor :files, :credentials

  def initialize(files:, credentials:)
  	@files, @credentials = files, credentials
  end

  def deploy()
  end

end
