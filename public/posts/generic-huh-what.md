
generic huh what
----------------

Tue May 26, 2009

I actually didn’t expect this to compile, but what I did expect didn’t
compile. Since I was in the mood to attempt compilation instead of
looking it up on MSDN..

<div class="csharpcode">

``` {.alt}
   1:  public static T2 Find<T2, T>(DataConnection connection, List<IWhereCriteria> criteria)
```

       2:              where T2 : EntityCollectionBase<T>, new()

``` {.alt}
   3:              where T : EntityBase, new()
```

       4:          {

``` {.alt}
   5:              var collection = new T2();
```

       6:              collection.Initialize(criteria);

``` {.alt}
   7:   
```

       8:              return collection;

``` {.alt}
   9:          }
```

</div>

I’m not sure this is really kosher with the cool kids party, so feel
free to rip me on it. I’d rather learn now than pay for a mistake later.

At least this test now passes as a result:

<div class="csharpcode">

``` {.alt}
   1:          [Test]
```

       2:          public void can_fetch_collection_with_query()

``` {.alt}
   3:          {
```

       4:              var criteria = new List<IWhereCriteria>();

``` {.alt}
   5:              criteria.Add(new EqualToValueClause("applicationID", "CON001"));
```

       6:   

``` {.alt}
   7:              var results = TradingAccountCollection.Find<TradingAccountCollection, TradingAccount>(Connection, criteria);
```

       8:   

``` {.alt}
   9:              Expect(results, Is.Not.Null);
```

      10:              Expect(results.Count, Is.EqualTo(1));

``` {.alt}
  11:          }
```

</div>

-j
