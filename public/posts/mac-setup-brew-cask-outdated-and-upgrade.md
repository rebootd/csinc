mac setup, brew cask outdated and upgrade
------------------------------------------

Tues Aug 25, 2015

I love using [brew](http://brew.sh/) and [cask](http://caskroom.io/) to manage my macbook, but cask lacks upgrade and outdated support. 
So I wrote a bash script to simulate those features. Maybe someday I'll rewrite 
in Ruby, which is the language used in brew and cask. In the meantime, these are helpful.

Below are the outdated and upgrade script, and also the script I use for initial setup of a new mac.

[mac setup](https://gist.github.com/rebootd/3eb3f4663d4d34b11f78)
	curl -L https://gist.github.com/rebootd/3eb3f4663d4d34b11f78/raw | sh

[outdated script](https://gist.github.com/rebootd/dcab6e53ec6f8f3eebb9)
	curl -L https://gist.github.com/rebootd/dcab6e53ec6f8f3eebb9/raw | sh

[upgrade script](https://gist.github.com/rebootd/bb1cbd13f19fde6dfba1)
	curl -L https://gist.github.com/rebootd/bb1cbd13f19fde6dfba1/raw | sh
