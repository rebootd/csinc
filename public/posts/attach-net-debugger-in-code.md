
attach .net debugger in code
----------------------------

Fri November 13, 2009

I’m specifically choosing the title for search engine results because I
can never find this information when I want it.  For some reason not
many .Net devs seem to know about it, and I always forget the code
because I don’t often need it.

<div class="csharpcode">

``` {.alt}
   1:  System.Diagnostics.Debugger.Launch()
```

</div>

 

This is very useful for debugging services, installers, and other
situations when you can’t just start with the debugger.
