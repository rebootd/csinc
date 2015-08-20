
wicked cool code – dynamic coming to .net 4.0
---------------------------------------------

Wed May 20, 2009

  So far the VS 2010 and .Net 4 fanfare hasn’t resonated with me. I’m
sure it will be good and all, but I’m far to busy to get swallowed up in
hype. Then I read
[this](http://www.hanselman.com/blog/C4AndTheDynamicKeywordWhirlwindTourAroundNET4AndVisualStudio2010Beta1.aspx)
post from ScottHa on the dynamic keyword. It looks like some of the
goodness of dynamic languages is sneaking into .Net. This is good, and
looks like this:

<div class="csharpcode">

``` {.alt}
   1:  dynamic calc = GetCalculator();
```

       2:  int sum = calc.Add(10, 20);

</div>

 

  Which also means I’m going to need to get some updated syntax
highlighting for code samples. It doesn’t recognize dynamic as a
keyword, of course.

  Also, it’s going to be even more important to use good Unit Testing if
you write code with this. Intellisense won’t cut it because the compiler
doesn’t know the object contact/interface until runtime. Absolutely use
TDD for this. Also, it’s cool that ScottHa is using a python file in his
example.

PS: I know about the DLR, etc. I tend to think C\# when I say .Net.

-j
