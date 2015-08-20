
ubuntu virtualbox and win7
--------------------------

Mon March 14, 2011

My work laptop crashed last week and I lost the hard drive. Most of what
I need was in source control and I was able to recover everything else.
A co-worker lent me his laptop, which was really kind. (Thanks again
Adam) But he's not a dev so none of my usual tools weren't installed,
nor did I think I should spend a day setting up my dev environment on
his machine, only to do it again in a few days when we got the
replacement drive.

Luckily, I had VirtualBox vm I had been using to test some things. It
already had VS2010 and some other tools. All I had to do was make a new
vm with it and install the rest of my tools. I was able to get back to
work reasonably quickly.

Then the new hard drive arrived which caused debate: Do I install
windows and spent the next day or two setting up my environment yet
again. Of course not, I have this perfect vm working great. I installed
Ubuntu 10.10 and exported/imported the vbox vm on my laptop. I was
coding on it in a couple hours. I was a little nervous about
performance, but I've been pleasantly surprised how nicely it runs. So
much so that I'm currently using VirtualBox and that vm on my home setup
too.

Plus I have that vm backed up. If I lose another machine, I can be
coding again as soon as I have a machine to run VirtualBox. If I ever
want to test something strange, I can just take a snapshot and rollback
if it doesn't work. I used to be against VM's for normal use but this is
working out nicely.
