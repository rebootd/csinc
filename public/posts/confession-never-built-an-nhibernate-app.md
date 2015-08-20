
confession: never built an nhibernate app
-----------------------------------------

Mon August 10, 2009

> [![nhib](http://computeristsolutions.com/blog/image.axd?picture=nhib_thumb.png "nhib")](http://computeristsolutions.com/blog/image.axd?picture=nhib.png)

  For all that I do to push for better software design and testing, my
job is to build the software my client wants in the environment they
choose.  I’m pretty fortunate and have had good clients, but everything
isn’t always done according to me. That’s life. So I’ve never built an
[NHibernate](http://sourceforge.net/projects/nhibernate/) based app. Not
truly anyway. I have built stuff on Castle
[ActiveRecord](http://castleproject.org/activerecord/index.html) (built
on nhib), which was great! Now I’ve got a project I work at once in a
while which I have complete control over. I’ve rewritten it a few times,
and this last time chose to use ASP.Net MVC,
[NHibernate](http://sourceforge.net/projects/nhibernate/),
[FluentNhibernate](http://fluentnhibernate.org/), and
[FluentMigrator](http://code.google.com/p/fluentmigrator/). I’ll be
using either [nUnit](http://nunit.org/index.php) or
[xUnit](http://www.codeplex.com/xunit) for testing, and probably
[RhinoMocks](http://ayende.com/projects/rhino-mocks.aspx) for mocking. 
Oh yeah, any IoC will use [Castle
Windsor](http://castleproject.org/container/index.html).

  This is a little bit of new ground for me so I’m treading slowly. It’s
easy to forget to separate integration tests from unit tests especially
since my current client project doesn’t. I find myself struggling to
choose how to do certain things like initializing the database schema
which is done with FluentMigrator. I want a nice migration experience,
but I’m not sure if I want it to automatically update schema without any
user action. You can get into trouble with that if there is a problem
with the migration; it can cause an infinite loop of attempting to
update the schema.

  Also, I nearly fell into the trap of requiring updated schema for the
unit test.  Unit tests shouldn’t need schema because they should not be
testing database integration. Integration tests will need that, and will
test that the data model behave properly when using the database.

  What is great about this is that it forces me to improve, which is a
big part of the reason why I’ve rewritten this a few times. This is also
my first time working with ASP.Net MVC (have used and love [Castle
Monorail](http://castleproject.org/monorail/index.html)) but it’s just
MVC again with whatever dialect MS put on it. The team behind it are
excellent so I’m expecting good stuff. I’m open to input, especially
with testing UI. I haven’t done much of that and plan to with this
project. Let me know any recommendations.

  I’m not sure what will happen with this little stealth project and
don’t want to tip my hand yet. ..but here is a little, carefully
redacted teaser:

<div class="csharpcode">

``` {.alt}
   1:  Delete.ForeignKey("FK_TimeEntries_UserId");
```

       2:  Delete.ForeignKey("FK_Companies_UserId");

``` {.alt}
   3:  Delete.ForeignKey("FK_Approvals_UserId");
```

       4:   

``` {.alt}
   5:  Delete.Table("Companies");
```

       6:  Delete.Table("TimeEntries");

``` {.alt}
   7:  Delete.Table("Users");
```

</div>

-j
