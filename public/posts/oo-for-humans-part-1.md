
oo for humans part 1
--------------------

Sat May 02, 2009

**Introduction**\
I've been working at introducing programming concepts in a way that is,
hopefully, easy to understand for the general public. It would help to
go back and read previous posts in this series.  You can find them
[here](http://computeristsolutions.com/blog/category/for-humans.aspx). I
am going to continue using the hammer metaphor in this series. I should
also note that code samples are written in C\#, but I don't promise they
will compile as-is. It's just sample code.\
 \
**Goals:**

-   define class
-   define object
-   define OO (OO is an abbreviation of Object Oriented)
-   explain reasons

\
**Class:**\
<http://en.wikipedia.org/wiki/Class_(computer_science)>\
 \
OK. You could read the wiki article I've linked, or just take my word
for it. I think you'll want to if you take a look at the wiki
explanation. A Class is how we define the data and behavior for an
object (defined below). It's really just the code that holds data values
and performs various actions. If you think of it like the hammer I
talked about [last
time](http://computeristsolutions.com/blog/post/Interfaces-For-Humans.aspx)
(read it if the next piece isn't clear), it can do a few different
things and tell you about itself like this:\

<div class="csharpcode">

``` {.alt}
   1:  public class Hammer : IHammer
```

       2:  {

``` {.alt}
   3:    public string Color = "red";
```

       4:    public void Swing()

``` {.alt}
   5:    {
```

       6:    }

``` {.alt}
   7:    public void Nail()
```

       8:    {

``` {.alt}
   9:    }
```

      10:    public void Break()

``` {.alt}
  11:    {
```

      12:    }

``` {.alt}
  13:    public void OwwThatReallyHurts()
```

      14:    {

``` {.alt}
  15:    }
```

      16:  }

</div>

\
\
The above Hammer class will tells us it is Red, and let us perform the
usual things you do with a hammer. When you want to use the Hammer in
your code, you create an instance (explained in the next section).\
\
\
**Object:**\
<http://en.wikipedia.org/wiki/Object_(computer_science)>\
\
"an object is an allocated region of storage" which is programming speak
for code the represents a thing of some sort. It could be a real thing
or an abstract idea. I think its easy to understand real things, which
is why I use the hammer example. A class defines the thing in code; an
object is an instance of that class. By instance, we mean a particular
real hammer that you can use, hold, and knock some sense into that
driver who cut you off. (No, don't really do that)

<div class="csharpcode">

``` {.alt}
   1:  Hammer myHammer = new Hammer();
```

</div>

Above is how we might create an instance of the Hammer class, which
would be an object. An object is an instance of your class, just like it
is one particular hammer you've picked up from the bin at Home Depot.
Once you've got your hammer(class instance or real thing), you use it
exactly how would expect. Look at the color, swing it, nail something,
break something else, and maybe smash your fingers.\
 \
\
**OO:**\
<http://en.wikipedia.org/wiki/Object_oriented>\
 \
So OO (or Object Oriented Design/Principles/Programming/whatever) is
what we're talking about with the hammer color and its actions. There
are some specific techinical terms, but those are going to be talked
about in Part 2. We are talking about the concepts today: the concept of
data continained in an object which tells you something about it (such
as color), and the concept of different actions you can do with your
object. Heck, you may already have realized that hammers come in
different sizes, styles, and colors. That's part of OO as well. This
stuff isn't hard after all!\
\
\
**Reasons:**\
Wikipedia tells us that OO has its root in 1960's era programming and
has developed from there. True. It's just taking real world concepts and
expressing them in terms of programming so your code can be organized in
a way that makes sense. Being organized in code is very helpful. You
avoid stupid mistakes, typing the same thing over & over again, and help
keep your program working. Being organized is an excellent reason to use
OO principles.\
 \
Having clarity is another good reason for OOP (OO
principles/programming). It's pretty obvious what a hammer does, and it
should be pretty obvious what a Hammer class does even if its a slightly
different style. Going back to our interface talk, you can have a hammer
that is red, plastic, or whatever as long as it does the same thing a
hammer needs to do.\
 \
Testing is not an ends but a means, and a good reason to use OOP. Using
testing helps build applications with less bugs which is easier to
understand and work with. You can test code that doesn't use OOP, but
testing code that uses OOP is much easier. In the end it yields code and
design which is just more stable. (Read the [unit testing
post](http://computeristsolutions.com/blog/post/Unit-Testing-is-for-humans.aspx)
if you haven't already)\
 \
<span style="text-decoration: underline">Next time:</span> What OO terms
we've talked about in concept here\
\
-j
