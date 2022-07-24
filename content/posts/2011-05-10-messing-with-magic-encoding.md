---
title: "Messing With Magic Encoding"
date: 2011-05-10
categories:
  - "encoding"
  - "ruby"
---

There's some irony in how difficult Ruby can be with different character sets considering it was written by someone who doesn't speak English natively. I don't want to get political here, so I'm just going to mention some encoding strangeness.

Ruby 1.9 is much improved over Ruby 1.8, but I don't know that [defaulting to US-ASCII encoding](http://stackoverflow.com/questions/3291017/how-can-i-avoid-putting-the-magic-encoding-comment-on-top-of-every-utf-8-file-in) is a good one. I suppose so, if one wishes to be more explicit with some sort of default. This became an issue when I wrote a screen-scraping library that read a site with foreign (to me) characters. With the default encoding, the program would stop on those characters, returning early without reading the entire word. It took a long time to track down because the site I was scrapping would time-out a lot, so I assumed that that was the issue. But when it would seemingly time-out on the same pages each time, I had to look into the problem more.

After finding the problem, I needed a solution. [This post](http://blog.grayproductions.net/articles/ruby_19s_three_default_encodings) gave me the direction to fix it, so I was able to check the following for a result:

```ruby
page = Mechanize.new('/url')
page.encoding = 'iso-8859-1'
page.search(...)
```

Setting the encoding to iso-8859-1 let me get the foreign characters I needed. In the tests, I put the following magic comment at the top of the file:

```ruby
# encoding: utf-8
```

Now I can test with an HTML fixture containing foreign characters. Crazy stuff, but it works.
