
why automated deployments are important
---------------------------------------

Mon January 10, 2011

Humans make mistakes. It's unavoidable that no matter how rare, it will
happen. Maybe you forget to make a backup first. Maybe you accidently
overwrite the production config file with one from development.\
\
 So script and automate your deployment. Then use that same script to
deploy first to a staging environment, which tests the script to see it
works first in a non-production environment. If you forgot something,
don't just throw it up on staging. Add it to the script and re-run the
staging deployment. Always do this, and you will very rarely, if ever,
miss something in deploying to production\
\
 When you write your deployment script, be sure to include things like:
backing up the current copy & database, run a build when necessary,
deploy new files, and run any database migrations. Also, make sure you
are leaving the proper config for the environment. Avoid being so
specific that your script is only valid for deploying to a certain
environment or, worse, only valid for a certain release.\
\
 Now that you've gotten your deployment down, add a build server. Decide
if staging deployments should be done for every code change commit, or
only on a schedule, or only on demand. But let the build server execute
the deployment to staging and production. It's about reducing the effort
and room for error in deployment. There is already enough friction in
software development, there's no reason this should be one. There are
such good tools for builds and scripting. Just pick one and go. It's
easy enough to change later if it's not working as smoothly as you
want.\
\
 I recommend looking at Rake for compiling & scripting; there's a nice
gem for building .Net projects called
[albacore](http://albacorebuild.net/). For builds, look at
[TeamCity](http://www.jetbrains.com/teamcity/) or [Hudson
CI](http://hudson-ci.org/).
