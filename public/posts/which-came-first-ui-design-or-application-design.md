
which came first: ui design or application design
-------------------------------------------------

Fri May 22, 2009

![](http://www.haps.bham.ac.uk/ioem/research/outcome/images/ergonomic2.jpg) 
I mostly work with code and application or data design. I’ve been doing
this long enough that I can often see what would fit based on the needs
and feature requirements.  At times when I’m not sure or want to check
my assumptions, I whip out some unit tests and see how it goes. Test
Driven Design helps drive application and data design things nicely.

  So what if you are starting completely from scratch?  I tend to
collect the requirements and identify the features. Then translate that
into models, data, patterns, tests, and code. I had a recent discussion
with someone who is more of a UI designer, and made the viewpoint that
it’s upside down. That’s his viewpoint, and that’s fine.

  So where do you start? Do you look at what user experience you want to
provide or do you dig into the guts and think about the interface later?

  Application design or architecture is important, but ignoring user
experience is a mistake. You could build the perfect code base, but have
it all go to waste if no one is willing to use it. Apple knows this, and
excels at building attractive hardware. That’s a large part of their
recent success.

  As a reminder to myself and recommendation to others, don’t ignore the
UI. Think about your target audience and what they would want. Think
about how they would want to use your application. I find a lot of UI
flaws when I have to repeatedly use a particular feature in an
application. If I run through something often enough and it starts to
annoy me, then there is probably something about the UI that could be
improved.  Or I’m being extra picky; there’s always plenty of those
users.  Which reminds me: You can’t please everybody so just aim for the
majority.

I don’t know that it helps with user experience design, but testing your
UI is also important. Here’s a few libraries for unit testing ui:

-   [watr](http://wtr.rubyforge.org/) for Internet Explorer (how I was
    introduced to Ruby)
-   [watin](http://watin.sourceforge.net/) is a .Net library inspired by
    watr
-   [NunitForms](http://nunitforms.sourceforge.net/) for testing
    WinForms
-   [silverlightut](http://code.msdn.microsoft.com/silverlightut) for
    testing silverlight
-   [white](http://www.codeplex.com/white) for multiple ui technologies

 

Other essentials

-   [nunit](http://www.nunit.org/)
-   [mbunit](http://www.mbunit.com/)
-   [rhino mocks](http://ayende.com/projects/rhino-mocks.aspx)
-   <http://code.google.com/p/moq/>
-   [tdd.net](http://www.testdriven.net/)

-j
