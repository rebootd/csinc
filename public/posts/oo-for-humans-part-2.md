
oo for humans part 2
--------------------

Thu May 21, 2009

**Outline:**

-   Introduction
-   Inheritance
-   Polymorphism
-   Abstraction
-   Encapsulation

****

**Introduction**

  In the last post in this series, I talked about Object Oriented
Programming in less technical terms. We’re going to jump into the deep
end here though. You see, I’ve already explained this stuff. Now I’m
just telling you the technical terms for it. Hopefully even if you are
not already a programmer, you will understand this stuff after.

**Inheritance**

  Ok, the first one is a curve ball. I haven’t clearly talked about
inheritance (technical term, not financial). It’s not hard though. Going
back to the Hammer example we’ve been using, let’s say you want to make
another hammer that does everything exactly the same but doesn’t smah
your fingers if you miss the nail. You can do that, and you don’t have
to build a whole new hammer. Just use the same one as before, but add a
smarter new case around it. Like this in c\#:

<div class="csharpcode">

``` {.alt}
   1:   
```

       2:  public class SmartHammer : Hammer

``` {.alt}
   3:  {  
```

       4:    public override void OwwThatReallyHurts()

``` {.alt}
   5:    {
```

       6:    }

``` {.alt}
   7:  }
```

       8:   

``` {.alt}
   9:  //from our old hammer...
```

      10:  public virtual class Hammer : IHammer

``` {.alt}
  11:  {
```

      12:    public string Color = "red";

``` {.alt}
  13:    public virtual void Swing()
```

      14:    {

``` {.alt}
  15:    }
```

      16:    public virtual void Nail()

``` {.alt}
  17:    {
```

      18:    }

``` {.alt}
  19:    public virtual void Break()
```

      20:    {

``` {.alt}
  21:    }
```

      22:    public virtual void OwwThatReallyHurts()

``` {.alt}
  23:    {
```

      24:    }

``` {.alt}
  25:  }
```

</div>

  Some of you may notice the extra word in the old hammer code:
*virtual*. That’s just a C\# keyword that tells the computer that the
new hammer can do something different.

  So we have our new hammer, and we can make it better by changing
OwwThatReallyHurts(). Like this:

<div class="csharpcode">

``` {.alt}
   1:  public override void OwwThatReallyHurts()
```

       2:  {

``` {.alt}
   3:    DontHitMyFingers();
```

       4:  }

</div>

 

  That’s hit.. I mean, it. (Yes I really did type “hit” at first, and
decided to roll with it.) You made a better hammer with minimal work,
and it does all the same things as the old hammer with the exception of
that one change.

**Polymorphism**

  So by some magical coincidence, that altered method,
OwwThatReallyHurts, happens to be an example of Polymorphism.
Polymorphism is the the ability to override a default and make it do
something else. That is exactly what we just did. We took the Hammer
class and all it already did, but changed one method by overriding it.
This is what “virtual” and “override” are for in the above samples.
Virtual tells the code that, yes, you can change me. Override tells the
code that, yes, I am going to change this code.

**Abstraction**

  An abstraction is basically hiding details so you don’t have to think
about too many things too deeply all at the same time. The fact that I’m
using sample code which doesn’t define every single piece of code is an
abstraction. Specifically, DontHitMyFingers() is an abstract placeholder
for some undefined code. It doesn’t really matter what it does, as long
is it does it correctly. I could have used sample code like this:

<div class="csharpcode">

``` {.alt}
   1:  public override void OwwThatReallyHurts()
```

       2:  {

``` {.alt}
   3:    if(hammer.location - fingers.location < 100)
```

       4:      hammer.move(-10, "feet");

``` {.alt}
   5:  }
```

</div>

 

  It really just doesn’t matter though, not in order to understand what
polymorphism is or the other points made here. For this point it does
matter. It is exactly the point, and so is the fact the Hammer has the
code for Swing() but SmartHammer doesn’t. SmartHammer doesn’t need or
want to have that code, it’s only purpose is to not hit your fingers
while doing everything else the same. So the code which performs Swing()
is abstracted out of the code for SmartHammer; even though SmartHammer
can still perform a Swing() action.

**Encapsulation**

****

  Encapsulation
([define](http://www.google.com/search?hl=en&rlz=1C1CHMB_enUS307US307&q=define:encapsulate&btnG=Search))
means to enclose in a capsule or small container. Honestly, it’s easy to
confuse it with abstraction. Abstraction is the representation of
features while encapsulation is hiding those things which aren’t
essential. When you use a hammer, you don’t need to know the physics of
how it works in order to use it. That’s encapsulation. You do need to
know how use it to swing it. Knowing about the Swing() action without
needing to know how it works is abstraction.

<div class="csharpcode">

``` {.alt}
   1:  public interface IHammer
```

       2:  {

``` {.alt}
   3:  void Swing();
```

       4:  void Nail();

``` {.alt}
   5:  void Break();
```

       6:  void OwwThatReallyHurts();

``` {.alt}
   7:  }
```

       8:   

``` {.alt}
   9:  public class Hammer : IHammer
```

      10:  {

``` {.alt}
  11:    public string Color = "red";
```

      12:    public void Swing()

``` {.alt}
  13:    {
```

      14:    }

``` {.alt}
  15:    public void Nail()
```

      16:    {

``` {.alt}
  17:    }
```

      18:    public void Break()

``` {.alt}
  19:    {
```

      20:    }

``` {.alt}
  21:    public void OwwThatReallyHurts()
```

      22:    {

``` {.alt}
  23:    }
```

      24:  }

``` {.alt}
  25:   
```

      26:  void Main()

``` {.alt}
  27:  {
```

      28:    //IHammer is the encapsulation. we can still swing it but not know that the color is Red

``` {.alt}
  29:    IHammer hammer = new Hammer();
```

      30:    hammer.Swing();

``` {.alt}
  31:  }
```

</div>

Look again at our Interface and a sample Hammer class (above). If we
look at and instance of the Hammer class, we know its red. However,
IHammer hides that detail because you don’t need to know it just to
swing it.

**Conclusion**

  Hopefully you can see this stuff just isn’t hard. I hope my
explanation has helped you to understand if you didn’t already. There is
so much more depth to this and the other areas I’ve covered, but would
be overwhelming to both the reader and myself to try to cover all at
once. I hope you’ll continue to read my posts and other blogs. If you
have any interested, then I encourage you to read a book or take a
class. For those already programming or technical, I will be covering
topics directed at you soon.

**Links:**

-   <http://en.wikipedia.org/wiki/Object_oriented>
-   <http://en.wikipedia.org/wiki/Inheritance_(computer_science)>
-   <http://www.astahost.com/C-Tutorial-Lesson-5-Encapsulation-and-Abstraction-t15427.html>
-   <http://gpwiki.org/index.php/Object_Oriented_Programming:Abstraction>
-   <http://en.wikipedia.org/wiki/Abstraction_(computer_science)>
-   <http://en.wikipedia.org/wiki/Information_hiding>
-   <http://en.wikipedia.org/wiki/Polymorphism_(computer_science)>

-j
