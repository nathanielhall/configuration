# Configuration (v2.0)

> Personal developer environment, Spec-Driven Development (SDD) standards, Google ADK project templates, and machine dotfiles.

See [docs/MASTER_SPEC.md](docs/MASTER_SPEC.md) and [GEMINI.md](GEMINI.md) for the complete architectural specification and engineering guardrails.

---

## 1. v2.0 Architecture & Migration Matrix

| Component Category | Legacy (`configuration` Repo) | v2.0 Status | Target Solution / Action |
| :--- | :--- | :--- | :--- |
| **Primary IDE** | VS Code | **Replace** | **Google Antigravity** (App + `agy` CLI) |
| **Modal Editing** | Neovim (`init.vim`) + `vscodevim` | **Hold / Standardize** | **Standardize on `vscodevim`** inside Antigravity. Leave `nvim/` and `vim/` untouched in place so existing `$HOME` symlinks remain functional until archived. |
| **Color Theme** | Cobalt2 (Wes Bos) | **Keep** | Port `Cobalt2` theme + custom workbench overrides to Antigravity (`antigravity/`). |
| **Terminal Multiplexer** | `tmux` (heavy daily layout) | **Scoping Change** | **Keep `tmux`** strictly for persistent sessions (SSH, `adk web`, long Terraform runs). |
| **Spec & ADR Authoring** | Manual Markdown / Ad-hoc | **Add (Core)** | **Elephant-Goldfish Model (EGM)** plugin + **OpenSpec (`spec-driven-with-adr`)**. |
| **Git Branching** | Standard `git checkout` | **Add (Core)** | **`git-glen`** worktree manager for parallel multi-agent execution. |
| **Agent Framework** | N/A | **Add (Core)** | **Google ADK** (latest stable) + **`agents-cli`** + **Google Cloud Agent Platform**. |
| **Machine Setup** | Custom bash scripts (`setup/`) | **Hold (As-Is)** | Retain existing `setup/` scripts untouched; evaluate **Ansible** in backlog. |

---

## 2. Repository Directory Structure

```text
configuration/
├── GEMINI.md                      # Global repo context & coding standards for Antigravity
├── README.md                      # Repository overview & workflow documentation
├── .agents/                       # Workspace-scoped Antigravity customizations (not stowed to $HOME)
│   ├── rules/
│   │   └── sdd-egm.md             # Enforces Elephant "No Code" & Goldfish review gates
│   └── skills/                    # Reusable Antigravity SKILL.md definitions
├── antigravity/                   # Antigravity IDE settings, keybindings, and Cobalt2 overrides
├── docs/
│   └── MASTER_SPEC.md             # Canonical v2.0 migration & workflow specification
├── templates/
│   ├── openspec-egm/              # Project scaffold for EGM + OpenSpec (spec-driven-with-adr)
│   └── adk-project/               # Project scaffold for Google ADK + Vertex AI + Terraform
├── nvim/                          # [Legacy / Active Symlink] Neovim config (held in place)
├── vim/                           # [Legacy / Active Symlink] Vim config (held in place)
├── tmux/                          # [Active Symlink] tmux config for persistent sessions
├── zsh/                           # [Active Symlink] Zsh config & aliases
├── vscode/                        # [Legacy] VS Code settings reference
└── setup/                         # [Legacy / Held] macOS & Linux setup scripts
```

---

## 3. v2.0 Developer & Agentic Workflow

### Spec-Driven Development (EGM + OpenSpec + ADR)
Every non-trivial feature or agent workflow follows the 4-stage **Elephant-Goldfish Model (`google/elephant-goldfish-model`)** paired with **OpenSpec (`spec-driven-with-adr`)** (defined in [.agents/rules/sdd-egm.md](.agents/rules/sdd-egm.md)):

```bash
# Install EGM plugin & OpenSpec CLI
agy plugin install https://github.com/google/elephant-goldfish-model
npm install -g @fission-ai/openspec
```

