# Brink

Very work in progress repo. Not safe for production.

Goals:

Nix-based configuration of physical systems as hypervisors for

something like Nomad, K3s, who knows.


## Dell NUC

Update an existing system

```shell-session
nixos-rebuild switch --flake .#mini
```
The initial password for `nason` is `test`. Change asap.
