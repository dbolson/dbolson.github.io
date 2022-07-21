---
title: "Book Review - The DevOps Handbook"
date: 2017-03-07
draft: true
categories:
  - "book review"
---

(Note that all references refer to the Kindle version)

What it isn't: Devops isn't continuous deployment or monitoring or an automated development environment.

What it is: Devops is empowerment of a team of individuals through greater communication.

That's the premise behind [*The DevOps Handbook*](http://shop.oreilly.com/product/9781942788003.do) by the authors of [*The Phoenix Project*](http://shop.oreilly.com/product/9780988262508.do) and [*Continuous Delivery*](https://www.amazon.com/Continuous-Delivery-Deployment-Automation-Addison-Wesley/dp/0321601912). We learn to optimize for productivity in the long-term and use that lens to build software. This encourages incorporating feedback into the entire software -- and developer -- stack. We get lots of before-and-after case studies to emphasize that, hey, these ideas really work!, and work becomes less a slog and more a joy.

### List of Tools and Techniques

Use this list is to maximize the responsibility of ~~our computer overlords~~ machines for repeatable tasks, leaving us humans to do the more interesting work. Reduce the surface area of potential brain farts and miscommunication with less manual steps and handoffs between team members.

* Use version control for code, configuration, and documentation (3533-3534).
* Create automated unit, integration, and smoke tests.
* Put monitoring and alerting in place for both application and infrastructure (3592-3593).
* Automate as much as possible (805-806).
* Integrate code as soon as possible (2733).

### Version Control

**Write everything down**. Business rules are everywhere: in code, in documents, and in our heads. It doesn't take much to lose something forever -- just a hard drive crash -- so we should make sure to back up these valuable artifacts. We're good at putting our code in version control, but we should go even further, ensuring that all our "documented standards and processes, which encompass the sum of our organizational learnings and knowledge" are backed up and versioned (5007-5009).

The immediate benefits are:

* Backups in case of data loss
* Bringing new hires up to speed as quickly as possible
* A known place to remember what's already happened to prevent making the same mistakes
* A way to show how to maintain consistency to minimize surprises and flame wars (*de gustibus non est disputandum* indeed)

### Testing

**Tests should form a pyramid where the base consists of fast unit tests, the middle a smaller amount of integration tests, and the top is a small amount of API and UI tests (2517)**. The higher the test in the pyramid, the slower and more expensive to run. When we find bugs we create another unit test as the fastest, most specific way to prevent a regression. Include a smoke test "to ensure the system is operating correctly and the configuration settings, including items such as database connection strings, are correct" (2986-2987).

Both lower-level unit tests and higher-level integration tests that exercise multiple dependencies and systems are the first line of defense to prevent errors. This is the fastest form of feedback and helps prevent errors from getting committed into the code base and provides proof that we've fixed any discovered bugs (5435-5436).

### Monitoring and Alerting

**Find out as soon as possible when something goes wrong**. This goes not only for errors but for business decisions and features. Complex systems are inherently impossible to predict, and we shouldn't attempt to prevent all mistakes (4698-4699). Instead focus efforts on mean time to recovery where we can detect a problem and quickly fix it.

**Ideal monitoring lets us know the where, when, and how of unexpected behavior (3582-3583)**. Exceptional behavior is the most obvious example, but go even further. Monitoring can keep track of various metrics and notify us when they deviate from their mean (3894-3895). More sophisticated monitoring means more complex code, so create libraries to make this as simple as possible so everyone is able to create as much monitoring as required (3646-3647).

But don't go overboard and monitor all the things. Instead, make sure we can take an action for every metric we monitor (3753-3754).

Now that we're able to monitor the entire system we're able to get a lot of long-term value. For example, any relevant application can "[r]ecord automatically, for auditing and compliance purposes, which commands were run on which machines when, who authorized it, and what the output was" (2984-2985). This is an example of an expensive requirement that is almost free since the functionality is baked into the system. Or think of the costs as a requirement for compliance and every other benefit is a value add. Either way it's a good thing.

### Automation

