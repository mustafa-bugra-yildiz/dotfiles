# Server
There are many choices to have here unlike platform dependant stacks like web,
and mobile. I chose Go in the mean time, but this decision irks me for some reason
I haven't yet figured out. So let's begin by first derailing the _why_ behind it.


## Go is Unimaginative
Yes. It is a boring language that tries to wear C as its skin while acting like
something else entirely different to it. I have my gripes with Go but the balance
it strikes with the boring and the productive is astonishing. You quickly fall in
love with writing Go then a kid that just discovered snacks with copious amounts of
stimulating sugary stuff in it.

It is almost as if the lack of facilities in the language forces you to just do the
work, leaving no room for procrastination. You have very little, so you make good
use of whatever it is at your disposal 100% of the time.

And I am not even considering the great tooling, easy learning curve and quick
compilation speeds that make it extremely suitable for writing little scripts.
Besides, some of the design decision in the language also make it extremely
suitable for writing large codebases. No stupid surprises in Go: you write the
code plain, and move onto the next part of the story and you have everything you
need at your fingertips along the way. Simplicity at its finest. But:


## Go is Limiting
How many places does it run? It is just a general purpose programming language.
You can't write UIs with it, you can't write good servers with it: it is general purpose.
You can do everything, but it requires diligance. You can't play fast and loose with it.
It doesn't stretch well beyond the boundries of its domain.

- How many web frontends have you seen entirely in Go?
+ It has a nice templating library (`html/template`) yes, but its a library.
  One with terrible ergonomics compared to React. [See here](/tech/web-frontend.md).

- How many desktop/mobile applications are in Go?
+ There are some third party libraries, but I don't have one particular solution
that stands out.

- How comfortable are you doing large refactors with it?
+ Not as comfortable as Elm I reckon, far superior to JavaScript tho.

TypeScript seems to fair better on these fronts compared to Go.
But I really like Go. I wish I could just write Go everywhere I pleased.
But alas, it is a dream too good to be true _right now_. There may be a future
here, but the language is too inexpressive for describing UI elements and that's
the first barrier to its success in this domain.


# JavaScript is Promising
Especially with TypeScript fixing my need for types in this abysmal but
ubiquitious language. You can do everything in it but you have to give up performance.

- Web frontend? - Your only option anyway
- Backend servers? - Quite well on small to medium scale.
- Mobile apps? - Certainly is used in the industry by many people.
- Desktop apps? - Ever heard of electron?

Now, I am not saying JS is the be-all and end-all solution here. That is a different
issue still. But with such a diverse portfolio of use cases I'd expect at least
some possible ways of expressing logic with this horrible language that no other
can do quite well.

For example:

- Sharing logic/data structures between different domains (web, mobile, desktop)
- Single codebase for the entire org. Simplifies everything substantially.
- Treating each platform like JavaScript interpreters and levaring that.

Browser was the right abstraction for most of what we do right now, shame that it
uses JavaScript. Glory to thou types then. I am not even mentioning the rubbish
browsers have to put up with from the past. Like design decision or compatibility
guarantees or the ever-enshittifying web standards.


## Conclusion
Until we find a better abstraction with a clean slate, a better design for all
of this, I will happily _just use Go_.
