
git is an island
----------------

Mon May 07, 2012

There is no perfect version control system, but I'm very happy with git
and github too. With subversion, you can use
[externals](http://svnbook.red-bean.com/en/1.0/ch07s03.html) to link to
external libraries. You can also control access rights on folders and
files. In git, you can't do either. OK, yes, there are submodules but
it's not the same. Git relies on the files system for more granular
control. You can control access level to the repo, but not subfolders.\
\
 *Git is an island. Code in git repositories stand alone in their own
sea; else they are more cumbersome to manage with multiple ships or
bridges between islands.*\
\
 Picture several different projects with different teams and external
contractors. If you leave all your code in the same repository, everyone
gets access to everything. I believe you should trust your devs (I am
one), but accidents do happen. Plus there is definitely a decrease in
git performance where there is significant size in a repo. So you split
your repositories. But what do you do with common code?\
\
 I'm dealing with that question now. Any reader suggestions are
welcomed, of course! To add more detail, our common code spans
platforms: Objective-C, Android, and .Net for Mac, Windows, Windows
Phone, iPhone, iPad, and Android. Here are 3 options and potential
drawbacks.\
\
 **Wild West Shoot-em-up Cowboy Style**\
 Keep the common code in a separate repository and let each project link
to it as necessary. Everyone gets to write to the common code as needed.
The risk here is version conflicts. Older projects may not build easily
after newer updated. You may break other apps while making changes. etc.
You can use a build server with CI to mitigate that risk; find your
failures early. It's still means having to deal with version conflicts
from time to time.\
\
 **Frozen Binary Popsicle of Doom**\
 Keep the code in a separate repo and treat it like an external product.
Dependent projects can only use compiled releases; just add the binary
to the project repo. This makes debug work a pain and updates are slower
due to logistics. However, you don't have a version problem; instead you
have a process problem. At least your apps don't randomly break and
older ones can be more easily maintained.\
\
 **Ugly Pragmatic Duck**\
 I hate to even write this, but there is also the copy-paste method.
Keep a base copy. Paste the common code into a project as necessary, and
merge back important changes to the master. This results in the smallest
risk for breaks and keeps productivity from getting bogged down by
process. However, it makes me feel dirty.\
\
 Ultimately, I care most about productivity and ease of development. The
Ugly Duck suggestion is really only something that should be done out of
necessity. If you are comfortable doing it, then you are doing it wrong.
I'm looking for alternatives that don't adversely impact productivity.
One thing I plan to do is boil down the common code to the few lines
that really are used by all the apps and doesn't change much. That can
be treated like a product.\
\
 These approaches are options in dealing with my specific situation and
use of git, but might be useful for other scenarios. They are based on
lessons learned from dealing with large and small projects with large
and small teams.
