
yepnopejs and jquery
--------------------

Mon October 31, 2011

[YepNodeJS](http://yepnopejs.com/) is a test-based javascript file
loaded. I just heard about it in reading about Modernizr, which is a
javascript library for supporting older browsers when implementing html5
features. Yepnope is built into [modernizr](http://www.modernizr.com/),
and I can see why. It allows you to conditionally load some javascript
or css file if the browser supports it or load something different for
older browsers. I had an immediate aha moment!!!!\
\
 I prefer to load [jQuery](http://jquery.com/) and
[jQuery-UI](http://jqueryui.com/) from a CDN rather than a local file.
The benefit of doing that is you aren't paying for that bandwidth, there
is often a CDN closer to the user and thus faster, and often the user's
browser already has a cached copy from that CDN. The problem is if you
are disconnected from the internet when you are working on the site, you
lose jQuery. Unless you were to conditionally load jQuery from local
file if it was missing. A perfect usage of YepNopeJS, and it happens to
be one of the examples on their home page.