1. **Stage 1 — Growing the Elephant (`/egm:egm-brainstorm` | Strict No-Code Rule):**
   - Interview to surface assumptions, failure modes, and security boundaries.
   - Output `concepts_brief.md` and record formal architectural decisions in `docs/adr/ADR-NNN-<title>.md`.
2. **Stage 2 — Drafting the Specification (`/egm:egm-draft` + OpenSpec):**
   - Generate structured artifacts inside `openspec/changes/<feature-name>/`:
     - `spec.md`: Observable behavior, ADK tool schemas, security constraints, and `Given/When/Then` scenarios.
     - `design.md`: Technical implementation plan, agent topology, Terraform resources, and exact file paths.
     - `tasks.md`: Ordered, atomic implementation and verification checklist.
3. **Stage 3 — Stateless Goldfish Adversarial Review (`/egm:egm-review`):**
   - Spawn fresh, zero-context **Goldfish** subagents to execute a 3-step gate:
     1. *Comprehension Check* (zero ambiguity verification)
     2. *Antagonistic Review* (race conditions, IAM over-privileging, unhandled tool errors)
     3. *Implementation Readiness Check* (Go/No-Go gate for explicit file paths and signatures)
4. **Stage 4 — Isolated Worktree Execution (`git-glen`):**
   - Execute `tasks.md` inside an isolated worktree and verify locally (`pytest`, `terraform validate`, `adk run`).

### Parallel Multi-Agent Workflow (`git-glen`)
- **Keep `main` as the "Elephant" Planning Hub:** Use the primary checkout strictly for drafting specs, ADRs, and reviewing PRs.
- **Spawn Isolated Agent Worktrees:**
  ```bash
  git glen add feat/<feature-name>
  agy ../<repo>-wt-feat-<feature-name>
  ```
- **Scoped Execution & Cleanup:** Point the worktree-scoped Antigravity session to `@openspec/changes/<feature>/design.md` and `@openspec/changes/<feature>/tasks.md`. Once merged and archived (`openspec archive`), prune the worktree via `git-glen`.

### Antigravity IDE, `vscodevim`, Cobalt2, and `tmux` Ergonomics
- **Core Extensions Baseline:** `vscodevim.vim`, `wesbos.theme-cobalt2`, `hashicorp.terraform`, `ms-python.python`, `googlecloudtools.cloudcode`.
- **Dvorak / Kinesis-Safe Keybinding Fixes:**
  - Delegate `Ctrl+K`, `Ctrl+B`, and `Ctrl+F` to Antigravity in `settings.json` (`"vim.handleKeys"`).
  - Use `<leader>aa` (Chat Panel), `<leader>ai` (Inline Agent Edit), and `<leader>ag` (Agent Manager) in `vscodevim` Normal mode.
  - Configure `"terminal.integrated.commandsToSkipShell"` so `Cmd+` shortcuts stay with Antigravity while `Ctrl+` chords pass cleanly through to `tmux`.

### Local-to-Cloud Google ADK Workflow
- **Model Routing:** Standardize on Google models via Vertex AI (`GOOGLE_GENAI_USE_VERTEXAI=TRUE`), routing fast subagent/validation tasks to Gemini Flash tiers and complex architectural reasoning to Pro/Experimental tiers.
- **Inner Loop (Local):** Rapidly iterate via `agents-cli` (`adk create`, `adk run`) and inspect multi-agent handoffs, tool payloads, and traces in the local web playground (`adk web --port 8000`).
- **Outer Loop (Cloud):** Deploy least-privilege IAM, Vertex AI Agent Engine, and Cloud Run infrastructure via modular `terraform/` configurations, validating in the Google Cloud Vertex AI Agent Engine Playground.

---

## 4. Legacy Dotfiles & Machine Setup (Preserved)

> Existing dotfiles (`nvim`, `tmux`, `vim`, `zsh`) and `setup/` scripts remain in their original paths so current `$HOME` symlinks continue functioning without disruption.

