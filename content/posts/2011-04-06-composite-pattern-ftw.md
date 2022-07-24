---
title: "Composite Pattern FTW"
date: 2011-04-06
categories:
  - "design patterns"
---

A [post](http://www.paulgraham.com/taste.html) by Paul Graham I recently found resonated with what I've been doing at work recently. In his post, "Taste for Makers," PG posits that beauty is not wholly subjective and that good design is beautiful. Among others, good design:

* is simple
* solves the right problem
* is suggestive
* looks easy
* uses symmetry
* is redesign
* can copy
* is often quite strange
* happens in chunks

I'd like to focus on a few of these descriptions and use an example I've recently done.

In his fantastic book, *[Design Patterns in Ruby](http://www.designpatternsinruby.com/)*, [Russ Olsen](http://blog.russolsen.com/) describes one tenant of the [GOF](http://c2.com/cgi/wiki?GangOfFour) book to “prefer composition over inheritance.” Inheritance creates tighter coupling between classes, since the children of the base class need to know about the internals of the base, even though the coupling is very specific to the implementation and (should be) well understood. [Composition](http://en.wikipedia.org/wiki/Composite_pattern), however, changes the relationship between objects. An object no longer is another type of object but has the functionality of another object ([is-a vs. has-a](http://en.wikipedia.org/wiki/Has-a)). This relationship increases the encapsulation of the composite object by providing an interface to the composed object instead of exposing the underlying details of a base class.

### Slices *and* Dices!

Now I know there is a tendency to think of design patterns as a [silver bullet](http://en.wikipedia.org/wiki/No_Silver_Bullet), but bear with me. The situation is fine when the inheritance tree is simple and the functionality basic. The complexity grows as the tree grows and as more functionality is required. Soon, you're not quite sure if it should inherit `Foo` which inherits from `Bar`, or if you should just inherit from Baz way up near the base. You'll have to dig into the classes to find out which one is closest to what you want and hope it makes the most sense to place the new class wherever you end up placing it. However, using the Composite Pattern gives us much more flexibility for creating new classes and giving them abilities.

### An Example

There is a system that asks users different types of questions. One type asks when an event will happen (`DateQuestion`), one type asks the numerical results of an event (`NumberQuestion`), and one asks which event will happen given a set of choices (`ChoiceQuestion`). We have a base `Question` that each inherits from, and since dates can be represented as numbers, `DateQuestion` will inherit from `NumberQuestion`. These questions allow answers, comments, access control lists, and have a specific work flow (create, activate, suspend, close, etc.).

Later on, the system needs to support a few more types of questions: a numeric range (`NumberRangeQuestion`), a date range (`DateRangeQuestion`), a yes/no-only (`YesNoQuestion`)... you get the point. We need to figure out where these new types go in the inheritance tree – whether one is a child of a `DateQuestion` (itself a child of `NumberQuestion`), or if it's just a child of `NumberQuestion`, or maybe it's its own type and only inherits from the base `Question` type. We start to bump into complexity issues, that is, unnecessary complexity.

### I'll Take a Little of This...

Let's approach this problem from a different angle. Given our original `Question` types, we can make them all inherit from a base `Question` class and then give them abilities as needed. So now our classes look like this:

```ruby
class Question
  include Commentable
  include AccessListControllable
  include Workflowable
end

class NumberQuestion < Question
  include Numerical
end

class DateQuestion < Question
  include Numerical
  include Dateable
end

class ChoiceQuestion < Question
  include Choiceable
end
```

`NumberQuestion` and `DateQuestion` are numerical, that is, they have whatever functionality they need to do what numerical objects need to do. The `DateQuestion` is also dateable, so it has additional properties needed for a dateable object, while `NumberQuestion`, not needing them, doesn't have those abilities. So when we need additional `Question` types, we can choose which abilities they need. A `DateRangeQuestion`? It's dateable, numerical, and it's got its own class-specific functionality as well.

There are some trade-offs. Some modules may not have all the functionality an object needs, and there is a potential for similar code needed to provide slightly different abilities. There can also be unneeded functionality in a module that an object will never need. These problems aren't specific to the Composite design pattern, as they can occur with regular inheritance as well.

### Some Clarity

We've refactored our code to use a design pattern to organize our code a little better to make our application more maintainable and extendable, both good things, and the process was relatively painless. Since the functionality never changed, just the organization, if the [tests](http://smartic.us/2008/08/15/tatft-i-feel-a-revolution-coming-on/) pass, we can feel confident that our models still work how we want.
