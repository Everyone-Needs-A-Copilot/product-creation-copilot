# Product Design Creation Quickstart

> **Purpose:** The single entry point for starting or restarting the product design creation process.
> **How to use:** Tell Claude Code: "Read quickstart.md and let's begin."

---

## What Is This?

This is the instruction set for creating a complete product design package — the documents that define what a product is, who it's for, how it looks and feels, and what the prototype should be. The package is created through facilitated conversations where Claude asks questions and synthesizes your answers into structured design documentation.

The template package lives at: `templates/`

The facilitation skill (conversation technique, synthesis rules, document sequence) lives at: `skills/`

**The six phases:**

| Phase | Focus | Output |
|-------|-------|--------|
| 1: Discovery | Vision, scope, metrics | 3 documents |
| 2: Research & Service Design | Interviews, JTBD, journey maps, moments that matter, service blueprint | 5 documents |
| After Phase 2 — Soul DRAFT | Distil the product's soul: IS/IS-NOT, design principles, anti-patterns, Feature Filter | `SOUL.md` at project root (DRAFT v0.1) — north star for Phases 3–5 |
| 3: Requirements | User stories, use cases, acceptance criteria | 3 documents |
| 4: Experience Design | UX design, UI design, copy and voice | 3 documents |
| 5: Design Challenge | Creative brief | 1 document |
| After Phase 5 — Soul RATIFY | Lock case law, founding decisions, principle priority order | `SOUL.md` updated to RATIFIED v1.0 — decision instrument locked before prototype |
| 6: Prototype | Figma / design spec / Storybook / Next.js | Your choice |

---

## Preflight Check

Before starting, verify you have the required tools installed. Run the preflight check script:

```bash
bash scripts/preflight.sh
```

The preflight check verifies: Homebrew, Node.js, npm, git, GitHub CLI (gh), GitHub authentication, and Claude Code. It also checks for optional enhancements like Claude Copilot and Figma MCP.

**What happens next:**

- If all required checks pass: proceed to "Choose Your Path" below
- If any required checks fail: Claude will help you install the missing tools before continuing
- Optional items (Claude Copilot, Figma MCP) can be set up later — they are not needed to start

---

## Choose Your Path

### Path 1: New Product (Start Fresh)

Use this when you have a new product idea and no prior design documentation.

**Step 1: Confirm the project directory**

Ask: "What is the path to your project directory?"

If working inside this project itself, `docs/` will be created here.

**Step 2: Create the docs directory**

```bash
mkdir -p <PROJECT_PATH>/docs
```

**Step 3: Copy the template package**

```bash
cp -r templates/* <PROJECT_PATH>/docs/
```

**Step 4: Customize placeholders**

In the copied files, replace these placeholders:
- `{{PRODUCT_NAME}}` — the actual product name (e.g., "Atlas", "Relay")
- `{{PRODUCT_DESCRIPTION}}` — a one-line description

Use these commands to replace all at once:

```bash
cd <PROJECT_PATH>/docs
find . -type f -name "*.md" -exec sed -i '' 's/{{PRODUCT_NAME}}/<ACTUAL_NAME>/g' {} +
find . -type f -name "*.md" -exec sed -i '' 's/{{PRODUCT_DESCRIPTION}}/<ACTUAL_DESCRIPTION>/g' {} +
```

**Step 5: Begin facilitation**

Read `<PROJECT_PATH>/docs/TODO-DESIGN-PACKAGE.md` — this is the operational status tracker. Find the first document marked `NOT STARTED` and start there.

Load the skill for detailed facilitation instructions:
```
skills/SKILL.md
```

Start with Phase 1, Document 1: `docs/01-discovery/00-vision.md`

---

### Path 2: Existing Work (Resume or Restart)

Use this when a project already has design documentation but it doesn't follow the template structure, or work was started without templates and needs to be reorganized.

**Step 1: Assess what exists**

Read the project's current `docs/` directory:

```bash
find <PROJECT_PATH>/docs/ -type f -name "*.md" | sort
```

Identify what content exists and is worth preserving. Look for:
- Vision or product overview documents
- User research, interview notes
- Journey maps, JTBD, service design artifacts
- User stories or requirements
- UX or UI design notes, wireframe descriptions
- Copy, voice, or tone guidelines
- Any design challenge or creative brief material

**Step 2: Archive the existing docs**

Do NOT delete existing work. Move it to an archive first:

```bash
mkdir -p <PROJECT_PATH>/docs/_archive/$(date +%Y%m%d)-pre-template
cp -r <PROJECT_PATH>/docs/* <PROJECT_PATH>/docs/_archive/$(date +%Y%m%d)-pre-template/ 2>/dev/null
```

**Step 3: Copy the template package**

```bash
cp -r templates/* <PROJECT_PATH>/docs/
```

