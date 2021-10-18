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
