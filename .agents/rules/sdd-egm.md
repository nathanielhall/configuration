---
trigger: always_on
description: Enforces Spec-Driven Development (SDD) using Google's Elephant-Goldfish Model (EGM) and OpenSpec with ADRs.
---

# Spec-Driven Development (EGM + OpenSpec + ADR) Protocol

You must strictly follow the 4-stage **Elephant-Goldfish Model (EGM)** and **OpenSpec (`spec-driven-with-adr`)** lifecycle for all feature development, architectural changes, and agent workflows.

## Stage 1: Growing the Elephant (`/egm:egm-brainstorm` — STRICT NO-CODE RULE)
- **Role:** You are the **Elephant** (long-horizon, context-rich architectural co-designer).
- **Hard Constraint:** **WRITE ZERO PRODUCTION CODE** during this stage.
- **Actions:**
  1. Interview the developer to uncover unstated assumptions, failure modes, security boundaries, and Google Cloud / ADK trade-offs.
  2. Synthesize the agreed direction into `concepts_brief.md`.
  3. Whenever a significant architectural, model-routing, or infrastructure trade-off is decided, generate a formal **Architecture Decision Record** at `docs/adr/ADR-NNN-<kebab-title>.md` containing:
     - **Status:** Proposed | Accepted | Superseded
     - **Context:** Problem statement and constraints
     - **Options Considered:** At least 2 viable alternatives with pros/cons
     - **Decision:** Chosen architecture and rationale
     - **Consequences:** Positive outcomes, risks, and follow-up actions

## Stage 2: Drafting the Specification (`/egm:egm-draft` + OpenSpec)
- **Role:** Transform the approved `concepts_brief.md` and ADR into structured OpenSpec feature artifacts inside `openspec/changes/<feature-name>/` (or `design_draft.md` prior to promotion):
  1. **`spec.md`:** Observable system behavior, ADK tool schemas, security constraints, and testable `Given / When / Then` acceptance scenarios.
  2. **`design.md`:** Technical implementation plan, agent hierarchy/callbacks, Terraform resource definitions, and the exact list of files/functions to create or modify.
  3. **`tasks.md`:** Ordered, atomic checklist of implementation and verification steps.
- Pause after each major section for developer feedback before finalizing.

## Stage 3: The Goldfish Protocol (`/egm:egm-review` — Stateless Adversarial Gate)
- **Role:** Spawn fresh, zero-context **Goldfish** subagents that have no memory of the prior conversation to audit `design.md` and `spec.md`.
- **Mandatory 3-Step Check:**
  1. **Comprehension Check:** A stateless Goldfish reads only the draft spec and summarizes the architecture back. Any ambiguity or misinterpretation requires refining the spec.
  2. **Antagonistic Review:** Skeptical Goldfish reviewers probe for race conditions, IAM over-privileging, unhandled ADK tool errors, and missing edge cases.
  3. **Implementation Readiness Check (Go/No-Go):** Verify that all file paths, data structures, and function signatures are explicit enough for deterministic transcription into code.

## Stage 4: Isolated Worktree Execution (`git-glen`)
- **Pre-Flight Check:** Confirm Stage 3 (`/egm:egm-review`) is approved.
- **Worktree Isolation:** If multiple features or agents are active, verify execution is happening inside an isolated `git-glen` worktree rather than dirtying `main`.
- **Execution:** Implement `openspec/changes/<feature-name>/tasks.md` step-by-step, checking off items only after local verification (`pytest`, `adk run`, or `terraform validate`) succeeds.