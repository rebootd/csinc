
what is a table but a collection of columns
-------------------------------------------

Tue January 18, 2011

What is a table but a collection of columns? Speaking in terms of a
database of course. Is there anything else about a table itself that
matters other than the name? Picture any table, what makes it a table?
It's just a named collection of columns and their indexes.\
\
 I don't know why I've never thought about it like this before. It's
true though. Besides anything that a particular database adds, it's just
a named collection. Sure there are triggers, but that's programmatic
behavior attached to a table and managed by a particular storage engine.
It's not really a defining quality of a table. As I write this, I'm
mentally reviewing the information in ms sql's sysobjects table which
describes the tables in an mssql database. Nothing in there besides name
really defines a table; all the rest is storage engine info.\
\
 **Columns, Indexes, and Keys! Oh My!!**\
\
 I started thinking about this and in this way when pondering how I'm
going to implement the schema dumping feature in Fluent Migrator. We
already have a ColumnDefinition class. I realized I don't have to make a
TableDefinition class, just a dictionary/hash with the name name and
it's collection of columns. So a table is just a named collection of
columns and indexes. Keys, like Foreign Key, exist separately but
attached in that they connect columns between 2 tables. They will
probably need to be defined separately.\
\
 This matters because I need to gather the most useful information
across all our supported databases so that I can then write out a schema
dump. The common bit is table name, and it's columns/indexes.\
\
 When thinking of it this way, it starts to sound like a [Column
Database](http://ayende.com/Blog/archive/2010/05/14/that-no-sql-thing-column-family-databases.aspx)
Super Column. No Keys of course because this kind of DB doesn't
intrinsically maintain relationships.\
\
 It's actually quite different than a column db, of course, but I find
it interesting to think about it from a different perspective. It helps
find simpler solutions to problems that seem more complex at first.