**[Laziness is a virtue](http://wiki.c2.com/?LazinessImpatienceHubris), so don't perform the same tasks again and again**. It's good to have a [checklist](https://en.wikipedia.org/wiki/The_Checklist_Manifesto) for each step in any process, but it's safer to codify the checklist. We'd still need to perform the checklist if something breaks at 3 AM, but a computer would be totally fine to do that. It's also easier to scale processes when not bound by the speed of fingers on a keyboard.

Manual steps take longer when more than one person has to perform them. Automation reduces the number of handoffs, each of which has the potential for miscommunication. These problems go away if code does the talking for us.

### Integrate code as soon as possible

**Code should be merged into the master branch as soon as possible**. Long-lived feature branches become more difficult to integrate over time, and it's too easy to accidentally merge the wrong code in when working through a large backlog of merge conflicts. "Without automated testing, continuous integration is the fastest way to get a big pile of junk that never compiles or runs correctly," so it's a good thing we have our suite of tests. It's also encouragement to write more tests (2733)!

We know the headache of reviewing a large chunk of code. It's easier to both create and read small commits so we get more eyes reading the code and faster feedback for our designs.

**Smaller, more frequent code commits make refactoring easier (2770)**. A refactoring doesn't need to be a massive effort but could be instead a series of small efforts. Making commits more often and more discrete requires more effort to keep the build passing and to review code more often. We're *optimizing team productivity over individual productivity* (2779).

### Minimize Process Time

These practices all **improve our *process time***, the time between when work starts to when it completes. *Lead time* starts when the work is requested (eg., we create a Jira ticket), but we discuss it only when the ticket is started. This is because we tend to reprioritize the ticket backlog, artificially increasing the lead time on most work (622). It would be an interesting process if we focus on lead time compared with process time. It would require more team understanding so anybody can work on any ticket, more aggressive feature triage so tickets don't continually get pushed down lower in the backlog, and maybe a healthy amount of hand-waving to get to a good definition of a work request (630-631).

It is tempting to try to work on more and more tickets to keep things moving, but that will only end up slowing things down. We end up working [concurrently but not in parallel](https://blog.golang.org/concurrency-is-not-parallelism), taking longer because of constant context-switching, and losing insight into how long each ticket took. If we're working on lots of tickets because we're constantly blocked, "far better action would be to find out what is causing the delay and help fix that problem" (747-746). Limiting our work in progress ensures we don't end up with a last mile problem and we deliver what we plan to deliver.

Optimizing for process time focuses us to deliver small, valuable pieces of software, similar to the idea of the [minimal viable product](https://en.wikipedia.org/wiki/Minimum_viable_product) from *[The Lean Startup](https://en.wikipedia.org/wiki/Lean_startup)*. We want to get software in production and in front of our users as soon as possible, get feedback from them, and make iterative changes in a quick feedback loop. It's also faster and easier to modify existing software than [building everything from scratch](https://en.wikipedia.org/wiki/Not_invented_here) or [big design up front](https://en.wikipedia.org/wiki/Big_Design_Up_Front): "After all, designing a system upfront for re-use is a common and expensive failure mode of many enterprise architectures" (2005-2007, 2116).

### Continuous Improvement

**Make it simpler to *improve* software**. It's our responsibility to constantly make improvements, without which software would actually degrade over time (1096-1097). It's not enough to implement something once and claim victory. We need to be aware of the system's *current* biggest constraint or weakness and work to improve it (814-815).

For example, say there is an outage in a service. After the crisis is over, figure out what would be needed to prevent the outage and then add that to our monitoring and automation tooling (3882-3883). Do this exercise *before* a system is in production and over time reevaluate the monitoring tools for their effectiveness.

Improving the monitoring may just entail decreasing the threshold of what should trigger an alert. Early on, it may be enough to have a high level understanding of the system, but over time we need to raise up more finely-grained errors to further our understanding of the system's constraints (4831-4833). We can't do this at first because we don't have knowledge of what failed and monitoring everything all the time creates too much noise. Once we level up our understanding of a part of the system and reduce the more egregious errors, we can move on to subtler and more interesting potential problem spaces. We make our system safer with each improvement (672-673).

This focus on improvement creates tension with feature development. While not strictly binary, we may find ourselves in situations where we deliberately create technical debt in order to deliver working software quickly. Much like debt, we can get away with this for some amount of time, but we need to eventually pay it down or face the consequences. Planning this into our work cycles, say 20%, "so that Dev and Ops can create lasting countermeasures to the problems we encounter in our daily work, we ensure that technical debt doesn't impede our ability to quickly and safely develop and operate our services in production" (1552-1554).

One last thought about improvement. It's not enough to value the daily work we do. We must value the *improvement* of the daily work even more (4793-4794).

### Collaboration

No single person can be responsible for the success of the team because they couldn't know everything about everything. A lack of communication is "'the core, chronic conflict' - when organizational measurements and incentives across different silos prevent the achievement of global, organizational goals" (290-291). This is a difficult problem, but an important one to work on. We can't always maintain the right level of communication, but we can put processes in place to encourage it.

Since we primarily write software, and all our software is in version control (remember?), we can leverage small, frequent commits to make it easier to understand what everyone is working on. Public conversations about specific code should be encouraged. The team gets a better understanding of the whole system, not just the individual pieces each member is working on (2793).

The entire organization should have a sense of what's going on with the current state of work (1597-1598). Everyone can't review all the code all the time, so we need other forms of documentation exposed at a higher level and generously shared. Shared code repositories, wikis, group emails, and presentations all give us an opportunity to turn our "local discoveries into global improvements" (680). "We" are a lot smarter than "I" if aligned in goals and understanding.

Another effective way to increase collaboration is to have cross-functional teams, including those with infrastructure skills. If we "embed the functional engineers and skills (eg, Ops, QA, Infosec) into each service team, or provide their capabilities to teams," there are more opportunities to reduce handoffs and cross train different skill sets (1732). Separating infrastructure into their own functional team creates a bottleneck that increases process time because all other teams will form a queue of work for the single infrastructure team. Automation can reduce this blockage, but we'll always rely somewhat on the expertise of the infrastructure team (1723-1724). A cross-functional team can work together to build more automation that helps in all the ways previously mentioned (1997-1999).

### Leadership

If we're lucky, our company would have top-down support for these devops practices and we'd work with them from day one. But a young, fast-moving company's early employees and founders may not be suited to the middle or late stages where these practices become essential. It can -- and should -- be up to everyone to advocate for devops. "Ask organizational leaders to support these efforts, or better yet, sponsor and lead these efforts yourself" (5954). If ideas are not embraced, find other ways to win hearts and minds to the cause. Automating one process or writing tests are the first steps to win support from our teammates as they will see the benefits to their daily work and add their effort. It's not a stretch to see that small, incremental steps lead to large-scale changes, first in our team, then in the company. Remember, leadership and management are not the same thing.

All these devops practices increase trust by increasing safety. Google's [study on team performance](https://www.nytimes.com/2016/02/28/magazine/what-google-learned-from-its-quest-to-build-the-perfect-team.html?_r=0) finds "psychological safety" to be most important for a high performance team. When we trust each other we feel comfortable enough to take risks, risks that could have a disproportionate payoff. Devops reinforces this safety through software by reducing the risks of everyday development. More safety means we can take more risks because the cost of failure drops. "[H]igh-performing DevOps organizations will fail and make mistakes more often. Not only is this okay, it's what organizations need!" (4863-4864).

Final thought: "Innovation is impossible without risk taking, and if you haven't managed to upset at least some people in management, you're probably not trying hard enough. Don't let your organization's immune system deter or distract you from your vision" (5955).

### Conclusion

We all want to work in an environment with minimal constraints, whether it's working with simple code, having monitoring to quickly find and fix errors, or using tools to keep moving fast to deliver value to our customers. The product comes from our labor, so we ultimately have control for how we deliver. Devops is about empowering a team through working together to achieve something greater than any individual.
