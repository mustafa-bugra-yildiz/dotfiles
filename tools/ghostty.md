# Why Ghostty?

I have been in shock and awe of how terrible terminals handle rendering fonts.
Wanna see a list of the least sucking ones I tried?

- iTerm2
- Alacritty
- Ghostty

Yes, the list is short, but I have quirks with others.

- iTerm2 doesn't render fonts like sublime does, I've tried everything.
  Also, it's configuration is binary, which I can't really sync using git.

- Alacritty does win on the configuration side, but it sucks when it comes to
  switching between light and dark mode automatically.

- Glory to Ghostty.

That's the complete reasoning for this choice, I may have to come back and redo
my thinking later but I am fine with Ghostty right now.

## Setup

```sh
command -v ghostty >/dev/null || {
  echo "Installing ghostty."
  brew install ghostty
}

[ ! -d ~/.config/ghostty ] && cp -r ghostty ~/.config/ghostty
[   -d ~/.config/ghostty ] && {
  echo "sync: ghostty"
  rm -rf ghostty
  cp -r ~/.config/ghostty ghostty
}
```
