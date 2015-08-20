
tdd and design observation
--------------------------

Thu April 02, 2009

![](/blog/image.axd?picture=2009%2f4%2fcaptainobviouslb4.jpg)This isn't
part of the 'for humans" series; it's just an observation from my
current work. I'm in the middle of some brownfield development
(enhancing or adding to a program that already exists and is actively
developed). So the application I'm working with doesn't really support
unit testing. All the pieces are too tightly tied together, but we are
working on it as we go. For example, I just added some code that looks a
little like this:

\[code:c\#\]

public interface IState\
 {\
   bool IsConfigured {get;}\
   void ClearState();\
 }

\[/code\]

 Using this interface I can test some of the code that uses it. It's
nice because my unit tests tell me if it works and I don't have to run
the whole app. Plus I get the benefit of being able to work on whatever
part I want to: middle layer, UI, data layer. It's nice to be free.

However, I have to write lots of code that goes right into the rest of
the app that I can't test easily. Something like this:

\[code:c\#\]

public class Import\
 {\
   void ImportStuff ()\
   {\
     IState state = GetTheCurrentState();\
     if(state.IsConfigured) RunImport();\
   }\
 }

\[/code\]

With that I have to start the whole app and test it manually, which also
means I have to build some rudimentary UI to execute that code. This is
called top-down design when you are basically writing UI and top level
features before writing middle layer, business rules, and data layer
code. It doesn't lend itself to a good design and maintainability. For
whatever reason, it just occured to me that developing that way tends to
force you into it, which also leads to more pain points in the
application.

Test Driven Design definitely has the advantage here. More Freedom, more
fun, better code. Trust me.

-j
