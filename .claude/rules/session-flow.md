# Session Flow, Phase Transitions, and Prototype Output

## Getting started

When the user starts a new session, check their state:

1. Does `docs/TODO-DESIGN-PACKAGE.md` exist in their project? If not, this is a new product: run the quickstart setup (`quickstart.md`). In this repo, `docs/01-architecture/` and `docs/40-initiatives/` are framework scaffolding, not the user's design package, so do not treat their presence as previous work.
2. If `docs/TODO-DESIGN-PACKAGE.md` exists, read it to find where they left off.
3. Is there an active document marked IN PROGRESS? Resume from the session break point.

If uncertain, ask: "Is this a new product or are you continuing previous work?"

## Session management

- Primary resume point: `docs/TODO-DESIGN-PACKAGE.md`.
- When pausing mid-document: synthesize what's been discussed, mark the document IN PROGRESS, and add `<!-- SESSION BREAK: Completed through Round [X]. Resume at Round [Y]. -->`.
- When resuming: read the TODO tracker, find the first NOT STARTED or IN PROGRESS document, and brief the user on where they are before asking anything.

## With or without Claude Copilot

At the start of every new session, check whether Claude Copilot is installed:

```bash
ls ~/.claude/copilot/CLAUDE.md 2>/dev/null && echo "COPILOT_AVAILABLE" || echo "NO_COPILOT"
```

If COPILOT_AVAILABLE:

- Use framework agents (`sd`, `uxd`, `uids`, `uid`) for specialized work.
- Use `cc memory` for session persistence and `tc` for progress tracking, alongside `docs/TODO-DESIGN-PACKAGE.md`.
- Say: "I see you have Claude Copilot installed. I'll use specialized agents for better results."

If NO_COPILOT:

- Work as a single facilitator playing all roles.
- Use `docs/TODO-DESIGN-PACKAGE.md` for progress tracking.
- After a few sessions, suggest: "Claude Copilot would enhance this process with persistent memory and specialized design agents. Want to learn more?"

## Phase transitions

After each phase completes, brief the user on what comes next before starting:

| Transition | What to Say |
|------------|------------|
| Phase 1 → 2 | "Vision is set. Now we research, starting with a self-interview about who your users are." |
| Phase 2 → soul DRAFT | "Service design is done. Before requirements, we'll distill the product's soul: a decision instrument that captures what this product is and refuses to be, and a filter every future feature has to pass." |
| Phase 2 → 3 | "Soul is drafted. Now we turn those insights into requirements, and we'll check every decision against the soul as we go." |
| Phase 3 → 4 | "Requirements done. Now experience design: UX, UI, and voice." |
| Phase 4 → 5 | "Experience design done. Last step before prototype: the design challenge brief." |
| Phase 5 → soul RATIFY | "Brief is approved. Now we ratify the soul, locking the feature filter and founding decisions with the real calls we've made across every phase." |
| Phase 5 → 6 | "Soul is ratified. Time to create your prototype. What format do you want?" |

## Prototype output

After Phase 5, the user chooses their output format:

1. **Figma Design:** use the Figma MCP server to create designs. Read `docs/06-prototype/00-figma-design.md` for the process.
2. **Design Spec:** create a comprehensive design specification document. Read `docs/06-prototype/10-design-spec.md`.
3. **Storybook:** create a component library. Read `docs/06-prototype/20-storybook.md`.
4. **Next.js Prototype:** create a working prototype. Read `docs/06-prototype/30-nextjs-prototype.md`.

If the user isn't sure which to choose, help them decide:

| If they want... | Suggest |
|-----------------|---------|
| To hand off to a developer | Design Spec |
| To test interactions quickly | Next.js Prototype |
| To build a component library | Storybook |
| To present to stakeholders visually | Figma Design |
