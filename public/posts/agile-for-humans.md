
agile for humans
----------------

Thu March 26, 2009

<div
id="scid:5737277B-5D6D-4f48-ABFC-DD9C333F4C5D:e2350b78-4c61-43cc-b441-4e2cbd70f0b9"
class="wlWriterEditableSmartContent"
style="padding-right: 0px; display: inline; padding-left: 0px; float: none; padding-bottom: 0px; margin: 0px; padding-top: 0px">

<div>

</div>

</div>

*"Be Water my friend"* - Bruce Lee 

Wow! Go ahead and watch that again; I'll wait right here.\
 \
So you might be asking "Why Bruce Lee", and I would answer "because he's
accessible/understandable." Also, the quote is somewhat relevant to the
topic, which is how to develop software. By that I mean what process you
can use to guide a project to completion. Sure you could go all cowboy
and make things up as you go, but that doesn't generally work well. I
know; I've done it. It is important to have some sort of process to
drive things along and check your progress. That's really important if
you are working on a schedule.\
 \
In this "For Humans" series, I'm trying to gently introduce software
development in non or less technical terms. This is a bit tougher topic,
but I will do my best.\
 \
There are lots of ways to do lots of things, or as they say where I grew
up "there's more than one way to skin a cat." Never did understand why
you'd want to skin a cat. You can't sell the pelt, and it might be
illegal. Thankfully software development is definitely not illegal.
Though some people say managing developers is like herding cats,
skinning developers is DEFINITELY illegal. And really creepy. One
traditional approach to managing software development is called
[Waterfall](http://en.wikipedia.org/wiki/Waterfall_model). It is strict
although you can implement it in lots of variations; and the basic idea
is do all the design up front and then don't veer off course.\
 \
Waterfall takes a lot of ideas from engineering disciplines, but
software development really doesn't fit well into that model. Things
change, flaws are discovered, and assumptions turn out to be wrong. To
address this, a set of principles has been identified and named
"[Agile](http://en.wikipedia.org/wiki/Agile_software_development)." No
process is perfect, but Agile is rather good at adaptation, and can also
be implemented however makes sense for your business or project. This is
the "be like water" moment.. please pause and let the enlightenment flow
from my text to your brain. Software development requires adaptation,
and Agile (or [XP](http://en.wikipedia.org/wiki/Extreme_Programming) or
[Scrum](http://en.wikipedia.org/wiki/Scrum_(development)))) is a process
for managing changes in development.\
 \
It's a little like learning English. There are rules, but there are also
exceptions. "'I' before 'E' except after 'C' and when sound like 'A' as
in neighbor and weigh ..or in seize, or weird, or.." It comes down to
knowing the principles and practising. In truth, I don't practise all
the rules all the time. I'm not an elitist, but a pragmatist. What
happens in practising is you naturally get better (obviously) and you
develop better intuition about how to apply your practices.\
 \
Agile core principles can be found
[here](http://agilemanifesto.org/principles.html), and core
values/manifesto found [here](http://agilemanifesto.org/). I'll leave it
to you to read those, because what's more interesting are the
practices.\
 \
**Test Driven Development**
([link](http://en.wikipedia.org/wiki/Test_Driven_Development))\
This is where I do get more serious, and have already blogged on it some
here(http://computeristsolutions.com/blog/post/Unit-Testing-is-for-humans.aspx).
There are reasons why I'm passionate about this. For one, it really
works. By writing tests first, you are really setting expectations of
how your code should behave. After that, there's a natural evolution of
your code into something that works, has fewer bugs, and becomes a good
design. Please go back and read my earlier
[article](/blog/post/Unit-Testing-is-for-humans.aspx) for more info.\
 \
**Behavior Driven Development**
([link](http://en.wikipedia.org/wiki/Behavior_Driven_Development))\
From test driven development, this was a natural evolution. It's
focusing on the expectation part of writing tests first; only it strives
to express the intent more clearly using conventions. I'm not really
sharp on the distinctions, so I recommend you read more on it yourself.
[Jean-Paul Boodhoo](http://blog.jpboodhoo.com/) blogs often about
[it](http://blog.jpboodhoo.com/CategoryView,category,BDD.aspx), and is a
good resource.\
 \
**Continuous Integration**
([link](http://en.wikipedia.org/wiki/Continuous_Integration))\
Here's another activity that will really help move your development
along. Even if you are the only developer, setting up an automated build
of your code will help you catch problems sooner. Think of it like
driving. You wouldn't want to drive down the road with your eyes closed
and only open your eyes every so often to get a peek of what is going.
You want your eyes open all the time so you know what's going on around
you, which is what continuous integration does for you. Kent Beck's XP
books talk about getting early feedback and this is part of how you
achieve that.\
 \
**Pair Programming**
([link](http://en.wikipedia.org/wiki/Pair_Programming))\
OK, so here is where I can't pretend to be an expert or anything like
it. I don't do pair programming. I'm not saying I wouldn't or you
shouldn't; just that I am not in the situation of being able to. Many of
those that have swear by it. Even [Ayende](http://www.ayende.com/blog)
(everyone should read his blog) pairs up. I've certainly seen the
benefit of code review. So I guess I see how this would basically be
continuous code review. I do recommend considering it, especially if you
are just getting into coding and can pair with someone you can learn
from.\
 \
**Agile Planning** ([link](http://en.wikipedia.org/wiki/User_story))\
This can actually be fun. You divide up your project into small,
reasonable tasks. You can use these tasks for estimates. Pick some to
get done each week. Let the devs pick which tasks to do. Many agile
articles suggest actually have real memo cards with each task on a board
or basket to choose from. It certainly helps avoid overlap between
developers. You can use the task card to plan and estimate the project
to. Just estimate each task, and get help to arrange them in order of
which must be done first with the remaining filled in. Simply put,
breaking things down to their smallest logical part makes planning,
estimating, assigning, and adjusting all easier. It's almost zen-like
how it will fall together.\
 \
**Short Meetings**\
This is more of a
[Scrum](http://en.wikipedia.org/wiki/Scrum_(development)) attribute than
specifically an Agile attribute, but it's one I find highly useful. Keep
the meetings short. Try meeting everyday for 10-15 minutes just to share
status. Stand up the whole time to discourage long conversation. If
something needs discussed longer, schedule a meeting or casually meet
outside of the short meeting; and include the least number of people
needed. Less time meeting is more time producing.\
 \
**Conclusion**\
Hopefully this introduction to Agile wasn't too boring. It's tough to
cover this in short and simple terms. My usual stories would take up too
much extra space, and I couldn't write an in-depth article on Agile in
my few spare minutes over a few nights. To learn more, read online
articles and pick up [Ken Beck's XP
book](http://www.amazon.com/Extreme-Programming-Explained-Embrace-Change/dp/0321278658/ref=pd_bxgy_b_img_a).
I recommend learning Agile if you are just starting in development, or
already have but don't yet know it. You should also learn about
Waterfall so you understand traditional software life cycles.\
 \
Those in the know, will probably notice that I mixed information about
Agile, Extreme Programming, and Scrum. It's all related, and I don't
have the time or space to cover it all in detail. I hope this suffices
as a reasonable introduction. If I could beat one thing into your head
with a really big, shiny hammer which has a red, non-slip handle, it
would be that you should follow some process. I've been down the cowboy
coder path, and the waterfall path. I recommend using Agile/XP/Scrum
practises in most cases.\
 \
Additional resources:\
A good read in this area is [Kent Beck's Extreme Programming Explained
2](http://www.amazon.com/Extreme-Programming-Explained-Embrace-Change/dp/0321278658/ref=pd_bxgy_b_img_a).
Yes it's geared to a technical audience, but I think its readable for
everyone.\
A little Scrum intro video:
<http://www.youtube.com/watch?v=Q5k7a9YEoUI&feature=related>\
Extreme Programming: <http://en.wikipedia.org/wiki/Extreme_Programming>\
XP Practises <http://ootips.org/xp.html>\
Kent Beck on XP <http://www.extremeprogramming.org/>\
Ron Jeffries on XP <http://www.xprogramming.com/xpmag/whatisxp.htm>

-j
