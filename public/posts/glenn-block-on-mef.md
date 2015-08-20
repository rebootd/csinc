
glenn block on mef
------------------

Tue May 26, 2009

I have some interesting in MEF for future projects. We are already using
Unity for a dash of composite in on project, but there is so much more
potential there than just that. It so happens that I’m as a Microsoft
Conference today with [Scott Guthrie](http://weblogs.asp.net/scottgu/),
[Jaime Rodriguez](http://blogs.msdn.com/jaimer/default.aspx), and [Glenn
Block](http://blogs.msdn.com/gblock/) giving presentations.

I’m gonna live-blog this as he goes, so you may need to update this. Not
time-stamping the updates though.

Fragments & points from Glenn’s talk:

-   Phoenix is hot
-   worked on Prism, Unity, and MEF (currently) \[also working on View
    Model Infrastructure\]
-   not a comedian, not magician, not rock start.. just a guy who cares
    about maintainable software
-   [Extensibility](http://en.wikipedia.org/wiki/Extensibility)
-   [Open-Closed
    Principle](http://en.wikipedia.org/wiki/Open/closed_principle) –
    open to be extended but closed to modifications
-   Compose – composed, modular apps are a good thing, glossed over this
    so far..
-   Where MEF is being used – Visual Studio Extensibility.. sample from
    VS2010 (oh why wont you install on win7 in vm fusion!)
-   Really interesting demo in vs2010 popping up a regex dialog
    from intellisense. create new regex or use saved ones. way cool.
-   Very cool demo of a came using MEF. Just opened a new dll while it
    was running to get a while new set of shapes. No reset.
-   MEF basics
    -   Export it
    -   Import it
    -   Compose it
-   MEF is not type based. huh, i’m curious what he means. “not based on
    any types, but uses types for convenience” –glenn block
-   Parts (components), Catalog (container - library of
    available parts). sounds like type registration to me. still not
    sure how it’s not type based.
-   Compose it – type catalog, assembly catalog, directory catalog,
    aggregating catalog. this is starting to sound familiar: find and
    ways to load modules.
-   showing how to create and register a rule. audience sample rule:
    IncrementByOneRule
-   switching from manually registering types to AssemblyCatalog to find
    the types (rules in his sample) defined in his demo.
-   Intersting, for demo which was only taking one rule, switched to
    \[ImportMany\] IEnumerable&lt;IRule&gt; {get;set} to accept a
    collection of rules instead of a single rule.
-   But they are getting rid of \[Export\] in future release so the demo
    code is nearly obsolete. otherwise very cool
-   \[distracted by
    [Ayende](http://ayende.com/Blog/archive/2009/05/26/challenge-find-the-bug-again.aspx)
    blog post. sry\]
-   Power of being declaritive. conventions, export. MEF just cares
    about contracts.
-   lifetime management with MEF container
    ([related](http://hammett.castleproject.org/?p=339),
    [another](http://blogs.msdn.com/gblock/archive/2009/05/14/customizing-container-behavior-part-2-of-n-defaults.aspx))
-   now showing a catalog form Ruby code. very very interesting. now MEF
    with XAML? impressive.
-   I like how MEF is finding the click action for a button in the demo.
    not sure what I would do with my usual design as a result.

That is all. Nice intro and overview of MEF.

-j
