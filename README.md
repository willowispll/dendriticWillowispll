# dendriticWillowispll
Willowispll's flake-based NixOS/finix configurations for personal devices.

## this repository uses:
- flakes
- dendritic pattern
- hjem for dotfile management
- custom `lib.nix` with helpers for:
  - switching between NixOS and finix
  - cleaner module definitions

## repository structure
```sh
[willowispll@ebrietas:~/dendriticWillowispll]$ tree -d
.
└── hosts
    ├── ebrietas
    │   ├── features
    │   ├── programs
    │   ├── services
    │   └── system
    ├── micolash
    │   ├── features
    │   ├── programs
    │   ├── services
    │   └── system
    └── shared
        ├── features
        ├── hjem
        ├── programs
        ├── services
        └── users

18 directories

[willowispll@ebrietas:~/dendriticWillowispll]$
```

## hosts
| host     | os    | init  | wm   | bootloader | description       |
|----------|-------|-------|------|------------|-------------------|
| ebrietas | finix | finit | vxwm | limine     | main device       |
| micolash | finix | finit | niri | limine     | laptop            |

> all host names are inspired by [bloodborne](https://en.wikipedia.org/wiki/Bloodborne).

## usage
```sh
nixos-rebuild switch --flake .#*hostname*
```
