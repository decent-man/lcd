# LCD

A simple utility that lists files in a directory simlar to GNU ls.

### Why do I use this when 'ls' exists?

Colors for each file type :)

**It is not a replacement for _ls_.**

It does not have a lot of the features of ls. It simply lists directories and files in style.

Its main design is focused around my other shell function `lmd`(also included) .

When constantly working in the terminal I encountered a problem of often typing _ls_ and needing to look at the files in the current working directory.

Since I needed it that often I found a solution to this by piping the output of _ls_ with certain flags into bash's `PROMPT_COMMAND` and viola I had a nice little view of the files 
and it almost entirely replaced my need of a GUI file manager.

**LCD** is simply a binary version of the same application. Ever since I moved to a mac from linux I encountered a bunch of problems with `lmd` since there is a _**GNU**_ and also a _**BSD**_ version of _ls_ .
The _**BSD**_ version of _ls_ does not support some of the flags of the _**GNU**_ version of _ls_ and this caused `lmd`'s output to look horrible.
The workaround for this was to install the entire _**GNU**_ `coreutils` on my mac just  for getting `lmd` to work correctly.
So to solve this issue of portability I decided to write a binary app that does exactly what I needed ls to do but is also free from platform problems.

![lcd](https://github.com/decent-man/lcd/blob/central/scrot/lcd.png)

It is not perfect by any means. e.g for directories with a lot of files it **will** fill up your screen. If possible I will find a way in the future to tackle this.

## Installation

Comes in two different versions. One **LCD** and one `lmd`
- **LCD** is the binary application that you can install.
- `lmd` is a shell function that you can copy onto your shell's config file(`.bashrc`,`.zshrc`, etc.) [uses _**GNU** ls_]

1. **LCD**
  - Download the respective binary from the releases section.
  - Run `install.sh`
  - Test it by typing `lcd` in your shell.
  - To use it like `lmd` but `lcd` instead of `ls`. Follow the `lmd` steps.
  - Now inside `lmd` function within the `LS_CMD` variable just replace its value with `lcd`.
  - Reload your shell config.
  - Test it by typing `lmd`. It should now repeatedly show the list of files along with the shell.
  - Get to work
2. `lmd`
  - Clone this repo using `git clone https://github.com/decent-man/lcd` or open the file [lmd.sh](https://github.com/decent-man/lcd/blob/central/lmd.sh)
  - Copy the contents of this file to your shell's config file e.g for zsh `~/.zshrc` for bash `.bashrc`, etc.
  - Disable the lines which do not belong to your shell. If you're using zsh disable the lines under `For BASH` and vice versa.
  - Reload your shell configuration typically done with `source ~/.zshrc` ,etc
  - Test it by typing `lmd`. It should now repeatedly show the list of files along with the shell.
  - To quit out type `qq`. To clear screen type `cl` - These are just aliases.
  - You can modify this function to your liking.

Happy Terminaling!
