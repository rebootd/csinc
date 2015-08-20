
rob ashton on ravendb vs mongodb
--------------------------------

Thu January 27, 2011

Here's the post: [RavenDB vs
MongoDB](http://codeofrob.com/entries/ravendb---what’s-the-difference.html)
by [@RobAshton](http://twitter.com/robashton)\
\
 Personally, I think both are good products and Rob's post has given
more to think about regarding MongoDB. Basically, NoSQL solutions tend
to focus on solving specific problems; target a "sweet spot" as he calls
it. I think that's about dead on. So he pretty well lays out the
functional focus for RavenDB and CouchDB, but doesn't really see much of
a sweet spot for MongoDB.\
\

> I don’t see it, I don’t see the sweet spot – even if the durability
> issues are sorted out it’s still just a traditional database with a
> few less features in the name of gaining a few milliseconds that most
> of us don’t need.
> <div class="quoted">
>
> Rob Ashton
>
> </div>

He probably has a better perspective on the technical aspect behind
that, but I can think of a little reason why you or someone might choose
MongoDB. Environment and ease of development. If you are targeting some
environment where RavenDB or CouchDB aren't good choices, MongoDB is
still worth considering. You'll have to weigh the risk of data loss from
a catastrophic power loss, but it's probably a minimal risk and a
situation that should improve by v1.8.\
\
 The ease of development with a good MongoDB driver is hard to beat
versus RDBMS, and you don't have the ORM impedence problem. I'm going to
stick with my viewpoint: use what works for the problem you are solving.
..and definitely read Rob's articles.\
\
 **Update:** This started as a short post about Rob's article, but I
keep thinking about it; which probalby is an indication that its a good
article. I can't really disagree with Rob's analysis yet I like MongoDB.
Back to the scenario above.. Say you are hosting on Heroku or some
similar service. \[[moncai](http://moncai.com/),
[appharbor](http://appharbor.com/) for .Net;
[nodester](http://nodester.com/) for NodeJS\] It only makes sense to
host your data likewise. This leaves you the choices of Postgres if your
on Heroku, or a hosted database like
[MongoHq](https://mongohq.com/home),
[MongoMachine](http://mongomachine.com/), or
[Cloudant](https://cloudant.com/) which is CouchDB. In all those cases,
reliability is their job so worrying about that isn't yours. It comes
down to fitting your need then. In most cases, you don't even need to
care about whatever speed difference; both are plenty fast enough.
Assuming those NoSQL options fit your need, all you have left is ease of
development. I haven't spent much time on CouchDB, but MongoDB.. it's
fun! I've used it in Ruby and .Net and both were fun to use.
[NoRM](https://github.com/karlseguin/NoRM) for .Net is a nice little
MongoDB driver if you're interested.\
\
 Rob has good points, but don't ignore MongoDB. Consider first your
needs and environment. Then consider what works. Lastly, pick what you
like working with because, presumably, a good part of your time will be
spent with it.\
\

**UPDATE:** Someone pointed out that the link to Rob's article, which
was a shortened link, was now pointing to an unrelated article. I've
updated the link above.
