
interfaces for humans
---------------------

Mon April 20, 2009

![](/blog/image.axd?picture=2009%2f4%2fhammer_balls.jpg)Everyone in the
developed world knows what a hammer is and how it looks. We can all
operate one to varying degrees regardless of the color, shape variation,
or size. You swing it. It pounds nails or breaks drywall/etc. It hurts
your finger when you miss and hit your hand by mistake. Pretty standard
and easy to understand.

  

You should try to view your code in the same way. You want it to be easy
to use, easy to maintain, and very understandable by the right audience.
Using an interface to define what it "looks like" is how to do that.
Instead of saying "this is a hammer", you are saying "this is a hammer
class." That tells the user that he can swing, nail things, break
things, and hurt fingers.

  

``` {.csharpcode}
public interface IHammer
{
void Swing();
void Nail();
void Break();
void OwwThatReallyHurts();
}
```

That is an example of an interface in c\# to tell us what a hammer class
would look like.  It has methods (aka actions) for swinging, nailing,
breaking, and getting your fingers hurt. But I don't recommend the last
one. At all. So, OK, great but what good does that do? Well, we now know
exactly what something does and how to use it no matter what
color/shape/size it is. So let's make a couple hammers. Please notice
the use of ": IHammer" in the following code, which is saying this is a
hammer.

``` {.csharpcode}
public class YellowHammer : IHammer
{
   private int swingCount = 0;
 
   public void Swing()
   {
      swingCount++; //just tracking how many times you swing this
   }
 
   public void Nail()
   {
      //thud
   }
 
   public void Break()
   {
      //bam
   }
 
   public void OwwThatReallyHurts()
   {
      throw new HostpitalException("you need reconstructive surgery");
   }
}
 
public class PlasticHammer : IHammer
{
   
private int swingCount = 0;
 
   public void Swing()
   {
      swingCount++; //just tracking how many times you swing this
 
      if(swingCount>10) throw new TopOfHammerFallsOffException("you cant really use plastic hammers, buddy!");
   }
 
   public void Nail()
   {
      //plink
   }
 
   public void Break()
   {
      //tap
   }
 
   public void OwwThatReallyHurts()
   {
      throw new PansyException("it doesnt hurt that much. its just a plastic kids toy.");
   }
 
}
```

So now you have two hammers, and you know exactly how to user them. BUT.
They don't behave exactly the same. One is plastic and one is a nice,
solid yellow hammer. The plastic one falls apart if you swing it too
many times, and the metal leaves a mark if you hit your fingers. At this
point, its all obvious to me that this is good and useful, but I don't
know that everyone sees it that way. Since the goal is to explain it
simply and clearly, Let's look an example of how to use it.

<div>

 

</div>

``` {.csharpcode}
IHammer hammerInstance = new YellowHammer();

hammerInstance.Swing();
 
IHammer hammerInstance = new PlasticHammer();
hammerInstance.Swing();
```

<div>

\

</div>

You see in the above code you can do the same thing with both hammers.
It doesn't matter if one is yellow and one is plastic. Now let's get a
hammer without paying attention to what kind, and then use it.

``` {.csharpcode}
IHammer hammerInstance = MyHammerStore.GetNewHammer();
hammerInstance.Swing();
```

The magical MyHammerStore gave us a hammer. Since we know how to use a
hammer, we just use it. It just works. If all you care about it swinging
the hammer, then you don't care what it looks like; just that you can
swing it. This is an oversimplified example which hopefully makes the
principle easy to understand. How, why, and when to use it would take
more time to explain. To give you an idea of a real-world-like scenario,
imagine you are writing a school grading application. You will want to
save a grade for a student. Your code might look a little like this:

``` {.csharpcode}
IStudent student = MyClass.GetStudent(studentID);
student.SaveGrade("history class", "A+");
```

You don't care what the student class looks like, just that you can save
the grade on the student record. You don't care where or how its saved;
only that it is saved and you can look it up later. Simple. Easy to
understand and use. Done.

references

-   <http://msdn.microsoft.com/en-us/library/87d83y5b(VS.80).aspx> 
-   <http://msdn.microsoft.com/en-us/library/aa260635(VS.60).aspx>

<div>

 

</div>

<div>

-j

</div>
