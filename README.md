# nvim-config

Personal [AstroNvim](https://github.com/AstroNvim/AstroNvim) configuration (v6+).

Remote: <https://github.com/BakerSean168/nvim-config>

## Requirements

| Item | Recommendation |
|------|----------------|
| Neovim | **≥ 0.11**, preferably **0.12.x** stable (matches AstroNvim v6 + nvim-treesitter `main`) |
| Git | Required for Lazy plugins |
| Go | Optional but recommended if you use Go tools (`gopls`, `gofumpt`, `delve`, `lazygit`). Prefer official tarball under `/usr/local/go` (or equivalent) rather than an outdated distro package |
| Node / Python / C compiler | Needed for various Mason packages and Tree-sitter parsers (`gcc`/`cc`, `tar`, `curl`) |

Also useful: `rg` (ripgrep), `fd`, Nerd Font in the terminal.

## Fresh install

```shell
# Backup existing Neovim state if any
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null
mv ~/.local/share/nvim ~/.local/share/nvim.bak 2>/dev/null
mv ~/.local/state/nvim ~/.local/state/nvim.bak 2>/dev/null
mv ~/.cache/nvim ~/.cache/nvim.bak 2>/dev/null

git clone https://github.com/BakerSean168/nvim-config.git ~/.config/nvim
nvim
```

First launch will install Lazy plugins (pinned by `lazy-lock.json`) and Mason tools listed in `lua/plugins/mason.lua`.

## Sync on another machine (existing clone)

When this repo is updated on one machine, pull and restore plugins on others:

```shell
cd ~/.config/nvim
git pull origin main

# Install/update plugins to the commits in lazy-lock.json
nvim --headless "+Lazy! restore" "+qa"

# Optional: full sync if restore is not enough
# nvim --headless "+Lazy! sync" "+qa"
```

Then open Neovim once interactively (or keep headless open long enough) so:

- **mason-tool-installer** can install missing packages from `ensure_installed`
- **nvim-treesitter** can install/update parsers (`auto_install` + AstroCore `ensure_installed`)

Headless one-shot (best effort; Mason may need more wall-clock time on slow networks):

```shell
nvim --headless "+Lazy! restore" "+lua vim.defer_fn(function() vim.cmd('qa!') end, 60000)"
```

### After sync checklist

1. `nvim --version` — confirm ≥ 0.11 (ideally 0.12.x).
2. Open a few filetypes you care about: Markdown, Lua, Go, TS/JS, YAML, Shell.
3. Confirm no Tree-sitter / Aerial Lua errors in `:messages` or `~/.local/state/nvim/nvim.log`.
4. Confirm tools exist when needed:
   - Go: `go version`, and that Mason can spawn `go` (PATH must include Go).
   - Optional TUI: `lazygit` on `PATH` if you use `<Leader>gg`.
5. `:checkhealth` (or `:checkhealth astronvim`) and skim for real failures vs optional extras.

## Notes and caveats

### Neovim version

- This config tracks **AstroNvim `^6`**.
- Tree-sitter uses the **`main`** branch of `nvim-treesitter` (via AstroCore options in `lua/plugins/treesitter.lua`).
- **aerial.nvim** is overridden to **`^4`** in `lua/plugins/aerial.lua` for Neovim 0.12 query APIs.
- Do **not** mix this lockfile with Neovim nightly unless you intentionally test it.

### PATH (Go / Mason / tools)

`lua/lazy_setup.lua` and `lua/polish.lua` prepend (when present):

- `/usr/local/go/bin`
- `~/go/bin`
- `stdpath("data")/mason/bin`

So Neovim and Mason still see Go even when the editor is started without a full interactive shell profile.

On **Windows** or custom Go installs, adjust those paths if Go is not under `/usr/local/go/bin`. Ensure your shell profile also puts Go and `~/go/bin` on `PATH` for terminal use.

### Mason tools

`lua/plugins/mason.lua` `ensure_installed` includes LSP/formatters for Lua, web, Python, Go, Rust, Astro, Shell (`bash-language-server`, `shellcheck`, `shfmt`), and YAML (`yaml-language-server`, `yamllint`).

Missing tools are installed automatically when Neovim starts (network required). Go-based packages need a working `go` on PATH.

### Formatters / none-ls

`lua/plugins/none-ls.lua` registers stylua, prettier, black, isort, gofumpt, shfmt, and yamllint.

`lua/plugins/astrolsp.lua` prefers dedicated formatters over LS formatters for `lua_ls` and `ts_ls`, and enables gopls `gofumpt` / staticcheck-oriented settings.

### First sync cost

- Plugin download + parser compile can take several minutes.
- Prefer keeping `lazy-lock.json` so machines share the same plugin revisions (`Lazy restore`), instead of floating to arbitrary `main` tips.

### Optional tools (not required)

AstroNvim/snacks may report missing optional binaries (`lazygit`, image tools, etc.). Install only what you use, for example:

```shell
go install github.com/jesseduffield/lazygit@latest
```

### What this repo does *not* pin

- System packages (OS, apt packages, Nerd Fonts)
- The Go / Node / Python runtime installers themselves
- Machine-local secrets or host-specific paths beyond the common Go/Mason defaults above

## Layout

```text
init.lua                 # Lazy bootstrap
lua/lazy_setup.lua       # AstroNvim import + early PATH
lua/polish.lua           # late PATH / local tweaks
lua/plugins/             # user overrides (mason, treesitter, LSP, aerial, …)
lazy-lock.json           # pinned plugin commits
```

## Upstream AstroNvim docs

- <https://docs.astronvim.com/>
- Template history: this tree started from the AstroNvim user template and is maintained for multi-machine use.
