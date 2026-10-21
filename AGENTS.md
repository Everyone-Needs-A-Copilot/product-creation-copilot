# Agent Instructions

## Project Overview

- Project: `Product Creation Copilot`
- Description: A guided, conversation-driven product design process for Claude Code: Claude facilitates a product designer from idea through research, service design, the product's soul, requirements, experience design, and a design challenge brief to a prototype (Figma, design spec, Storybook, or Next.js).
- Stack: Markdown document templates and facilitation skills run inside Claude Code; Bash preflight script (macOS)

## Project-Specific Rules

- In a facilitation session you are a Service Designer facilitating product discovery for a user who may be new to Claude Code: ask one question at a time, synthesize in the user's own words, and never invent what they did not say. Role, technique, and synthesis rules: `.claude/rules/facilitation.md`.
- Session start state check, pause and resume markers, the Copilot-installed check, phase-transition briefings, and the prototype-format choice: `.claude/rules/session-flow.md`.
- `docs/TODO-DESIGN-PACKAGE.md` in the user's project is the primary progress tracker and resume point. `quickstart.md` is the setup and resume procedure; `skills/SKILL.md` holds the detailed facilitation instructions.
- File locations: document templates in `templates/` (copied into the user's `docs/` during setup); facilitation skills in `skills/`; prototype guides in `docs/06-prototype/` once copied from `templates/06-prototype/`.
- Each product's `SOUL.md` lives at its project root, not in `docs/`: DRAFT v0.1 after Phase 2, RATIFIED v1.0 after Phase 5. Template: `templates/SOUL.md`. Facilitation guide for a new project: `skills/REF-soul-file.md`. Retrofit onto an existing project: `skills/SKILL-soul-retrofit.md`.
- This repo's own root `SOUL.md` (RATIFIED v1.0) is the decision instrument for changes to Product Creation Copilot itself; run proposed features through its Feature Filter. `docs/01-architecture/12-architecture-guiding-principles.md` is the technical lens. Say so when either changes the route.
- Users run `bash scripts/preflight.sh` to verify prerequisites; keep it working for a first-time macOS user.
- Keep shared project requirements consistent between CLAUDE.md and AGENTS.md; preserve their scope and keep tool-specific instructions in the appropriate entrypoint.

- When following `.claude/rules/session-flow.md` in Codex, retain its facilitation, resume, checkpoint, and prototype-choice workflow. Replace the Claude installation probe and automatic agent delegation with the actual skills available in this Codex session; apply them locally.
- Before work in a domain named above, read its referenced `.claude/rules/` document. Where it declares `paths:`, apply it only to those paths; where it names a workflow, apply it only during that workflow. Those conditions require explicit reading in Codex, not Claude-style automatic loading.

## Project Commands

- On macOS, run `bash scripts/preflight.sh` from the root for documented prerequisite checks; read `quickstart.md` for setup and resume. This repository ships Markdown facilitation templates, so application dev/build commands belong to the chosen prototype, not this root.

## Instruction Scope

- Check applicable nested `AGENTS.md` / `AGENTS.override.md` before working in a subtree. Preserve scoped rules; references and Claude `paths:` frontmatter are not automatic Codex imports.
- Keep shared project requirements consistent with `CLAUDE.md` when present; preserve scope and keep tool-specific routing separate. Do not import either whole entrypoint into the other.

## Codex Copilot

- Use relevant skills exposed in this session. `$protocol` and specialist names are shorthand, not shell commands or requests to spawn agents. Read only task-relevant skills/references.
- Start with `$protocol` unless the specialist is obvious; use `$launcher` when routing is unclear. Apply playbooks locally; if unavailable in the session, inspect `plugins/codex-copilot/skills/<name>/SKILL.md`. Report missing capabilities.

## Output Contract

- Lead with the answer, decision, result, or blocker. Default to 6 sentences or 5 bullets; expand when completeness requires it. Preserve findings, uncertainty, citations, QA evidence, safety warnings, Task/WP identifiers, and blockers.
- For real decisions, give 2–3 concrete outcome options and a short question. Do not manufacture decisions or ask again for authorized work.
- Keep progress brief and material. Report outcome, changed scope, verification, and limitations at completion; store detail in `tc` work products.

## `cc` CLI

- Use `cc` for memory, skills, Live Docs, and configuration; `tc` for tasks/work products. The retired Copilot MCP servers and their `initiative_*`, `memory_*`, and `skill_*` tools do not exist.
- Prefer `$HOME/.local/bin/cc`; verify bare `cc` is not the C compiler. Source: Claude Copilot `tools/cc/`. Config: `.claude/cc/config.json`; memory: `.claude/memory/entries/`.
- When configuration is needed, run `eval "$($HOME/.local/bin/cc env)"`; use returned values instead of machine-specific paths.

## Live Docs

- Before planning or implementing against an installed third-party package API, run `$HOME/.local/bin/cc docs get <package> --topic <area> --json`.
- If `cc docs` is unavailable, state the limitation and verify against local package files or official documentation before coding.

## Knowledge and Optional Context

- For brand, voice, product, or methodology knowledge, hydrate `cc env`; follow project consumption-contract pointers through comma-separated `CC_KNOWLEDGE_REPOS`, nearest tier first, reading the first matching sub-path. Never use singular `CC_KNOWLEDGE_REPO` for sub-path lookup. Report missing sources; never invent company facts.
- Before `cc skill select`, read `plugins/codex-copilot/skills/specialist-agents/references/shared-behaviors.md`, section `Optional Context`. Follow its load-once, receipt, and fallback rules; mandatory instructions are never relevance-filtered.

## Task Management

- Track substantial work in `tc` PRDs/tasks and store detailed work products there; create missing records. Use `cc memory` for durable decisions and lessons.
- Prefer `tc`, then `./.venv-tc/bin/tc`; use `--json` where supported. Read `plugins/codex-copilot/skills/task-copilot/SKILL.md` when managing tasks.
- Batch three or more related operations using `tc.api`, or separately `cc.api`, with a verified interpreter. Never mix these APIs in one process.
- Formal initiatives belong in `docs/40-initiatives/NN-slug/`, indexed in `docs/40-initiatives/README.md`, with `README.md`, `phases/`, `decisions/`, and `retrospectives/`. Markdown holds durable rationale/evidence; `tc` owns live state. Never create `docs/initiatives/`.

### QA Gate Convention

- For verification-required implementation, set `metadata.requiresQa=true` and register observable criteria and source scope with `tc task contract <id> --file <path>` (`schemaVersion: 2`) before implementing.
- `$me` stores implementation evidence; `$qa` verifies it. Read their installed evidence contracts for those tasks.
- Capture `tc task evidence-identity <id>` before and after checks, preserve the exact `IDENTITY:` line, and rerun affected checks if the tested content changes.
- Store a task-bound `test` work product with matching `CRITERION:` / `EXPECTED:`, actual observations, inspectable `ARTIFACT:` evidence, untested scope, and one `VERDICT:`. Missing required behavior, bare markers, or stale evidence cannot support approval.
- Before completion, run `tc task check-qa <id> --json` and the setup-installed `scripts/copilot-gate.sh --task <id>`. Never remove `requiresQa` to bypass QA; installed hooks alone prove neither enforcement nor approval.

## Framework Rules

- Experience work starts with `$sd` / `$uxd`; visual direction uses `$uids` before `$uid`. Architecture and non-trivial technical work use `$ta`; `$me` implements and `$qa` verifies.
- Bugs follow `$qa -> $me -> $qa`; security-sensitive work includes `$sec`; infrastructure changes needing implementation follow `$do -> $me -> $qa`.
- Keep changes focused, preserve user work, omit time estimates, and respect the user's authorization and review boundaries.
- Use `spawn_agent` only when the user explicitly requests delegation, subagents, or parallel agent work.

### Delegating to Subagents

- Do not end a subagent prompt with an enumerated reporting checklist.
- The standing return contract is at most three sentences: outcome, root cause if known, and anything anomalous or requiring a decision. Put full evidence in a file and return its path.
- Surface every safety-relevant anomaly in those three sentences; never bury it only in the evidence file.
- Request more depth only when the decision genuinely depends on it.

## Debugging Discipline

When an explanation conflicts with a measurement, follow the measurement and narrow the investigation.

1. Confirm a mechanism exists in the relevant environment, plan, or account before naming it as the cause.
2. State what every diagnostic exercised, including the selected key, config, binary, branch, interpreter, and working directory when relevant.
3. Count failures through one shared dependency as one observation unless that dependency is varied.
4. After two hypotheses are falsified, stop hypothesizing. Read the code that enforces the behavior and cite `file:line`.

## Decision Instruments

- Read `SOUL.md` before substantial product-facing work to decide whether the direction belongs here; report missing or unfilled purpose rather than inventing it.
- Read `docs/01-architecture/12-architecture-guiding-principles.md` for durable architecture, migration, data, security, performance, or AI pipeline decisions. Report a missing reference and use verified project authority.
- When either instrument changes the route, state that before continuing.
