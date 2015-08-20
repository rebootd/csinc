
fluent migrator schema dump is a possibility
--------------------------------------------

Thu January 13, 2011

Now that I once again have a use for Fluent Migrator in a work related
app, the coveted schema dump feature could get built.\
\
 I read over the code Rails ActiveRecord uses along with a couple of the
adapter implementations. It's actually interesting to consider that
advantage of a dynamic language in that situation over a static language
like C\#. Since change-able objects is part of Ruby, db adapters with
differentiating properties or methods is perfectly acceptable.\
\
 The rails code has an abstract base class that does what it needs and
then each database adapter implements it's db specific responses. The
schema\_dumper class know to check if certain methods exists (using
responds\_to), and calls it if it exists or just moves on. An object is
used to represent table, column, and index information. The adapter also
provides that info, which the schema\_dumper then uses to write the
migration dsl to schema.rb. You can read the
[schema\_dumper](https://github.com/rails/rails/blob/master/activerecord/lib/active_record/schema_dumper.rb)
code to see what I'm talking about. The abstract adapter is
[here](https://github.com/rails/rails/blob/master/activerecord/lib/active_record/connection_adapters/abstract_adapter.rb).\
\
 So what does it mean for FM? Well Rails is a good muse for ideas. And
so it is, good ideas. Having objects to wrap the definitions for table,
column and schema and then have the db specific code populate is a good
idea. With that, all you have to do it output into the desired format.
In Rails, the output is their dsl for creating schema. Do we want to do
the same thing, or provide another format? If you have ideas, join the
conversation on the [Fluent Migrator Google
Group](http://groups.google.com/group/fluentmigrator-google-group).\
\
 Helping work out the approach and even contributing some code will help
it get done. I have limited time, and it's not an absolute must with my
current paid projects.
