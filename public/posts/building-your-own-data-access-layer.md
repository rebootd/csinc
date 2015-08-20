
building your own data access layer
-----------------------------------

Thu October 15, 2009

I’ve done it, but don’t talk about it much. There is plenty of thought
on the web from which to draw inspiration. In general, I recommend
looking at NHibernate for ORM. There are times and cases when such an
ORM cannot be used (usually a political decision). Then you’ll have to
write your own DAL if you intend to access data.

There are good ways to do it, bad ways, and then there are ugly ways.
Recently, I was looking at DAL code in a client’s project and found it
somewhere between bad and ugly.

[![dal](http://computeristsolutions.com/blog/image.axd?picture=dal_thumb.png "dal")](http://computeristsolutions.com/blog/image.axd?picture=dal.png)

I’m sure the smart guys can pick this apart, but there are some simple
reasons why this is not good. First, there are dozens or hundreds of
methods just like this all over the code base. Many where the only major
difference is the SQL loaded by the CommandLoader and maybe a couple of
variable. Second, you are stuck managing state on your own for \_every\_
\_single\_ entity. Or how about that is taking an object parameter only
to later cast it back to the strong type ConnectorField. Heard of boxing
anyone?

Are you stuck with stuff like this, or would like to avoid problems like
this. Lost of good ideas on the web. I recommend reading Davy Brion’s
[series](http://davybrion.com/blog/2009/08/build-your-own-data-access-layer-series/)
on building your own dal. The good, the bad the ugly was a good movie.
Just don’t let it creep into your code base.
