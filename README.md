aptcentral
==========
Dedicated process for coordinating concurrent `apt` commands

Why
---
This is a bad idea.

The original goal was to create a `Makefile` that would install an
`nginx`-served website (or a few) on any `apt`-ready Linux. I've done that
setup once before, and it's not bad, but it's always the same: `sudo apt
install` a bunch of stuff, `git clone` some stuff, 
write some nginx configs, then `sudo rm` and `sudo ln -s` to install them, `sudo
service`, make sure that the ports are forwarded, and then _oh boy_
`certbot` in automatic mode.

It can be described as a dependency graph, but really it's better just to write
a script.

Were you to use `make` for the whole thing, you might need to solve the problem
of only one `apt-get` process being able to run at once.  If you want otherwise
parallel builds, then you have to serialize the calls to `apt-get`.

But don't. Just use [Chef][1] or something instead.

What
----
[aptcentral](aptcentral) is a command line tool that manages a (temporary)
daemon to which `apt-get` commands can be sent for execution. This way,
multiple processes can be calling `aptcentral [...] install foo bar [...]`
at the same time, and only one `apt-get` process will run at a time.

How
---
See the example [Makefile](Makefile). Then go wash your hands.

[1]: https://www.chef.io/
