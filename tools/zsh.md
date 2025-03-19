# Why ZSH?

It comes with MacOS by default. I just slap [Oh My ZSH](https://ohmyz.sh) on it
and call it a day.


# Setup

```sh
[ ! -f ~/.zshrc ] && {
  echo "zsh: First install detected"
  cp zshrc ~/.zshrc
}

echo "sync: zshrc"
[   -f ~/.zshrc ] && cp ~/.zshrc zshrc
```
