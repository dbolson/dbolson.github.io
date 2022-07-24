---
title: "Introducing MetalDetectr"
date: 2011-05-14
categories:
  - "metaldetectr"
  - "ruby"
  - "rails"
---


It came from a [blog post](http://www.invisibleoranges.com/2010/07/upcoming-metal-releases-july-2010/). In July 2010, Cosmo Lee, creator of the metal blog [Invisible Oranges](http://www.invisibleoranges.com/) requested "a simple list" of upcoming releases from [metal-archives.com](http://metal-archives.com/). I thought that this would be the perfect opportunity to:

1. Create something of value for a community I belong to
1. Help someone I genuinely appreciated for his hard work within the same community
1. Create a Rails 3 application and use some new technologies
1. Show off a little code on Github
1. Have fun!

Thus, Metaldetectr. This application will search metal-archives.com, the canonical site for all things metal, for upcoming releases and create a list with basic information for each release. The method is to programmatically search through the current year, returning a paginated list of results. By accessing each page of this list, we generate another list of possible releases. Going through that list and only choosing those releases that are in the future, we come up with the final list as requested. However, there are a few interesting problems that arose through the development process.

The first is that metal-archives.com times out. A lot. Each step in the above process needs to be able to save the spot it is on when the site is no longer accessible. If we're searching through the paginated list of results and it fails, we need to note which page we're on and continue from there the next time. The same with the links to each album.

Another problem is that metal-archives.com has human input, so there are human errors. Not every album has a specified release date, some only a month, some albums are in different languages that aren't easy to parse, and some have crazy titles or band names and can be almost impossible to automatically figure out exactly what each one of those is supposed to be. There will always need to be a manual step to clean up some data, but the main functionality is there.

To get better data, we pass each album through Amazon's US site and a few European sites (.uk, .de, and .fr currently) to check if the release date is different. Since Amazon actually provides the albums instead of just listing them, their release dates take highest priority.

I hope this ends up providing some value to the metal community. I constantly read about the desire for a one-stop list of upcoming releases, and I would like MetalDetectr to be that list.

You can look at the code yourself on [GitHub](https://github.com/dbolson/metal-archives).
