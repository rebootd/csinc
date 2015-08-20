
rails bug with javascript assets
--------------------------------

Wed March 07, 2012

I ran into [this
bug](http://stackoverflow.com/questions/8356251/rails-3-1-assets-strange-serving-in-development)
this week.

> "I've got a problem with Rails 3.1 assets pipeline. Assets are
> included twice in development..."

\
\

My solution was to use these settings in development.rb:

-   config.assets.compress = false
-   config.assets.debug = false

It doesn't list each compiled javascript asset, but at least it's not
including the javascript twice. Hopefully this will be fixed soon.
