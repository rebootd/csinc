
new .net app – just add water
-----------------------------

Mon September 28, 2009

I’ve been meaning to post this for a while, only I was planning on
covering it with more depth. Life has been a bit busy, so I’m going to
post it in it’s current form.

Using [FluentMigrator](http://github.com/enkari/fluentmigrator),
[Fluent-NHibernate](http://fluentnhibernate.org/), and
[NHibernate](http://nhforge.org/), one can whip up an app fairly
quickly. Let’s walk through it in brief.

First, grab the source for
[FluentMigrator](http://github.com/enkari/fluentmigrator) and
[Fluent-NHibernate](http://github.com/jagregory/fluent-nhibernate) from
github. Second, build each and put the binaries somewhere practical for
your application. Use the NHib binaries from Fluent-NHiberate; otherwise
dll versions can be a problem. Now open Visual Studio and create an
application. To keep things easy, I’ll make it a WinForm application.
Source will be in our [OSS
project](http://github.com/jcoffman/csinctools), title InstantApp.

[![CropperCapture\[1\]](http://computeristsolutions.com/blog/image.axd?picture=CropperCapture%5B1%5D_thumb.png "CropperCapture[1]")](http://computeristsolutions.com/blog/image.axd?picture=CropperCapture%5B1%5D.png)

Now add the references to FluentNH, FluentMigrator, and NH. For the
count, I added FluentMigrator.dll, FluentMigrator.Runner.dll,
Castle.Core.dll, Castle.DynamicProxy2.dll, log4net.dll, and
System.Data.SQLite.dll to use sqlite as the database. Don’t worry, the
sqlite dll is in the sample code repository. (Update: please refer to
the sample for the added dlls. I added others such as NHibernate.linq.)

[![CropperCapture\[2\]](http://computeristsolutions.com/blog/image.axd?picture=CropperCapture%5B2%5D_thumb.png "CropperCapture[2]")](http://computeristsolutions.com/blog/image.axd?picture=CropperCapture%5B2%5D.png)

Now, we need some schema. I recommend keeping schema codefiles in a
seperate folder to keep things easy to maintain; so I added a
“Migrations” folder in the project. Then added a “first.cs” schema
class. Because I am a bit particular, I’m also adding a folder called
“Models” to contain the object model classes. In order to wire-up NHib
with Fluent-NH, each model will need a mapping class. I’ve added those
to the folder “Mappings” under the “Models” folder. Then I’m adding
“Tests.cs” because I want to test a couple things.

[![CropperCapture\[3\]](http://computeristsolutions.com/blog/image.axd?picture=CropperCapture%5B3%5D_thumb.png "CropperCapture[3]")](http://computeristsolutions.com/blog/image.axd?picture=CropperCapture%5B3%5D.png)

So far, so good… now we need some code, and because this is fast &
dirty, I’m going to whip out the migration code. Let’s keep it to just
one table. And add some data.

<div class="csharpcode">

``` {.alt}
   1:  public override void Up()
```

       2:  {

``` {.alt}
   3:    //users table
```

       4:    Create.Table("Users")

``` {.alt}
   5:    .WithColumn("Id").AsInt32().NotNullable().PrimaryKey()
```

       6:    .WithColumn("Email").AsString(50).NotNullable()

``` {.alt}
   7:    .WithColumn("Name").AsString(50).NotNullable()
```

       8:    .WithColumn("Password").AsString(100).NotNullable();

``` {.alt}
   9:   
```

      10:    for(int loop = 0; loop < 10; loop++)

``` {.alt}
  11:    {
```

      12:      Insert.IntoTable("Users").Row(new { Id = loop, Email = string.Format("email{0}@mail.com", loop),

``` {.alt}
  13:                                                  Name = string.Format("test name{0}", loop),
```

      14:                                                  Password = string.Format("password{0}", loop)

``` {.alt}
  15:      });
```

      16:    }

``` {.alt}
  17:  }
```

      18:   

``` {.alt}
  19:  public override void Down()
```

      20:  {

``` {.alt}
  21:    Delete.Table("Users");
```

      22:  }

</div>

Let’s run this on startup so the table gets created right away. So I
added this to Program.cs and called it in Main():

<div class="csharpcode">

``` {.alt}
   1:  static void MigrateDatabase()
```

       2:  {

``` {.alt}
   3:   //make sure the sqlite db file exists
```

       4:   if (!File.Exists(DbFile))

``` {.alt}
   5:   System.Data.SQLite.SQLiteConnection.CreateFile(DbFile);
```

       6:   

``` {.alt}
   7:   //run migration
```

       8:   using (SQLiteConnection connection = new SQLiteConnection(ConnectionString))

``` {.alt}
   9:   {
```

      10:    var conventions = new MigrationConventions();

``` {.alt}
  11:    connection.Open();
```

      12:    var processor = new FluentMigrator.Runner.Processors.Sqlite.SqliteProcessor(connection, new SqliteGenerator());

``` {.alt}
  13:    var runner = new MigrationVersionRunner(conventions, processor, new MigrationLoader(conventions));
```

      14:   

``` {.alt}
  15:   //upgrade to latest
```

      16:   runner.UpgradeToLatest(false);

``` {.alt}
  17:   }
```

      18:  }

</div>

 

Aaaanndd now.. {drum roll} ..let’s get a list of all the users as take
from one of the tests:

<div class="csharpcode">

``` {.alt}
   1:  var session = CreateSessionFactory().OpenSession();
```

       2:  var list = from c in session.Linq<User>()

``` {.alt}
   3:    select c;
```

       4:  Assert.True(list.ToList().Count == 10);

</div>

Yeah! It passes. So now, just add a data grid view to the WinForm, and
the right code.  Wha-bam! You get data in your grid. Pretty nice for
less than an hour’s work.

<div class="csharpcode">

``` {.alt}
   1:  var session = CreateSessionFactory().OpenSession();
```

       2:  var list = from c in session.Linq<User>()

``` {.alt}
   3:   select c;
```

       4:   

``` {.alt}
   5:  dataGridView1.AutoGenerateColumns = true;
```

       6:  dataGridView1.DataSource = list.ToList();

</div>

[](http://computeristsolutions.com/blog/image.axd?picture=CropperCapture%5B9%5D.png)

 

[![CropperCapture\[9\]](http://computeristsolutions.com/blog/image.axd?picture=CropperCapture%5B9%5D_thumb.png "CropperCapture[9]")](http://computeristsolutions.com/blog/image.axd?picture=CropperCapture%5B9%5D.png)

 

That’s the short intro to building an app with NH, FNH, FluentMigr, and
a dash of Linq. See the OSS code for better details.
