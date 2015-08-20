
schemaupdate and versioning
---------------------------

Tue July 21, 2009

This is mostly for my own future reference.  I wanted to remind myself
that NHib’s SchemaUpdate currently doesn’t support SqlLite so updating
schema will have to be done manually if using SqlLite.  I encountered
this while playing around with
[FluentNHibernate](http://fluentnhibernate.org/).

It could be possible to use
[Migrator.Net](http://code.google.com/p/migratordotnet/).  And
[here](http://flux88.com/blog/net-database-migration-tool-roundup/) is a
blog post roundup of database migration tools; it’s a bit dated now but
helpful.  I’d lean toward Subsonic given who is behind it.  Rest
assured, I will try this stuff out in the near future. (I have something
up my sleeve. *No, not that!*)

-j
