class GitRepoDeployment < FileDeployment
  def deploy() 
    system 'git add *.html'
    system 'git add *.rb'
	system 'git add *.txt'
	system 'git commit -m "updating site content"'
	system 'git push'
  end
end