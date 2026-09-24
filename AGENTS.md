# AGENTS.md

Guidance for AI coding agents working in this repo. See `README.md` for what this repo is and how
it's laid out.

## Validate before applying

Never apply a change without validating it first — this config drives a real, running machine.

```bash
# validates + builds without touching the live system
nixos-rebuild dry-build

# applying requires sudo, which needs an interactive password prompt —
# an agent cannot run this non-interactively; ask the user to run it
sudo nixos-rebuild switch
```

## Conventions

- One file per tool under `home/apps/`, each a self-contained home-manager module
  (`{ pkgs, ... }: { ... }`). `home/home.nix` only wires modules together via `imports` — never add
  per-tool config there.
- A package lives in the module of the tool that needs it (e.g. the Nerd Font sits in `kitty.nix`,
  not `home.nix`), not in a shared catch-all list.
- Channels, not flakes — don't introduce a `flake.nix` without discussing it first.
- No `profiles/` abstraction layer — single host currently. Don't add one preemptively; add it only
  when a second host actually exists.
- Commit messages follow [Conventional Commits](https://www.conventionalcommits.org/) (`feat:`,
  `fix:`, `chore:`, `docs:`, ...).

## Gotcha: generated dotfiles are read-only

Files home-manager generates (`~/.zshrc`, `~/.config/kitty/kitty.conf`, `~/.gitconfig`, etc.) are
symlinks into `/nix/store`, mode `444`. Never try to hand-edit them — edit the source `.nix` module
and rebuild instead. Editing the store file will simply fail with `Permission denied`.

## Secrets

Nothing sensitive belongs in this repo — it's public. No tokens, keys, or credentials in any `.nix`
file, ever.
