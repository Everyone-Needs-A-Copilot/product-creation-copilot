---
name: product-design-creation
description: Facilitates the product design conversation process — guides the user through creating a complete design package. Creates docs/ directory, conducts structured interviews, and synthesizes answers into design-ready documentation across six phases ending in a prototype.
triggers:
  keywords: ["design package", "product design", "design documentation", "facilitation", "new product", "vision document", "jtbd", "journey map", "design challenge", "prototype"]
allowed-tools: Read, Write, Edit, Glob, Grep, Bash, Agent
---

# Product Design Creation

## Overview

This skill guides the facilitated conversation process that generates a complete design package. It follows the Human-Centered Development philosophy: understand the human need first, then design for it.

The process is conversational. You ask structured questions, the user answers in their own words, and you synthesize the answers into documents. Each document has a facilitation guide embedded as HTML comments.

## Reference Documents

Read these before starting:

| Document | Path | What It Provides |
|----------|------|-----------------|
| Facilitation Process | `./REF-facilitation-process.md` | How to conduct conversations, adapt questions, synthesize answers, track progress |
| Document Sequence | `./REF-document-sequence.md` | The full structure across 6 phases with prerequisites and checkpoint checks |

## Define Done

- [ ] Template package copied into `docs/` directory
- [ ] README.md customized with product name
- [ ] All Phase 1 documents completed (vision, scope, metrics)
- [ ] At least 1 interview artifact completed
- [ ] All Phase 2 documents completed (JTBD, journeys, moments, blueprint)
- [ ] Phase 3 documents completed (user stories, use cases, acceptance criteria)
- [ ] Phase 4 documents completed (UX, UI, copy/voice)
- [ ] Design challenge brief completed
- [ ] TODO-DESIGN-PACKAGE.md status updated for all completed documents
- [ ] Design Foundation Checkpoint passes
- [ ] Design Complete Checkpoint passes
- [ ] Prototype output created in chosen format

## Instructions

### Step 1: Set Up the Project

1. Copy the template package into the project:
   ```bash
   cp -r templates/design-package/* docs/
   ```
2. Update `docs/README.md`:
   - Replace `{{PRODUCT_NAME}}` with the actual product name
   - Replace `{{PRODUCT_DESCRIPTION}}` with a one-line description
3. Read `./REF-facilitation-process.md` for how to conduct the conversations
4. Read `./REF-document-sequence.md` for the document order and prerequisites

### Step 2: Conduct the Facilitation

Follow the document sequence in `docs/TODO-DESIGN-PACKAGE.md`. This file is the primary operational resume point — it replaces the README.md status column as the tracking source of truth. For each facilitated document:

1. **Read the HTML comment** at the top of the document — it contains the facilitation guide with structured question rounds
2. **Ask the questions** in order, one round at a time
3. **Listen and probe** — follow-up questions are more valuable than the scripted ones
4. **Synthesize** the user's answers into the document sections using their own language
5. **Update TODO-DESIGN-PACKAGE.md** status to `COMPLETE` when the document is done

See `./REF-facilitation-process.md` for detailed guidance on conversation technique, adaptation, and synthesis.

### Step 3: Design Foundation Checkpoint

After Phases 1 and 2 are complete, verify the Design Foundation Checkpoint in `docs/TODO-DESIGN-PACKAGE.md`:
- Vision + scope + success metrics exist
- At least 1 completed interview artifact exists
- Journeys / JTBD / Moments That Matter exist

If anything is missing, surface what's missing and ask whether to create it now or proceed without it.

### Step 4: Continue Through Phases 3–5

After the Design Foundation Checkpoint passes, continue through requirements (user stories, use cases, acceptance criteria), experience design (UX, UI, copy/voice), and the design challenge brief.

### Step 5: Design Complete Checkpoint

After Phase 5 is complete, verify the Design Complete Checkpoint in `docs/TODO-DESIGN-PACKAGE.md`:
- All design documents complete
- Design challenge brief reviewed and approved by the user

### Step 6: Create the Prototype

After the Design Complete Checkpoint passes, the user chooses one of four prototype outputs:

| Option | Output | Best For |
|--------|--------|---------|
| Figma design | `06-prototype/00-figma-design.md` | Visual/interaction designers, stakeholder reviews |
| Design specification | `06-prototype/10-design-spec.md` | Developer handoff, implementation documentation |
| Storybook design system | `06-prototype/20-storybook.md` | Component libraries, design systems, reusable UI |
| Next.js prototype | `06-prototype/30-nextjs-prototype.md` | Working prototype, real data, testable interactions |

## Quality Tests

- [ ] Every completed document uses the user's own language, not generic templates
- [ ] Forces map uses the Moments Framework (Push, Pull, Anxiety, Habit)
- [ ] JTBD uses the canonical format: "When [situation], I want to [motivation], so I can [outcome]"
- [ ] Journey maps include struggling moments with severity ratings
- [ ] User stories include priority (P0/P1/P2) and dependencies
- [ ] Acceptance criteria are testable (Given/When/Then format)
- [ ] TODO-DESIGN-PACKAGE.md status matches actual document completion state
- [ ] Design Foundation Checkpoint and Design Complete Checkpoint reflect current pass/fail state
