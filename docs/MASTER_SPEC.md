## **1\. Migration Matrix: Keep, Replace, Add, Hold**

| Component Category | Legacy (configuration Repo) | New Workflow Status | Target Solution / Action |
| :---- | :---- | :---- | :---- |
| **Primary IDE** | VS Code | **Replace** | **Google Antigravity** (App \+ `agy` CLI) |
| **Modal Editing** | Neovim (`init.vim`) \+ `vscodevim` | **Hold / Standardize** | **Standardize on `vscodevim`** inside Antigravity. **Leave Neovim files untouched as-is** so existing symlinks remain functional; add future symlink cleanup/archival to the backlog TODO. |
| **Color Theme** | Cobalt2 (Wes Bos) | **Keep** | Port `Cobalt2` theme \+ custom workbench overrides to Antigravity |
| **Terminal Multiplexer** | `tmux` (heavy daily layout) | **Scoping Change** | **Keep `tmux`** strictly for persistent sessions (SSH, long Terraform/agent runs) |
| **Spec & ADR Authoring** | Manual Markdown / Ad-hoc | **Add (Core)** | **Elephant-Goldfish Model (EGM)** plugin \+ **OpenSpec (`spec-driven-with-adr`)** |
| **Git Branching** | Standard `git checkout` | **Add (Core)** | **`git-glen`** worktree manager for parallel multi-agent execution |
| **Agent Framework** | N/A | **Add (Core)** | **Google ADK** (latest stable) \+ **`agents-cli`** \+ **Google Cloud Agent Platform** |
| **Machine Setup** | Custom bash scripts (`setup/`) | **Hold (As-Is)** | Retain existing `setup/` scripts untouched for now; backlog future evaluation of **Ansible** |

---

## **2\. Spec-Driven Development (SDD) & ADR Architecture**

To deliver an open-source workflow matching internal Castor AI capabilities, this setup pairs **Google's Elephant-Goldfish Model (`google/elephant-goldfish-model`)** for adversarial design review with **OpenSpec (`spec-driven-with-adr`)** for structured artifact generation (`docs/adr/`, `spec.md`, `design.md`, `tasks.md`).

### **Installation in Antigravity**

* **Antigravity App (Chat):** Run `/plugin` in the Antigravity chat panel and prompt:  
  `Install https://github.com/google/elephant-goldfish-model`  
* **Antigravity CLI (`agy`) & OpenSpec CLI:**

```
agy plugin install https://github.com/google/elephant-goldfish-model
npm install -g @fission-ai/openspec
```

### **Standard Repository Spec Layout**

```
project-root/
├── GEMINI.md                      # Always-on global repo context & coding standards for Antigravity
├── .agents/
│   ├── rules/
│   │   └── sdd-egm.md             # Enforces Elephant "No Code" & Goldfish review gates
│   └── skills/
│       └── worktree-agent/
│           └── SKILL.md           # Automates git-glen worktree spawning & ADK setup
├── docs/
│   ├── adr/                       # Durable Architectural Decision Records (ADR-001-xyz.md)
│   └── designs/                   # Approved EGM & OpenSpec canonical specifications
└── openspec/
    ├── config.yaml                # Configured with schema: spec-driven-with-adr
    ├── specs/                     # Source-of-truth system specifications (spec.md)
    └── changes/                   # Active feature folders (proposal.md, design.md, tasks.md)
```

### **The 4-Stage Spec-to-Code Lifecycle**

1. **Stage 1 — Brainstorm & ADR Capture (`/egm:egm-brainstorm`):**  
   * Open an Antigravity Chat session (the **Elephant**). Enforce the strict "No Code" rule.  
   * Run `/egm:egm-brainstorm <feature description>`. The Elephant interviews you on system boundaries, security constraints, and trade-offs, outputting `concepts_brief.md` and generating a formal **ADR** (`docs/adr/ADR-NNN-<title>.md`) capturing Context, Considered Options, Decision, and Consequences.  
2. **Stage 2 — Spec & Design Generation (`/egm:egm-draft` \+ OpenSpec):**  
   * Run `/egm:egm-draft` to transform the brief and ADR into structured feature artifacts inside `openspec/changes/<feature-name>/`:  
     * **`spec.md`**: Observable system behavior, inputs/outputs, security boundaries, and testable `Given/When/Then` scenarios.  
     * **`design.md`**: Technical architecture, ADK agent topology, data models, Terraform resource changes, and exact file paths to modify.  
     * **`tasks.md`**: Sequenced, verifiable implementation steps.  
3. **Stage 3 — Stateless Goldfish Adversarial Review (`/egm:egm-review`):**  
   * Run `/egm:egm-review openspec/changes/<feature-name>/design.md`.  
   * Antigravity spawns fresh, zero-context **Goldfish** subagents to execute three checks:  
     1. *Comprehension Check:* Summarizes the design back to verify zero ambiguity.  
     2. *Antagonistic Review:* Probes for edge cases, security gaps, and hidden dependencies.  
     3. *Implementation Readiness Check:* Strict Go/No-Go gate verifying all file paths and signatures are explicit.  
