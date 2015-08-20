
authentication versus authorization
-----------------------------------

Mon March 23, 2009

![](/blog/image.axd?picture=2009%2f3%2flock3.png)**Authentication** is
the verification of who you are.\
**Authorization** (aka permissions) is the definition of what you can
do.\
 \
Itis a subtle difference with a **giant** distinction and impact. I've
seen alot of time and effort put into verifying who a user is, and that
is agood thing. Too often, defining and checking what the user can do
isoverlooked or not thought out very well. One of the teams for a
projectI'm working on is currently collecting feedback on a
uniformauthorization proposal. A good amount of thought was put into how
to doit and provide a good user experience. The first thing I noticed
aboutthe proposal was something that wasn't in it.\
 \
My childhood wasfull of danger, adventure, and romance. Young Indiana
Jones storieswere based on my life. OK, not really. But my friends and I
did buildforts in the woods near our homes. One of them even had a
secretentrance. Sure, anyone could have forced their way in and dealt
withthe poison ivy consequences later, but the entrance was definitely
thebest way to enter. The one thing about it was once you were in,
youcould do anything you wanted in there. Tear it apart, leave
kindmessages, stuff like that. Once you found the door (authenticated),
youhad the ability (authorization) to do whatever you wanted. That was
notgood security, but we were just kids.\
 \
In many applications, youneed to restrict what a user can do with the
application. Letting theuser do anything they want once they log in is
not good security. Thisincludes hiding a url from a menu, and hoping
they don't guess itthemselves. The application needs to check if they
are allowed tobrowse to "/admin".\
 \
What was missing from the proposal Imentioned above is definition of how
authorization is checked. In thiscase, it's outside the scope of that
team. But it reminded me how oftenthat is overlooked. You need to check
if the user is allowed to deletethis record, or send that invoice, etc.
Another question is "where doyou check?" It depends on the constraints
of the project.\
\
A goodrule of thumb is "trust but verify". This has led me to the
opinion ofchecking authority twice in a lot of cases, and auditing every
action.Honestly, I don't double check every time. There are a lot of
caseswhere it doesn't apply. For single user apps, that single user
canperform any action the app provides (unless there is some core
adminfeature set). Perhaps your app isn't multi-tiered, so dual
tierchecks aren't necessary. If there's only one or two layers, then
youdon't need to check authority twice.\
\
Another thing that isworthwhile is auditing. That is to record who
attempted to perform whataction and whether or not it was allowed. This
gives you a securitytrail to identify security related bugs or threats.
It's related tologging, and is a natural extension to your logging
facility which youshould be using anyway\
\
Perhaps I should lay out how and when toapply the dual check rule, but
that's not really the point of thispost. The point is this: Don't forget
that authentication is not thesame as authorization and you should
carefully consider both.Otherwise, you could end up with a wrecked fort
with nasty littlemessages written in red paint on the rocks from
taunting foes.\
/just sayin'\
//if I *\*ever\** find out who that was...\
\
-j\
 \
linkage: <http://www.duke.edu/~rob/kerberos/authvauth.html>
