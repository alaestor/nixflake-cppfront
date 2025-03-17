An Experimental Nix Flake For [CPP2](https://github.com/hsutter/cppfront)

---

Use `nix develop` to get a shell with gcc and cppfront.

But you probably want to add a build system to packages...

---

To explicitly build cppfront, use `nix build`

To build and run the hello-world demo
```
nix build #hellocpp2 && ./result/bin/hellocpp2
```
