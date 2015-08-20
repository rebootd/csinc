
headless browser testing
------------------------

Mon February 07, 2011

I've been searching for a solution to headless browser testing so I
could run a few basic tests in our build server. It would be merely
basic tests to verify the obvious sort of stuff which is easy to
overlook, and is not a replacement for good unit tests or good user
acceptance testing.\
\
 It seems there aren't a lot of options, but there are a few good ones.
The first things I looked at were
[Watir](http://seleniumhq.org/docs/09_webdriver.html),
[Watin](http://watin.sourceforge.net/), and Selenium. Watir I know can
do it, but I was hoping for something I could include with my .Net test
library instead of a separate Ruby script. Watin and Selenium had
similar performance and neither seemed to support headless testing.\
\
 Running headless on a build server is important to me. I don't want to
have a user logged in to the build server just so tests can run. A
script that opens a browser session requires a logged on user; so that
won't work for me.\
\
 I remembered reading something a while ago about a library called
[ZombieJS](http://zombie.labnotes.org/). Well it's not .Net but it is
awesome!!! It uses NodeJS. I was sure that would do the trick but then I
ran into trouble getting NodeJS to install on windows. Also, I couldn't
get the ZombieJS package working on my mac either.\
\
 Just when I thought I would just write test with watir, I noticed
[something](http://seleniumhq.org/docs/09_webdriver.html). [Selenium
2.0](http://code.google.com/p/selenium/downloads/list) actually does do
headless using WebDriver. Downloaded, tried, and it works!\
\
 I still want to get ZombieJS working on my Mac, and would use any of
the others depending on my needs, but Sel2.0 seems to be the solution
for this situation. Hopefully this helps someone else working one UI
testing because I didn't get a lot of good hits searching for answers at
first.
