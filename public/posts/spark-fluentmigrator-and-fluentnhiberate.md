
spark, fluentmigrator, and fluentnhiberate
------------------------------------------

Thu October 29, 2009

[![the-people-of-sparks](http://computeristsolutions.com/blog/image.axd?picture=the-people-of-sparks_thumb.jpg "the-people-of-sparks")](http://computeristsolutions.com/blog/image.axd?picture=the-people-of-sparks.jpg)

[![image](http://computeristsolutions.com/blog/image.axd?picture=image_thumb_8.png "image")](http://computeristsolutions.com/blog/image.axd?picture=image_8.png&keepThis=true&TB_iframe=true&height=400&width=600)
[Spark](http://sparkviewengine.com/) looks like an excellent alternative
view engine. It’s appeal is that the HTML dominates the view instead of
&lt;asp:controls&gt;. Maybe its because I like rails, but it just feels
more natural. Plus you still get the power & familiarity of .Net – in
any form! It supports IronRuby & IronPython even!

So what happens when you take Spark, ASP.Net MVC, FluentMigrator, and
FluentNHibernate.. will it blend? Sure, and here’s how.

1.  create and ASP.Net MVC web application.
2.  follow this [guide](http://www.dimecasts.net/Casts/CastDetails/80)
    to replace the default view engine
3.  use the same simplistic example migration and setup from my
    [InstantApp](http://computeristsolutions.com/blog/post/New-Net-App-e28093-Just-add-water.aspx)
4.  Then just add a view and the code to list the users

 

You can grab the code from <http://github.com/jcoffman/csinctools>,
where you’ll also find the code for InstantApp.

 

Controller method:

[![image](http://computeristsolutions.com/blog/image.axd?picture=image_thumb_9.png "image")](http://computeristsolutions.com/blog/image.axd?picture=image_9.png&keepThis=true&TB_iframe=true&height=400&width=600)

View:[![image](http://computeristsolutions.com/blog/image.axd?picture=image_thumb_10.png "image")](http://computeristsolutions.com/blog/image.axd?picture=image_10.png&keepThis=true&TB_iframe=true&height=400&width=600)
Result:

[![image](http://computeristsolutions.com/blog/image.axd?picture=image_thumb_11.png "image")](http://computeristsolutions.com/blog/image.axd?picture=image_11.png&keepThis=true&TB_iframe=true&height=400&width=600)

By the way, the top image is from the book “The People of Sparks” which
is the second in the City of Ember series.  The first is better; never
read the third.
