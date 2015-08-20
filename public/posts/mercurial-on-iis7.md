
mercurial on iis7
-----------------

Sun March 27, 2011

I had trouble setting up Mercurial on windows, hosted in IIS, so I
wanted to post what worked for me. I tried following steps from other
people. While that worked partly, it didn't completely work until I
stumbled on these steps. It's mostly based on documentation from [Jeremy
Skinner](http://www.jeremyskinner.co.uk/mercurial-on-iis7/), and I will
refer to that in my steps below.\
\
 Also, I worked it up to the point where Mercurial is functioning.
Jeremy's article takes it further and describes configuration
authentication using IIS. You will likely want to follow that if you are
going to be using Merc in a real world environment.\
\
 I used Merc 1.8.1, Python 2.6.6, TortoiseHG 2.0.2, and IIS7.\
\
 I think the big difference that worked for me was not extracting
Library.zip, and using the Merc python package. I'm not so sure that
using TortoiseHG mattered, but maybe. I'm also using hgweb.cgi because
that's what is in the source package; not hgwebdir.cgi. I believe that's
a change in Mercurial; nothing more.\
\
 1. install python 2.6 (2.6.6)\
 2. install mercurial 1.8.1 32bit msi
([link](http://mercurial.selenic.com/release/windows/mercurial-1.8.1-x86.msi))\
 3. install mercurial 1.8.1 python 2.6 package
([link](http://mercurial.selenic.com/release/windows/mercurial-1.8.1.win32-py2.6.exe))\
 4. install TortoiseHG 2.0.2 64bit
([link](http://bitbucket.org/tortoisehg/thg/downloads/tortoisehg-2.0.2-hg-1.8.1-x64.msi))\
 5. edit system PATH variable to point to c:\\program files\\tortoisehg
instead of c:\\program files (x86)\\mercurial\
 6. download mercurial 1.8.1 source package
([link](http://mercurial.selenic.com/release/mercurial-1.8.1.tar.gz))\
 7. install IIS 7 with CGI, Basic Auth, and Request Filtering (including
more options is ok too)\
 8. add directory under c:\\inetpub\\wwwroot; I used "hg"\
 9. setup the CGI the Handler Mappings for the hg folder in IIS
Management\
 1. Hander Mappings &gt; Add Script: user \*.cgi, python exe, and name
it "Python"\
 10. verify using the test script from J Skinner's article\
 11. extract hgweb.cgi from mercurial source package and copy to
c:\\inetpub\\wwwroot\\hg\
 12. create hgweb.config (empty file) in wwwroot\\hg\
 13. \*\* don't extract library.zip; this was causing problems for me
\*\*\
 14. copy tortoisehg\\templates folder to wwwroot\\hg\
 15. you should now be able to browse to http://localhost/hg/hgweb.cgi
and get an empty list of Merc repositories\
 16. now create a folder where your Merc repos will live; create a test
repo if you don't already have a repository to verify this works\
 17. edit wwwroot\\hg\\hgweb.config to add:\

``` {.brush: .bash;}
[collections] 
c:\repositories = c:\repositories
```

18\. assuming you have a repository in the path you added to
hgweb.config, you should now be able to see in when you refresh
http://localhost/hg/hgwebdir.cgi\
 19. users should now be able to clone those repositories. verify but
dont pass out the info yet... Let's add pretty URLs\
 20. download & install the URLRewrite extension for iis
(http://www.iis.net/expand/URLRewrite or use Web Platform installer to
install)\
 21. Refer to the J Skinner post on setting up url rewriting, but make
sure to use "hgweb.cgi" instead of "hgwebdir.cgi"\
 22. you should now be able to browse to http://localhost/hg and see
your list of repositories\
 23. now add push settings to hgweb.config\

``` {.brush: .bash;}
[web] 
allow_push = * #this allows everybody, you can sepecify names delimited by commas
deny_push = badguys #just an example of denying push to "badguys" 
push_ssl = false 
```

Bonus:\
 - add style to your merc web\

``` {.brush: .bash;}
[web] 
style = monoweb 
```

**UPDATE:** I found that when browsing a repo and trying to view file
source or a diff, that it was being blocked by IIS. To resolve this,
open IIS Manager and go to Request Filtering for your Merc web folder;
"hg" in the sample above. You'll likely find the extension of the file
in question in the list of disallowed file extentions. For .net
projects, you should delete: cs, csproj, sln, asax,ascx, master, config,
vb, vbproj, and resx. There maybe others but just delete them on a case
by case basis. After that you should be able to view files and diffs
from the web ui.
