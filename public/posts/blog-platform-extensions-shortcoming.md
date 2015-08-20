
blog platform extensions - a shortcoming
----------------------------------------

Fri May 08, 2009

I've spent a little time recently on the custom theme for this blog
(Please [check it out](computeristsolutions.com/blog/?theme=CSInc) and
let me know what you think), and I've been coming to a conclusion I've
had before with software. Keep it self contained.

If you work on a team, it's very helpful if a new dev or a dev new to
the project can simply check out the source and go. No install this or
register that. Just open the solution in the IDE and compile & run.

It makes sense to me that the same should be true of a blog post. I
started using extensions for BlogEngine.Net for embedding Youtube
videos, and highlighting code syntax. The problem with this has become
evident with my efforts to make a custom theme. Check out this
[example](http://computeristsolutions.com/blog/post/Interfaces-For-Humans.aspx?theme=CSInc)
using the new theme. The font is wrong, but moreover the code formatting
is completely missing. This is because of the code formatter extension I
used for BlogEngine.Net. The new css combine with the problem the
extension has with the new layout render it useless.

Additionally, if I were to move to a different blog platform, my posts
would suffer the same problem because the extension presumably won't
exist on that platform. I'm reluctently concluding I should use Windows
Live Writer to compose posts. I like portability, and LiveWriter takes a
little bit of that away. But at least I could make my posts look right
even when I change themes.

So my question is, do I try to get the old code formatted right or just
skip it and move forward?

-j