### Setup Scripts
- `./setup/mac-settings.sh` — Apply [macOS defaults](https://macos-defaults.com/)
- `./setup/mac-installs.sh` — Run installs using Homebrew
- `./setup/dev.sh` (`./setup/dev-remote.sh`) — Set up development environment
- `./setup/linux.sh` — Run Linux-specific installs and settings (*work in progress*)

### Dotfiles (`stow`)
- `./sync.sh` — Create symlinks in `$HOME` using GNU Stow for packages in `$STOW_FOLDERS`.
- `./sync-remove.sh` — Remove symlinks previously created for `$STOW_FOLDERS`.

The `sync-*.sh` scripts rely on the following environment variables (configured in `zsh/.zshrc`):
- `DOTFILES=$HOME/configuration`
- `ZDOTDIR=$HOME`
- `STOW_FOLDERS="nvim, tmux, vim, zsh"`

### Manual Steps
#### Install Font
- [Dank Mono](https://philpl.gumroad.com/l/dank-mono) (paid font, not committed in this repo)
- Build a patched Nerd Font: [Nerd Fonts: Option 8 - Patch your own font](https://github.com/ryanoasis/nerd-fonts#option-8-patch-your-own-font)
  - `docker run -v ~/nerd-fonts/in:/in -v ~/nerd-fonts/out:/out nerdfonts/patcher --fontawesome --octicons`

#### iTerm Settings
- Font: Dank Mono Nerd Font; Regular; 13; 100; 115 (vertical spacing: 120)
- [Cobalt2 Theme by Wes Bos](https://github.com/wesbos/Cobalt2-iterm) — Import `cobalt2.itermcolors` under `Preferences > Profiles > Colors > Load Presets`.
- [Enabling italics in Vim and tmux](https://gist.github.com/gutoyr/4192af1aced7a1b555df06bd3781a722)

#### Mac System Settings
- Create shortcut for each desktop 1–5: `System Settings > Keyboard > Keyboard Shortcuts > Mission Control > Switch to desktop`
- Dvorak Keyboard Input: `System Settings > Keyboard > Add Dvorak`
- Faster desktop transitions: `Accessibility > Display > Reduce Motion`
- Caps Lock as Escape key: `System Settings > Keyboard > Keyboard Shortcuts > Modifier Keys > Caps Lock -> Escape`

### Resources
- [macOS defaults list](https://macos-defaults.com/)
- [mathiasbynens dotfiles](https://github.com/mathiasbynens/dotfiles/blob/main/.macos)
- [chris@machine Neovim IDE from Scratch](https://www.youtube.com/watch?v=ctH-a-1eUME)
- Change cursor shape by mode: [Luke Smith Zshrc](https://gist.github.com/LukeSmithxyz/e62f26e55ea8b0ed41a65912fbebbe52)
- [FZF with tmux-sessionizer](https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-sessionizer)

---

## 5. TODO / Backlog

- [ ] **Unlink & Archive Neovim (`archive/neovim/`):** Audit and remove active `$HOME` Stow symlinks pointing to `nvim/` (and legacy `vim/`), remove `nvim`/`vim` from `STOW_FOLDERS`, and move the Neovim configuration into `archive/neovim/`.
- [ ] **Evaluate Ansible for Machine Setup (`setup/`):** Evaluate declarative provisioning with **Ansible** to replace or modernize `./setup/` scripts (`mac-settings.sh`, `mac-installs.sh`, `dev.sh`, `linux.sh`) and automate `$HOME` dotfile backup/cleanup across personal and work machines.
- [ ] **Global Antigravity & `.agents/` Sync Strategy:** Design a safe linking/sync strategy for user-global `$HOME/.agents/` rules/skills and `antigravity/` IDE configurations without colliding with workspace-local `.agents/` directories.
- [ ] **Optional Multi-Provider Model Evaluation:** Revisit routing third-party models (e.g., Claude) via Vertex AI Model Garden if cross-model experimentation is needed in the future.
