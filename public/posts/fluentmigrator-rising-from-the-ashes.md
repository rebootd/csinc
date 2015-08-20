
fluentmigrator rising from the ashes
------------------------------------

Wed August 19, 2009

  Well more like it was peacefully sleeping until I came along and
started pounding it on the chest. Now it’s hunched over and coughing
while muttering something about me under it’s breath. But anyway..

  I wanted to build schema management into one of the projects I’m
working on, and found FluentMigrator partly by reference and partly by
accident.  The point is to build up and change database schema in code
with a fluent syntax. Perfect, only I wanted my app to automatically
update if it has a newer version than the database. So I went about
adding that to the code, and all of a sudden this fork appeared for me
in github while angelic voices sung magically in the background. Right
before I pulled the sword from the stone! Seriously though, I’m working
on adding functionality to an excellent project started by [Justin
Etheredge](http://www.codethinked.com/) and [Nate
Kohari](http://kohari.org/). You can find my github fork
[here](http://github.com/jcoffman/fluentmigrator/tree/master).

  My focus will be on my own needs, but feel free to make requests along
the way. Even better, feel free to help! Hopefully, Justin will accept
my changes into the master tree and maybe we can put together a release.

To give you a bit of a preview, here is a sample migration to create a
couple tables and foreign keys:

<div class="csharpcode">

``` {.alt}
   1:      [Migration(1)]
```

       2:      public class TestMigration : Migration

``` {.alt}
   3:      {
```

       4:          public override void Up()

``` {.alt}
   5:          {
```

       6:              Create.Table("Users")

``` {.alt}
   7:                  .WithColumn("UserId").AsInt32().Identity().PrimaryKey()
```

       8:                  .WithColumn("GroupId").AsInt32().NotNullable()

``` {.alt}
   9:                  .WithColumn("UserName").AsString(32).NotNullable()
```

      10:                  .WithColumn("Password").AsString(32).NotNullable();

``` {.alt}
  11:   
```

      12:              Create.Table("Groups")

``` {.alt}
  13:                  .WithColumn("GroupId").AsInt32().Identity().PrimaryKey()
```

      14:                  .WithColumn("Name").AsString(32).NotNullable();

``` {.alt}
  15:   
```

      16:              Create.Column("Foo").OnTable("Users").AsInt16().Indexed();

``` {.alt}
  17:   
```

      18:              Create.ForeignKey("FK_Foo").FromTable("Users").ForeignColumn("GroupId").ToTable("Groups").PrimaryColumn("GroupId");

``` {.alt}
  19:              
```

      20:              Create.Table("Foo")

``` {.alt}
  21:                  .WithColumn("Fizz").AsString(32);
```

      22:   

``` {.alt}
  23:              Rename.Table("Foo").To("Bar");
```

      24:              Rename.Column("Fizz").OnTable("Bar").To("Buzz");

``` {.alt}
  25:   
```

      26:              Insert.IntoTable("Users").Row(new { UserName = "Data1", Password = "Data2" });

``` {.alt}
  27:          }
```

      28:   

``` {.alt}
  29:          public override void Down()
```

      30:          {

``` {.alt}
  31:              Delete.ForeignKey("FK_Foo").OnTable("Users");
```

      32:              

``` {.alt}
  33:              Delete.Table("Bar");
```

      34:              Delete.Column("Foo").FromTable("Users");

``` {.alt}
  35:              Delete.Table("Users");
```

      36:              Delete.Table("Groups");

``` {.alt}
  37:          }
```

      38:      }

</div>

 

I’m actually not so much of a fan of the class attribute to specify the
version. I’d prefer to have a convention using the class name, and a
convention to specify where the migration classes live within an
assembly. We’ll work with this for now and see what can be done later.
So go check it
[out](http://github.com/jcoffman/fluentmigrator/tree/master).

-j
