# Why ZSH?

It comes with MacOS by default. I just slap [Oh My ZSH](https://ohmyz.sh) on it
and call it a day.


# Setup

```sh
[ ! -f ~/.zshrc ] && cp zshrc ~/.zshrc
[   -f ~/.zshrc ] && {
  echo "sync: zsh"
  cp ~/.zshrc zshrc
}
```
