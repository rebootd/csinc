
search a database for a value in any column
-------------------------------------------

Fri May 20, 2011

**WARNING!!!!!** Please be careful with this. It's not going to perform
well in most situations.\
\
 I just had to find a value in the database without knowing the column.
In fact, I was really looking for the column and knew one of the values
in it. So I wrote this. Turns out, clients changed their minds, but here
([gist](https://gist.github.com/983544)) it is in case anyone needs it.\
\
 **UPDATE:** \*slaps forehead\* realized its much easier to only check
sys.columns and use OBJECT\_NAME({id}) to get the schema object name.
"select OBJECT\_NAME(object\_id) as tblname, \[name\] as colname from
sys.columns" ..could have used that instead of the UNION below. Too lazy
to change the gist right now.\
\
