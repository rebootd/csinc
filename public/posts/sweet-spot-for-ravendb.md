
sweet spot for ravendb
----------------------

Wed April 28, 2010

[@Ayende](http://twitter.com/ayende) asks what the [sweet
spot](http://twitter.com/ayende/statuses/13012828791) for
[RavenDB](http://github.com/ravendb/ravendb) would be.. The thing is a
lot will become more clear with experience using it.  Right now, I
envision a small to medium sized app that doesn’t have an overly deep
object model and doesn’t require a lot of inter-joining queries (because
that would mean a lot of map-reduce queries).

But RavenDB is scalable and seems to have good performance already so it
should be capable of handling large data systems.  I just hesitate with
any new database until it actually proves it can handle really large
data stores.  You see, really large data stores have their own set of
problems with performance and scaling which you don’t see in smaller
systems.  Try dropping, reloading, and full-text indexing a
multi-terabyte sql server db every 24-48 hours while keeping the data
driven site up.  You’ll see what I mean pretty quick.

I have my reservations, but am otherwise very eager to use RavenDB in
real applications.  It has a lot of promise; I even started a demo app
called [RavenBlog](http://github.com/jcoffman/ravenblog).  I find it
really let you focus on business rules and implementation because you
don’t spend nearly the time determining the persistence model.  And that
is a VERY good thing.  (which is true of NoSQL in general)

So to summarize my answer: small-medium size apps with limited object
models, but I think it could prove to handle bigger systems as
experience proves out.
