# Web Frontend
I have come to conclude that React won. There is only one metric to uphold
this belief: job posts. Everyone is asking for React so, React it is.

On the other hand, I've come to experience saner alternatives in my time of this
bizarre field. Namely Elm. It is so much better for refactoring, designing and
doing basically everything else frontend. But I've come accept that Elm is not
going to be a replacement for my frontend choices. I'll list some of my needs
below:


## SSR is unsolved.
One of the problems that React solved by delegating it to framework implementers
is FCP (first contentful paint). This, by proxy also solves the SEO problems with it.
Elm (although having [elm-pages](https://elm-pages.com)) doesn't seem to have any
strides towards SSR.

This is a deal breaker because it hurts the percieved-performance of Elm
applications compared to their React implementations. What we need is Next.js
but for Elm. [elm-pages](https://elm-pages.com) may be the solution to this,
but I haven't tried it to verify yet. As for why I haven't done so yet,
hear me out:


## JavaScript (and by extension TypeScript) is Everywhere
This may not come as a surprise, but you _can_ make basically anything with
JS now. And the platform continues to evolve rapidly to this day. Rust may
claims that it is going to be the language for the next 40 years but so far
I have more hopes of JavaScript being relevant in the next 40 years more than I
have for Rust.

This also indirectly points out to one of my other suspicions about the future:
will JS on the server be so prevalent that using other tech will be stupid?
The answer to that right now is _I do not know_ and I don't like that answer.
[You can read more about me yapping about this question here](/tech/server.md).


## Conclusion
React won with Next.js. It's declarative, component oriented nature with almost
seamless SSR just beats the joy out of writing plain HTML. I am not going back.
