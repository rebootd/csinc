
var – a warning
---------------

Mon June 22, 2009

I try to learn and reflect on my code style regularly. I occurred to me
the other day that my use of the var keyword could be better.  I had
started using var for every declaration in my c\# code. It looked like
this:

<div class="csharpcode">

``` {.alt}
   1:  var elementList = new List<FieldElement>();
```

       2:   

``` {.alt}
   3:  var resourceKind = (new T()).ResourceKind;
```

       4:  var schema = GetSchema(connection, resourceKind);

``` {.alt}
   5:   
```

       6:  var complexTypeName = GetSingularTypeName(resourceKind);

</div>

That’s great and all but it’s not immediately clear what schema and
complexTypeName variables are just by reading the code. I suggest using
the specific type in declaration of those variables like this:

<div class="csharpcode">

``` {.alt}
   1:  var elementList = new List<FieldElement>();
```

       2:   

``` {.alt}
   3:  var resourceKind = (new T()).ResourceKind;
```

       4:  XmlSchema schema = GetSchema(connection, resourceKind);

``` {.alt}
   5:   
```

       6:  string complexTypeName = GetSingularTypeName(resourceKind);

</div>

That’s better.  As a matter of personal opinion, you might want to
change the resourceKind declaration to this:

<div class="csharpcode">

``` {.alt}
   1:  string resourceKind = (new T()).ResourceKind;
```

</div>

 

The T defined in this case so I know what type it is, but it might not
be obvious to other people. Clarity is important for maintaining code.
Don’t assume that because you know what you were thinking now that you
will remember later. One oft repeated rule is to code as if the next guy
to work with your code is a homicidal axe murder who knows where you
live.
