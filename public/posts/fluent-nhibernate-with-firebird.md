
fluent nhibernate with firebird
-------------------------------

Thu June 25, 2009

Well it works if a bit clunky first try by me. Thanks to some help on
the Fluent NH email list and reading a couple docs, I got a really
simplistic implementation based on the [SQLLite
version](http://computeristsolutions.com/blog/post/Fluent-NHibernate-And-You.aspx).

**Config code:**

<div class="csharpcode">

``` {.alt}
   1:   public BootStrap()
```

       2:          {

``` {.alt}
   3:              _userName = "test";
```

       4:              _password = "test";

``` {.alt}
   5:              DbFile = "test.db";
```

       6:              ConnectionString = String.Format("ServerType=1;User={0};Password={1};Dialect=3;Database={2}", _userName, _password, DbFile);

``` {.alt}
   7:   
```

       8:              //setup firebird configuration

``` {.alt}
   9:              firebird = new FirebirdConfiguration();
```

      10:              firebirdConfig = Fluently.Configure().Database(

``` {.alt}
  11:                       firebird.ConnectionString(c => c
```

      12:                       .Is(ConnectionString)));

``` {.alt}
  13:          }
```

</div>

 

**Create the Session:**

<div class="csharpcode">

``` {.alt}
   1:  public ISessionFactory CreateSessionFactory()
```

       2:          {

``` {.alt}
   3:              if (_sessionFactory == null)
```

       4:              {

``` {.alt}
   5:                  _sessionFactory = firebirdConfig.Mappings(m => m.FluentMappings.AddFromAssemblyOf<BootStrap>())
```

       6:                      .ExposeConfiguration(BuildSchema)

``` {.alt}
   7:                      .BuildSessionFactory();
```

       8:              }

``` {.alt}
   9:   
```

      10:              return _sessionFactory;

``` {.alt}
  11:          }
```

</div>

 

**Build the Schema:**

<div class="csharpcode">

``` {.alt}
   1:  private void BuildSchema(Configuration config)
```

       2:          {

``` {.alt}
   3:              //quit if it alread exists
```

       4:              if (File.Exists(DbFile)) return;

``` {.alt}
   5:              
```

       6:              //user firebird to create the database

``` {.alt}
   7:              FbConnection.CreateDatabase(ConnectionString);
```

       8:   

``` {.alt}
   9:              // this NHibernate tool takes a configuration (with mapping info in)
```

      10:              // and exports a database schema from it

``` {.alt}
  11:              new SchemaExport(config)
```

      12:                  .Create(false, true);

``` {.alt}
  13:          }
```

</div>

 

Now the problem is I’m inserting test data each time test runs so there
is an ever increasing number of records without getting cleaned up. So
just have to manage the data state and it will work.  That said, SQLLite
is the better option.  Firebird doesn’t support auto-increment keys and
seems easier to manage.  Also, this sample code wouldn’t run on 64bit.
It seems to have problems opening the process. Perhaps there is a 64 bit
dll I should have been using though.

-j
