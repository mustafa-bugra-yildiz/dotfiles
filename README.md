# Bugra's Dotfiles

For the past couple years I have been trying to come up with a way
to manage my dotfiles essentially without churn.  I used to keep a
very tight grip on it to the point I would not install stuff using
`brew install` but edit my config instead.

This is was all nice-and-shiny for the first couple years but then
as I got older I wished for a better way. And then it clicked: Why
am I constraining my environment to this meek folder rather than
constraining it to my messy envrionment?

So now instead of me dictating the churn, it dictates my fate.

## Where is the code?

You can run `cat README.md | npx codedown sh` to extract the code
from this file.



## The Script

I usually alias this to `dots`.

Steps it takes in order:

- Copy the dotfiles:


```sh
rm -rf config
cp -r ~/.config config
```

- Copy the stuff I have installed with brew

```sh
rm Brewfile
brew bundle dump
```

- Copy the shell file

```sh
cp ~/.zshrc zshrc
```

- Remove some stuff I don't want to commit

```sh
rm -rf config/github-copilot
rm -rf config/zed/*/
```

After that I don't need to do much other than commit the changes.

## Why?

This lets me just do whatever I want without a care in the world
and still be able to save the state of my environment.

Which means I am allowed to be wild.