This overlays the template structure. Existing files that match template paths will be overwritten — the originals are safe in the archive.

**Step 4: Customize placeholders**

Same as Path 1, Step 4 — replace `{{PRODUCT_NAME}}` and `{{PRODUCT_DESCRIPTION}}`.

**Step 5: Migrate existing content**

For each archived document that contains real content (not just stubs):

1. Read the archived version
2. Read the corresponding new template version (which has the facilitation guide structure)
3. Map the existing content into the correct sections of the new template
4. If existing content fully covers a section, fill it in and mark that section done
5. If existing content is partial, fill in what exists and add `<!-- TODO: [what's missing] -->`
6. Update `TODO-DESIGN-PACKAGE.md` status for each document

**Migration mapping guide:**

| If the archive has... | It maps to... |
|----------------------|--------------|
| Vision, overview, product description | `01-discovery/00-vision.md` |
| Scope, boundaries, non-goals | `01-discovery/10-scope-and-non-goals.md` |
| Metrics, KPIs, success criteria | `01-discovery/20-success-metrics.md` |
| Interview notes, user research | `02-research/10-interviews/` |
| JTBD, jobs to be done | `02-research/20-jtbd.md` |
| Journey maps, user flows | `02-research/30-journey-maps.md` |
| Moments that matter | `02-research/40-moments-that-matter.md` |
| Service blueprint | `02-research/50-service-blueprint.md` |
| User stories | `03-requirements/10-user-stories.md` |
| Use cases, scenarios | `03-requirements/20-use-cases.md` |
| Acceptance criteria | `03-requirements/30-acceptance-criteria.md` |
| UX design, information architecture | `04-experience/10-ux-design.md` |
| UI design, visual direction | `04-experience/20-ui-design.md` |
| Copy, voice, tone | `04-experience/30-copy-voice.md` |
| Design challenge, creative brief | `05-design-challenge/00-brief.md` |

**Step 6: Resume facilitation**

Read `<PROJECT_PATH>/docs/TODO-DESIGN-PACKAGE.md` — find the first document that is `NOT STARTED` or `IN PROGRESS` and continue from there.

For `IN PROGRESS` documents: read the content, identify which facilitation rounds have already been answered, and pick up at the next unanswered round.

---

## After Setup: How the Facilitation Works

1. Each document has a **facilitation guide** embedded as HTML comments
2. Claude asks the questions from the guide, one round at a time
3. You answer in your own words
4. Claude synthesizes your answers into the document
5. Status is updated in `TODO-DESIGN-PACKAGE.md`
6. Move to the next document in sequence

**Phases 1–5** (Discovery through Design Challenge) are facilitated — you provide the content through conversation.

**Phase 6** (Prototype) is creation mode — Claude builds the output you choose based on everything documented in Phases 1–5.

**Resuming in a new session:** Say "Check docs/TODO-DESIGN-PACKAGE.md for where I left off."

---

## Choosing Your Prototype Output

After Phase 5 is complete, you choose how to bring your design to life:

| Output | What You Get | What You Need |
|--------|-------------|--------------|
| Figma Design | Complete UI layouts in Figma | Figma account + Figma MCP server configured (not covered by preflight) |
| Design Spec | Token, component, and layout documentation | Nothing extra |
| Storybook | Interactive component library | Node.js (verified by preflight) |
| Next.js Prototype | Working clickable application | Node.js (verified by preflight) |

Not sure which to choose? Tell Claude what you want to do with the output and it will recommend the right format.

---

## Reference

| Resource | Path | Purpose |
|----------|------|---------|
| Template package | `templates/` | Document templates to copy into `docs/` |
| Facilitation skill | `skills/SKILL.md` | How to conduct conversations and synthesize answers |
| Progress tracker | `docs/TODO-DESIGN-PACKAGE.md` | Operational status for all documents |
| Project instructions | `CLAUDE.md` | How Claude behaves in this project (auto-loaded) |
| Soul template | `templates/SOUL.md` | Template for the root-level decision instrument (copied to project root as `SOUL.md`) |
| Soul facilitation guide | `skills/REF-soul-file.md` | Per-section interview questions, synthesis rules, and Define-Done bar for SOUL.md |
| Soul retrofit skill | `skills/SKILL-soul-retrofit.md` | Creating SOUL.md for a project that already has documentation or code |
| Figma prototype guide | `docs/06-prototype/00-figma-design.md` | Created during setup when Figma is chosen |
| Design spec guide | `docs/06-prototype/10-design-spec.md` | Created during setup when spec is chosen |
| Storybook guide | `docs/06-prototype/20-storybook.md` | Created during setup when Storybook is chosen |
| Next.js guide | `docs/06-prototype/30-nextjs-prototype.md` | Created during setup when Next.js is chosen |
