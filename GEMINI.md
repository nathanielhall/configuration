#  Project Context & Engineering Standards (v2.0)

## 1. Developer Environment & Stack
- **Primary IDE & CLI:** Google Antigravity (`agy` CLI + Antigravity App) with `vscodevim` and Cobalt2 theme.
- **Terminal & Sessions:** `tmux` is used strictly for persistent long-running sessions (SSH, `adk web`, Terraform runs).
- **Cloud & Agentic Stack:**
  - **Framework:** Google Agent Development Kit (ADK - latest stable) & `agents-cli`.
  - **Runtime & Deployment:** Local development first (`adk run` and `adk web --port 8000`), followed by Terraform deployment to Google Cloud (Vertex AI Agent Engine / Cloud Run).
  - **Models:** Standardize on Google models via Vertex AI (`GOOGLE_GENAI_USE_VERTEXAI=TRUE`). Route fast validation/subagent tasks to Flash tiers and complex architectural reasoning to Pro/Experimental tiers.
- **Git Workflow:** Parallel multi-agent worktrees managed via `git-glen`. Keep `main` clean as the "Elephant" planning hub; execute feature implementation inside isolated sibling worktrees (`../<repo>-wt-<feature>`).

## 2. Repository Directory Contract
- `GEMINI.md`: Global context and architectural guardrails.
- `.agents/rules/`: Modular Antigravity rules (`sdd-egm.md`).
- `.agents/skills/`: Reusable Antigravity `SKILL.md` definitions.
- `docs/adr/`: Durable Architectural Decision Records (`ADR-NNN-<slug>.md`).
- `docs/designs/`: Canonical approved specifications (`concepts_brief.md` and archived designs).
- `openspec/`: Spec-Driven Development workspace (`config.yaml` using `spec-driven-with-adr`, `specs/`, and `changes/<feature>/`).

## 3. Core Engineering Principles
1. **Spec-First, Never Prompt-and-Patch:** Do not write or modify production application/agent code or Terraform resources for non-trivial features without an approved specification (`spec.md`, `design.md`, `tasks.md`) and a passed Goldfish review (`/egm:egm-review`).
2. **Legacy Preservation (When in `configuration` repo):** Never move, delete, or break symlinks pointing to legacy `neovim/` or `setup/` directories unless explicitly executing the backlog archival task.
3. **Security & IAM Guardrails:** Enforce least-privilege IAM in Terraform, Workload Identity Federation for CI/CD, and explicit input/output validation across all ADK tools and callbacks.
4. **Verification Before Completion:** Every implementation task must be verified locally via `pytest`, `terraform validate`, or `adk run` before marking a task complete in `tasks.md`.