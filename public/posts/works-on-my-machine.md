
works on my machine
-------------------

Mon October 12, 2009

![](http://www3.telus.net/conrad/images4/churning_butter.gif)Are you
really making your builds with Visual Studio? Please tell me you aren’t
using VS in the command line to compile your application. You do realize
there are better ways, don’t you?

Some suggestions:

-   **Use a command line tool such as**
    [**MSBuild**](http://msdn.microsoft.com/en-us/library/0k6kkbsd.aspx)
    **or** [**nant**](http://nant.sourceforge.net/) **for long running
    builds** – VS takes a while to compile a long running build because
    of the visual feed back it provides. It does a fair job and all, but
    it’s not going to beat running msbuild or nant. MSBuild is the
    easier of the two to pick up because it knows how to use the
    solution file as the build script. With nant, you have to write
    your own. For both, you will need a separate script to do things
    like deploy files or run unit tests.
-   **Use** [**TeamCity**](http://www.jetbrains.com/teamcity/) **or**
    [**CruiseControl.net**](http://confluence.public.thoughtworks.org/display/CCNET/Welcome+to+CruiseControl.NET)
    **to automate your build process** – CruiseControl and TeamCity will
    help you automate your builds. CCNet requires build scripts; TC
    does not.
-   **Automatically pull updated source code** – have your build process
    pull updated source code each time. This way you can take some of
    the pain out of the build process and find out if the build works.
-   **Run your automated builds on a separate machine or different
    folder** – Meaning, don’t run your automated build in the same place
    you work on your code. This avoids the “works on my
    machine” problem.
-   **Use known tools** – Sure you can make your own build server, but
    should you? Look for known tools which you can extend or configure
    to meet your needs. Building your own for your special circumstance
    will likely bite you later when that special circumstance changes;
    or you just outgrow it.

 

Building your application doesn’t have to be painful. It doesn’t have to
result in moans and growns when you find things are missing. You can
automate it with moderate or little effort, and then let it run often.
You will get a better idea of how your work is going and find out more
quickly. This is basically what [Continuous
Integration](http://martinfowler.com/articles/continuousIntegration.html)
is about. It’s not hard, and you will see the benefit quickly.
