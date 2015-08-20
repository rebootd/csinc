
vs2010 at first glance
----------------------

Wed May 27, 2009

So the public beta for Visual Studio 2010 has been available for a
little while, but I’ve been to busy to grab it even though I could have
gotten when it was MSDN only. I’m still too busy to spend a lot of time
but I wanted grab a couple screen shots and offer one feedback item.

I have Win7 RC 1 running in VMWare Fusion on OSX, and VS2010 didn’t
install smoothly for me. I downloaded it from MSDN and used 7-Zip to
extract the files with which to install it. Unfortunately I got a
missing or corrupt file 3-4 times. It’s possible that something was
corrupted during extraction, or it could be caused by the fact I was
running the install in win7 on fusion in the background while I did
other things on this Mac. Either way, I don’t think it was VS2010.

The improved Start Page is nice, but nothing shockingly new or different
during install and initial launch.

[![Welcome](http://computeristsolutions.com/blog/image.axd?picture=image_thumb_1.png "Welcome")](http://computeristsolutions.com/blog/image.axd?picture=image_1.png&keepThis=true&TB_iframe=true&height=480&width=600)
[![Projects](http://computeristsolutions.com/blog/image.axd?picture=image_thumb_2.png "Projects")](http://computeristsolutions.com/blog/image.axd?picture=image_2.png&keepThis=true&TB_iframe=true&height=480&width=600)
[![Visual
Studio](http://computeristsolutions.com/blog/image.axd?picture=image_thumb_3.png "Visual Studio")](http://computeristsolutions.com/blog/image.axd?picture=image_3.png&keepThis=true&TB_iframe=true&height=480&width=600) [![New
Project](http://computeristsolutions.com/blog/image.axd?picture=image_thumb_4.png "New Project")](http://computeristsolutions.com/blog/image.axd?picture=image_4.png&keepThis=true&TB_iframe=true&height=480&width=600)

I created a Test project with the default name. I prefer to start with
unit tests and figured it would be a good, simple way to try a couple
things. I tried some tests for List&lt;&gt; and delegates/anonymous
methods.

[![First Unit
Test](http://computeristsolutions.com/blog/image.axd?picture=image_thumb_5.png "First Unit Test")](http://computeristsolutions.com/blog/image.axd?picture=image_5.png&keepThis=true&TB_iframe=true&height=480&width=600)

I’m not very familiar with the MSTest way of doing things because I
typically use [nUnit](http://www.nunit.org/) or
[MbUnit](http://www.mbunit.com/).  To me this view looks different, and
it’s odd when you’re used to using [TDD.Net](http://testdriven.net/) for
running tests. Not bad, just different. (I recommend all of the tools I
just mentioned.) 

The default colors and fonts do look a lot better than the previous
version; not sure if that’s Win7 or VS2010.

I was taking this next shot to show you my preferred test naming style,
and noticed something nice. The line number are on by default. I didn’t
notice at first because turning those on is the second thing I do to VS
after I install it. (The first being to change the default
theme/color/font settings.)

[![unit test with better naming
style](http://computeristsolutions.com/blog/image.axd?picture=image_thumb_6.png "unit test with better naming style")](http://computeristsolutions.com/blog/image.axd?picture=image_6.png&keepThis=true&TB_iframe=true&height=480&width=600)

So far it looks nice and runs well in my vmware machine of win7. I
didn’t push it that hard so I can’t say just yet but it looks good to
me. Should probably build something, target .Net 3.0 and deploy it to
the website just to see how it goes.

My one feedback item so far is that the intellisense seems a bit overly
aggressive. Maybe its because it’s in a VM but it gives the sense of
jumpy, slightly confused itellisense choices while I’m typing. Does
anyone else get that?

-j
