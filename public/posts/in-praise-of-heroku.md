
in praise of heroku
-------------------

Thu November 12, 2009

This is going to be blatant praise of [Heroku](http://www.heroku.com),
but I have good reason. I’ve been doing development for a long time now.
I’ve done client-server stuff in many forms for almost all of that time,
and I’m including web development in that. When it comes to hosting your
app, you have some common scenarios to choose from. I’ll list them.

1.  self hosted server
2.  self managed data center
3.  rented rack space
4.  slice hosting
5.  shared hosting
6.  and the current techo-pop.. cloud hosted

 

I’ve done some for of all except slice hosting. Not an expert, but I’ve
learned a couple things. First, there are positives and negatives for
each. One thing that gets forgotten is that your hosting choice impacts
your technology choices, and vice versa.

It’s less of an impact when you self host or self manage a data center,
but there’s a big cost plus in money and maintenance. Obviously, the
smaller the hosting package, the cheaper it is and the more limited the
performance and storage space. That’s where cloud based hosting comes
in. It’s an attempt to let you scale more easily, but development
choices get more limited and deployment can be a pain.

That’s not true with Heroku though.

*Time out.* ..I’m prompted to posted this because of a specific
situation. I have a shared hosting account which I want to use to test
out small projects we’re working on. The problem is its run under Medium
Trust (.Net term if you don’t know). It uses the
[Spark](http://sparkviewengine.com/) view engine, so that means it has
to precompile the views. That hasn’t gone well. The hosting choice,
while economical, has also caused significant development pain to try to
get the chose platform to work. Not fun at all actually.

*Time back in..* This is where Heroku excels. It’s a cloud hosting
service, and deployment is dead simple. You just use git to push your
rails app up. You can start with a free account and then buy the
appropriate service level from there. Manage your scale, add extra
services or features, integrate with Amazon services. It’s all just
plain simple. Now I know from the discussion group, that its not perfect
all the time. Everything I see is that its quite reliable, and the team
certainly is very responsive.

If you are building a rails app.. don’t think, just deploy to Heroku. No
stress; should just work. I’d recommend it to any rails shop.  ..I’d
recommend it to non-rails shops using rails in any way. You don’t get
bound into the specific SDK requirements of Google or Microsoft Azure.
Even Amazon EC2 has its technical reqs. In just my casual checks, it
looks like their pricing is more than competitive too.

I honestly consider Heroku to be a visionary achievement. I don’t think
there was anything quite like it when they popped up, and I’m not sure
there is yet. A team of devs decided they wanted a scalable rails
hosting solution with easy depployment – something that is still a
challenge with rails apps in many places – so they built one. How much
easier can something be than checking in your files to a repository?

Great job guys!! To all the rails hacks or pros, just go check it out.

**Update:** I view Heroku as one of the reasons consider using rails.