4. **Stage 4 — Parallel Worktree Implementation & Verification:**  
   * Once Goldfish review passes, spin up an isolated worktree via `git-glen` and hand `tasks.md` to an Antigravity execution agent.

---

## **3\. Parallel Multi-Agent Workflow with `git-glen`**

Running multiple Antigravity chat sessions or `agy` CLI agents concurrently in a single working directory leads to Git index locks and file collisions. [git-glen](https://github.com/cledoux/git-glen) isolates each agent in its own Git worktree.

1. **Keep `main` as the "Elephant" Planning Hub:** Keep your primary repository checkout on `main` strictly for drafting specs, ADRs, and reviewing PRs.  
2. **Spawn Isolated Agent Worktrees:**  
   * Once `openspec/changes/<feature>/tasks.md` is approved, create a dedicated worktree via `git-glen` (e.g., `git glen add feat/agent-telemetry`).  
   * Open a new Antigravity window scoped specifically to that worktree directory (`agy ../<repo>-wt-feat-agent-telemetry`).  
3. **Scoped Agent Execution:** Point the Antigravity chat session in that window to `@openspec/changes/<feature>/design.md` and `@openspec/changes/<feature>/tasks.md`.  
4. **Clean Up:** Once the PR is merged and specs are archived (`openspec archive`), prune the worktree via `git-glen`.

---

## **4\. Antigravity IDE, `vscodevim`, and `tmux` Ergonomics**

### **Core Extensions Baseline**

* `vscodevim.vim` (Modal editing)  
* `wesbos.theme-cobalt2` (Cobalt2 theme)  
* `hashicorp.terraform` (Infrastructure-as-Code)  
* `ms-python.python` (Python / ADK development)  
* `googlecloudtools.cloudcode` (Google Cloud integration)

### **Keybinding Collision Matrix & Fixes (Dvorak / Kinesis Safe)**

1. **Collision 1: `Ctrl` Key Hijacking in `vscodevim`**  
   * *Issue:* `vscodevim` captures `Ctrl+K`, `Ctrl+B`, and `Ctrl+F` in Normal/Insert modes, conflicting with IDE chords and panel navigation.  
   * *Fix:* Delegate essential IDE/Agent chords to Antigravity in `settings.json` via `"vim.handleKeys"`:

```
"vim.useCtrlKeys": true,
"vim.handleKeys": {
  "<C-k>": false,
  "<C-b>": false,
  "<C-f>": false
}
```

2. **Collision 2: Window Splits & Navigation (`vscodevim` vs. Antigravity Chat)**  
   * *Fix:* Map `<leader>` in `vscodevim` to trigger Antigravity's AI panels directly from Normal mode:  
     * `<leader>aa` → Focus Antigravity Chat Panel (`workbench.action.chat.open`)  
     * `<leader>ai` → Trigger Inline Agent Edit  
     * `<leader>ag` → Open Agent Manager / Subagent View  
3. **Collision 3: `tmux` Prefix inside Integrated Terminal**  
   * *Issue:* Running `tmux` for persistent sessions uses `Ctrl+B` (or `Ctrl+A`), which can collide with `vscodevim` or IDE bindings if terminal pass-through isn't configured.  
   * *Fix:* Configure `"terminal.integrated.commandsToSkipShell"` so `Cmd+` shortcuts always stay with Antigravity, while `Ctrl+` chords inside the integrated terminal pass cleanly through to `tmux`.

---

## **5\. Local-to-Cloud ADK & Google Models Workflow**

### **Model Routing Strategy (Google Models)**

* Standardize on Google model tiers via environment variables (`GOOGLE_GENAI_USE_VERTEXAI=TRUE`) so switching between fast subagent models (Gemini Flash) and deep reasoning models (Pro / Argon / Carbon) requires only a configuration toggle.

### **Inner Loop: Local Development (`adk web` & `agents-cli`)**

* **CLI Iteration:** Use `agents-cli` (`adk create` / `adk run`) for fast terminal testing of agent tools, callbacks, and prompts.  
* **Local ADK Web Playground:** Launch the local browser UI (`adk web --port 8000`) to visually inspect multi-agent handoffs, tool call payloads, state mutations, and latency traces locally at zero cloud compute cost.

### **Outer Loop: Terraform & Google Cloud Agent Platform**

* **Terraform IaC:** Provision IAM service accounts, Vertex AI / Agent Engine resources, Cloud Run services, and telemetry sinks using modular `terraform/` configurations.  
* **Cloud ADK Web Playground:** Validate deployed agents inside the **Google Cloud Console (Vertex AI Agent Engine Playground)** against production IAM permissions and live telemetry traces.

---

## **6\. Backlog / Future TODOs**

* **Archive Legacy Neovim Setup & Clean Up Symlinks:** Once Neovim is no longer needed on any active machine, audit and remove active symlinks pointing to the Neovim config and move the directory to `archive/neovim/`.  
* **Machine Bootstrap Automation:** Evaluate declarative provisioning tools such as **Ansible** to replace or modernize the legacy `setup/` scripts for personal vs. work MacBooks.  
* **Optional Multi-Provider Evaluation:** Revisit routing Claude via Vertex AI Model Garden if cross-model experimentation is needed in the future.