
unit testing is for humans
--------------------------

Wed March 11, 2009

![](/blog/image.axd?picture=2009%2f3%2fmonkey-coder.jpg)

*Audience note: this is written for non-programmers or beginning
programmers. Don't skip it though, it lays out reasons why unit testing
is good. Should also be witty and entertaining. I've been practicing
this at the Improv. ;)*\

When I was a kid, I had one of those AM radio kits that you build
yourself. My dad told me a little about electronics, and with the
instructions I tried to build it. Several times. I would get to a point
where I thought it was done, and put it all together. Then I'd find
something didn't work or wasn't right. So I would have to take it apart
again and try to figure it out. After doing this a few times, I realized
it was easier to check the soldering, wires, and knobs as I went along
before putting it all together in the cheap case. I got it partly
working with a nice, clear static sound before I lost interest and used
the parts for something else. It was a good lesson though.

It's a bigger pain to find out later something wasn't working than to
take the time right away to check it. In software development, we call
this Unit Testing. 

**What is this Unit Testing you speak of?**

[Unit Testing](http://en.wikipedia.org/wiki/Unit_testing) is the
practice of breaking software into the smallest logical parts and
testing that each small part does what it is supposed to do. This also
has the effect of driving you to build pieces that you can test and
maintain more easily. Testing your code has some very specific benefits:
you know it works. The process of doing this also benefits you by
creating a path toward a good application where all those small parts
work together well.\

**Why would I want to do that?**

helps with design The resulting design (how things fit together) is
naturally easier to maintain and fix. Like water flowing down hill, you
can more easily tell where its going and where it came from. This makes
following it a lot easier. It also makes changing it a lot easier.\

helps solve problems  Sometimes you get stuck on how to build a certain
piece. You can write the unit test first, which I recommend anyway, and
then start writing code until the test passes. In effect, you are first
defining what you want to happen. Then trying to make that happen, and
you are done when the test passes.\

makes maintenance easier If you have a bunch of tests and discover a bug
then you can more easily find and fix the bug. If there is a failing
test where the bug should be, then start by fixing the test. If the bug
is still there, you write a test that will pass when the bug no longer
happens. Now make the test pass. In doing this, you are isolating the
part(s) where the bug happens which makes it easier to find. When its
easy to find, its much easier to fix.\

easier for other dev's to figure out Imagine you just started trying to
use that radio I kinda built when I was a kid. You have the manual and a
not really working radio. If I had tests to go along with each part, you
could check each test to see what it does and make sure its right. Then
fix the one (I'm sure it was only one) that wasn't working. Smaller
pieces are easier to understand, which is important even if you are an
expert with the language its built with. Maybe unsurprising is that it's
often your own code. It's easy to forget what you did a few weeks,
months, or years ago. Having those tests help.\

**Why doesn't everyone do that?**

never heard of it/don't know about it  This is pretty obvious. You're a
new developer who is either self-taught or wasn't taught unit testing in
school. You learn, you believe, you test the daylights out of everything
forevermore.\

takes too much time It's true, sorta. It takes time to add unit tests
and it can sometimes feel like its too much time. It will save you time
when it comes to fixing bugs or adding features. You will have less
bugs, and changing things takes less time because you know immediately
if you broke anything.\

don't see the point Hopefully you do after reading this far. But just in
case, remember the AM radio.

my code is good enough without it It's true some of you and myself have
coded without unit testing, and did just fine thank you very much. I
remember those days: 80 hour weeks to fix the last bugs before releasing
a product. Sleepless nights fixing a broken deployment. Yeah, it was
great. But I don't much have to do that anymore. That's partly because
of experience, and partly because testing my code as I go helps me find
problems sooner.\

other people keep deleting my tests anyway OK, I hadn't really heard
this one before today. I have some guesses as to what may have happened,
but it doesn't really matter. The problem is the team wasn't supporting
the unit testing practice. It's hard or impossible to move forward with
unit testing in a situation like that. The fix is to have them all read
this article so I can tell them how right you are. hehe. Really, discuss
why it helps. If this article helps explain that then great because
that's my point. \

my app is too hard to test I have a lot of sympathy for this; a big part
of my day job is in this situation. The closest we could come is called
"integration testing" which is basically like unit testing except we
aren't breaking it down into smaller parts to test. You don't get the
benefits of real unit tests, but it's better than nothing. Work unit
testing in as much as you can and build team support. After that, you
have to figure out what's next. Sometimes, it's not even up to you.\

**Things for your utility belt**

[MbUnit](http://mbunit.com/), [nUnit](http://nunit.org/),
[xUnit](http://www.codeplex.com/xunit) are all .Net testing frameworks.
They include pretty application to run your tests and show you the
results; typically green for pass and red for fail. Everything you'd
expect after taking Driver's Ed. class.
[testdriven.net](http://testdriven.net/) is a utility which helps make
running your test easier. These two powers combine to give you ~~nearly
unlimited power~~ less work in building and checking your tests. 

These are a few unit testing tools for the .Net developer. There are so
many tools to help make it easier to test your code. It's really a life
lesson; check your results instead of assuming the outcome is what you
expected. It avoids a lot of problems later on even if its a little
trouble right now.\

**Blah blah blah..**\

To be clear, I am not a zealot (read with Richard Nixon voice). In fact,
I didn't code with unit tests when I decided to learn Ruby on Rails
about 2 years ago. I would make a rails app and play around then start
over. It didn't really matter because it was just throw away code and I
only wanted to see how it worked. Until I stumbled on an idea that was
actually useful to me. I've slowly worked on it for the last year since
I don't have a lot of time for it; and now its about 90% functional. But
no unit tests, which is horrible because rails is big on testing. I may
have actually been able to complete it by now if I had unit tests, even
if I didn't put any more time into it. Now I have to go back and add
them because I know it makes a difference.\

Time to get back to work. I'm at a point where I need to write some unit
test, and I'm excited.

-j
