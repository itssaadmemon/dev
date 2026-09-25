# dotfiles

Personal Linux dev environment: **i3** (X11) + **WezTerm** + **tmux** + **Neovim**, targeting Pop!_OS 22.04.

## Layout

```
setup                     # entry point (bash)
installs/
  gum                     # bootstraps the `gum` TUI used by `setup`
  packages.txt            # list of installable packages (installers)
  configs.txt             # list of configs that can be copied to ~/.config
  packages/
    <name>                # installer script for each package
    configs/              # config files copied by `setup configs`
      nvim/ i3/ i3status/ tmux/ wezterm/ .zshrc .zsh_profile
```

## Usage

```bash
./setup base        # base build/runtime packages + gum
./setup upgrade     # apt update && apt upgrade
./setup packages    # pick packages to install (+ copy matching configs)
./setup configs     # pick configs to copy into ~/.config
```

Configs are **copied**, not symlinked. After editing anything under `installs/packages/configs/`,
re-run `./setup configs` (or rerun the relevant package) to apply it.

## Keymaps

Leader keys: **i3 = `Alt` (`Mod1`)**, **tmux = `Ctrl-a`**, **nvim = `Space`**.

### i3

| Keys | Action |
| --- | --- |
| `Alt+Return` | WezTerm |
| `Alt+d` | rofi: apps (`drun`) |
| `Alt+Shift+d` | rofi: run command |
| `Alt+Shift+v` | clipboard history (greenclip) |
| `Alt+Shift+q` | kill window |
| `Alt+h/j/k/l`, arrows | focus |
| `Alt+Shift+h/j/k/l`, arrows | move window |
| `Alt+z` / `Alt+v` | split horizontal / vertical |
| `Alt+f` | fullscreen |
| `Alt+s` / `Alt+w` / `Alt+e` | layout stacking / tabbed / toggle split |
| `Alt+Shift+space` | toggle floating |
| `Alt+a` | focus parent |
| `Alt+1..0` | switch workspace |
| `Alt+Shift+1..0` | move container to workspace |
| `Alt+r` | resize mode (`h/j/k/l`, `Return`/`Esc` to exit) |
| `Alt+Shift+c` / `Alt+Shift+r` / `Alt+Shift+e` | reload / restart / exit |
| `Alt+Shift+period` | suspend |
| `Alt+Shift+x` | lock |
| `Alt+grave` / `Alt+Shift+grave` | scratchpad show / move to scratchpad |
| `Alt+Tab` | last workspace |
| `Print` / `Alt+Print` | screenshot region (flameshot) / full screen (maim) |
| `XF86Audio*`, `XF86MonBrightness*` | volume / brightness |

### tmux (prefix `Ctrl-a`)

| Keys | Action |
| --- | --- |
| `Ctrl-a Ctrl-a` | send literal prefix |
| `Ctrl-a h/j/k/l` | select pane left/down/up/right |
| `Ctrl-a ^` | last window |
| copy-mode (vi): `v` / `y` | begin selection / copy to clipboard |

### Neovim (`<leader>` = `Space`)

| Keys | Action |
| --- | --- |
| `<leader>b` | toggle file tree |
| `<C-p>` | find git files |
| `<leader>pf` | find files |
| `<leader>fb` | find buffers |
| `<leader>ps` | grep string |
| `<leader>lg` | live grep |
| `<leader>ls` | document symbols |
| `<leader>sr` | search & replace (grug-far) |
| `<leader>f` | format buffer (`mix format` for Elixir) |
| `<leader>t` / `<leader>tf` | run nearest test / test file |
| `<leader>u` | toggle undotree |
| `<leader>zz` / `<leader>zZ` | zen mode (numbers / clean) |
| `<leader>;` | clear search highlight |
| `<leader>vs` / `<leader>s` | vertical / horizontal split |
| `<leader><leader>` | source current file |
| `<C-h/j/k/l>` | window navigation |
| `Left` / `Right` | previous / next buffer |

**Completion (blink.cmp):**

| Keys | Action |
| --- | --- |
| `<C-Space>` | show completion |
| `<C-n>` / `<C-p>` | next / previous item |
| `<CR>` | accept |
| `<C-e>` | hide |

**LSP (available once a server attaches):**

| Keys | Action |
| --- | --- |
| `<leader>gd` | goto definition |
| `<leader>h` | hover |
| `<leader>ws` | workspace symbol |
| `<leader>d` | diagnostic float |
| `<leader>dn` / `<leader>dN` | next / prev diagnostic |
| `<leader>ca` | code action |
| `<leader>rr` / `<leader>rn` | references / rename |
| `<leader><C-h>` (insert) | signature help |

**Trouble / quickfix:**

| Keys | Action |
| --- | --- |
| `<leader>xx` / `<leader>xX` | diagnostics / buffer diagnostics |
| `<leader>cs` / `<leader>cS` | symbols / LSP |
| `<leader>xL` / `<leader>xQ` | location list / quickfix list |
| `[q` / `]q` | previous / next item |

**Treesitter text objects:** `]f ]c ]a` / `[f [c [a` (next/prev function, class, parameter),
`]F ]C` / `[F [C` (end).

### zsh

`g`=git, `gc`=clone, `gs`=status, `gi`=init, `ga`=add, `gct`=commit, `gph`=push, `gpl`=pull,
`gr`=restore, `gb`=branch, `gco`=checkout, `doc`=docker, `lzd`=lazydocker, `lzg`=lazygit,
`vim`=nvim.

## Roadmap

- [x] **Phase 0** — repo hygiene, hardened `setup`, keymap docs
- [x] **Phase 1** — i3/X11 polish (dunst, flameshot, clipboard history, screen lock)
- [x] **Phase 2** — Neovim modernization (blink.cmp, treesitter pinned, `mix` formatting, textobjects fixed)
- [x] **Phase 3** — Elixir environment (mise pins, local Postgres 18, Livebook Desktop)
- [x] **Phase 4** — git/docker TUIs (lazydocker + lazygit, `lzd`/`lzg` aliases)
- [ ] **Phase 5** — shell (drop Oh My Zsh, add zoxide/atuin/starship, modern CLI tools)
