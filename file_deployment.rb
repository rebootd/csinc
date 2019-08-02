require_relative 'deployment_credentials'

class FileDeployment
  attr_accessor :source_path, :files, :credentials

  def initialize(source_path:, files:, credentials:)
  	@source_path, @files, @credentials = source_path, files, credentials
  end

  def deploy()
  end

end
