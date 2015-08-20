
fluent nhibernate and you
-------------------------

Wed June 24, 2009

I finally got around to writing a little code with [Fluent
NHibernate](http://fluentnhibernate.org/) and I like it. Of course I
knew I probably would, but it does something I didn’t realize.. at least
with SQL Lite, it creates the Schema for you from the mapped entities
(might be an [NHibernate](https://www.hibernate.org/343.html) feature).
You can grab the
[source](http://wiki.fluentnhibernate.org/show/GettingStartedInstall)
and see it in action with the sample project. Now this is both good and
bad because I will have to come up with a versioning approach to deal
with this. Basically you do these things:

**Create your entities**

<div class="csharpcode">

``` {.alt}
   1:  public class WebLink
```

       2:  {

``` {.alt}
   3:    public virtual int Id { get; private set; }
```

       4:    public virtual string URL { get; set; }

``` {.alt}
   5:    public virtual string Name { get; set; }
```

       6:    public virtual bool OpenNewWindow { get; set; }

``` {.alt}
   7:   }
```

</div>

****

**Create the entity maps**

<div class="csharpcode">

``` {.alt}
   1:  public class WebLinkMap : ClassMap<WebLink>
```

       2:  {

``` {.alt}
   3:    public WebLinkMap()
```

       4:    {

``` {.alt}
   5:      Id(x => x.Id);
```

       6:      Map(x => x.URL);

``` {.alt}
   7:      Map(x => x.Name);
```

       8:    }

``` {.alt}
   9:  }
```

</div>

****

**Setup configuration and get an ISession object**

<div class="csharpcode">

``` {.alt}
   1:  public ISessionFactory CreateSessionFactory()
```

       2:  {

``` {.alt}
   3:    if (_sessionFactory == null)
```

       4:   

``` {.alt}
   5:    {
```

       6:      _sessionFactory = Fluently.Configure()

``` {.alt}
   7:        .Database(SQLiteConfiguration.Standard
```

       8:         .UsingFile(DbFile))

``` {.alt}
   9:        .Mappings(m =>
```

      10:        m.FluentMappings.AddFromAssemblyOf<BootStrap>())

``` {.alt}
  11:        .ExposeConfiguration(BuildSchema)
```

      12:        .BuildSessionFactory();

``` {.alt}
  13:    }
```

      14:   

``` {.alt}
  15:    return _sessionFactory;
```

      16:  }

``` {.alt}
  17:   
```

      18:  private void BuildSchema(Configuration config)

``` {.alt}
  19:  {
```

      20:    // delete the existing db on each run

``` {.alt}
  21:    if (File.Exists(DbFile))
```

      22:        File.Delete(DbFile);

``` {.alt}
  23:   
```

      24:    // this NHibernate tool takes a configuration (with mapping info in)

``` {.alt}
  25:    // and exports a database schema from it
```

      26:    new SchemaExport(config)

``` {.alt}
  27:        .Create(false, true);
```

      28:  }

</div>

****

**Add your data**

<div class="csharpcode">

``` {.alt}
   1:  public void SetupData()
```

       2:  {

``` {.alt}
   3:    var sessionFactory = BootStrapper.CreateSessionFactory();
```

       4:    using (var session = sessionFactory.OpenSession())

``` {.alt}
   5:    {
```

       6:      // populate the database

``` {.alt}
   7:      using (var transaction = session.BeginTransaction())
```

       8:      {

``` {.alt}
   9:        //links
```

      10:        var link1 = new WebLink { URL = "http://semperfifund.org", Name = "semper fi fund", OpenNewWindow = true };

``` {.alt}
  11:        var link2 = new WebLink { URL = "http://www.woundedwarriorproject.org/", Name = "wounded warriors", OpenNewWindow = true };
```

      12:        var link3 = new WebLink { URL = "http://www.sunshineacres.org/", Name = "sunshine acres", OpenNewWindow = true };

``` {.alt}
  13:   
```

      14:        SaveLinks(session, link1, link2, link3);

``` {.alt}
  15:        transaction.Commit();
```

      16:      }

``` {.alt}
  17:    }
```

      18:  }

``` {.alt}
  19:   
```

      20:  private void SaveLinks(ISession session, params WebLink[] links)

``` {.alt}
  21:  {
```

      22:    foreach (var link in links)

``` {.alt}
  23:      session.SaveOrUpdate(link);
```

      24:  }

</div>

****

**Query for data**

<div class="csharpcode">

``` {.alt}
   1:  [Test]
```

       2:  public void have_links()

``` {.alt}
   3:  {
```

       4:    var sessionFactory = BootStrapper.CreateSessionFactory();

``` {.alt}
   5:    using (var session = sessionFactory.OpenSession())
```

       6:    {

``` {.alt}
   7:      // retreive all stores and display them
```

       8:      using (session.BeginTransaction())

``` {.alt}
   9:      {
```

      10:        var links = session.CreateCriteria(typeof(WebLink)).List<WebLink>();

``` {.alt}
  11:   
```

      12:        //make sure there are links

``` {.alt}
  13:        Assert.GreaterThan(links.Count, 0);
```

      14:      }

``` {.alt}
  15:    }
```

      16:  }

</div>

 

As you can see, I am using a Unit Test ([MBUnit](http://mbunit.com/)) in
that last snippet. I do most spike & throw away code like that these
days. I used to use a console app but find that too crude anymore. (my
opinion only)

Really, though, that is about all there is to it. I was planning on
trying to get it working with [Firebird db](http://www.firebirdsql.org/)
but SQL Lite will do the job. I might try to figure out hot to do it
with Firebird  anyway just to help out the FNH project.
