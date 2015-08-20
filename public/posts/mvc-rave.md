
an mvc argument for humans
--------------------------

Thu March 05, 2009

![](/blog/image.axd?picture=2009%2f3%2fmvc-architecture.png)[MVC](http://en.wikipedia.org/wiki/Model-view-controller)
is all the rage it seems. I really didn't get it at first; that is until
I started using it. That was a few years ago. Now it's my prefered
pattern for web development. It wasn't originally a web pattern, but it
turns out to be a great way to keep things clean in a web application.
It's a good convention, in my opinion.

Now it's not always the best choice. It depends on your needs. It
certainly takes extra work if you're going to build it yourself, but
chances are you don't have to. Several frameworks have sprung up to fill
that void. Probably the most famous is [Ruby on
Rails](http://rubyonrails.org/). It's obviously for the Ruby language,
and there are others out there for Ruby. There are frameworks for PHP,
Java and .Net as well.

We mostly work with .Net (with a dash of Ruby) so let's talk about that
for a minute. In my opinion, there are 3 major MVC frameworks for .Net.

-   [ASP.Net MVC](http://www.castleproject.org/)
-   [Castle Monorail](http://www.castleproject.org/)
-   [Promesh.net](http://www.promesh.net/)

ASP.Net MVC is Microsoft's mvc framework. Castle Monorail is part of the
excellent Castle Project, an open source project. Promesh is another
open source project, which came from a developer's personal toolbox out
or real world use. I'm more familiar with the first two. We use Monorail
in our project, so have a little bias.
([computeristsolutions.com](http://computeristsolutions.com) is built
with monorail for example)

**Convention**

So how often do you look at an old project or old code and think "What
was I doing here?" or "What the \*\*\*\* was the other guy thinking?
What a moron!" It happens. Sometimes I'm the other moron. It's easy to
forget what was going on as time passes. Sticking to a convention helps
avoid that. You know the convention, you can follow the code a lot
easier. You can find where things are at. Easier maintenance is a big
deal, and MVC helps with that. A lot.

**Testing**

Do you test your code, unit test perhaps? You should. Go. Do it. Now!
There are lots of reasons to use unit testing, and its not really my
point in this post.. but let's leave it at you KNOW your code works when
you commit it to source control. MVC helps and encourages seperation of
code so that testing is easier. By doing so you will be able to more
properly, fully, and completely test your code. (Also look at Inversion
of Conntrol; look at [Castle
Windsor](http://www.castleproject.org/container/index.html)) The
function of a unit test is to test a small unit of code. If everything
is lumped together then testing small units gets hard or impossible. It
just so happens it makes maintenance hard too.

**Design**

This isn't really talked about in most MVC articles I've read, but it
really is a big time savings in our experience. When you build and
maintain a website, you will have to alter or completely change the
design and layout. If you're using a MVC framework, it's a lot easier.
You typically have a central layout which is used for all or most of
your pages. You only have to edit that one layout to change most of the
site. If you were careful to make everything CSS friendly, then you have
even more power over your site by changing the layout and/or the CSS.
Even when a plain HTML site would be fine, I lean towards using an MVC
framework for this reason. Site-wide layout and design changes take
minutes instead of days or hours.

**Conclusion**

Hope this brief, humanized argument for MVC on the web makes sense.
There are many good choices for frameworks. We recommend
[Castle](http://www.castleproject.org/), and the upcoming ASP.Net MVC
framework looks pretty good. There is a small learning curve in adopting
it, but it will payoff big in time and headaches saved. If you need to
adapt your current ASP.Net site instead of writing a new one, I'd
suggest looking into the MVP pattern. See MVP
[here](http://haacked.com/archive/2008/06/16/everything-you-wanted-to-know-about-mvc-and-mvp-but.aspx),
[here](http://msdn.microsoft.com/en-us/magazine/cc188690.aspx), and
[here](http://weblogs.asp.net/scottcate/archive/2007/04/12/very-quick-mvp-pattern-to-use-with-asp-net.aspx).
Good luck and have fun, which I'm sure you will.

-j
