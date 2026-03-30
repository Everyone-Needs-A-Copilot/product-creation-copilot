# Product Creation Copilot

A guided AI process that takes you from product idea to finished design — through conversation, not configuration. You answer questions, Claude synthesizes your answers into design documentation, and at the end you choose your output: a Figma design, a design spec for developers, a Storybook component library, or a working Next.js prototype.

No prior experience with Claude Code or AI tools required.

---

## What You'll Need

- **A Mac** — this project is built for macOS
- **An Anthropic API key** — get one at [console.anthropic.com](https://console.anthropic.com)
- **git and a GitHub account** — to clone and work with this project
- **A product idea** — rough is fine, even a sentence is enough to start

The preflight check (Step 3 in Setup) will verify all technical prerequisites and help you install anything missing.

---

## Setup

### Step 1: Open Terminal

Press `Command + Space` to open Spotlight, type **Terminal**, and press Enter.

Or go to: **Applications → Utilities → Terminal**

You'll see a window with a blinking cursor. That's where you type commands.

---

### Step 2: Navigate to This Project

In Terminal, navigate to wherever you cloned or downloaded this project:

```
cd path/to/product-creation-copilot
```

Not sure where it is? Type `ls ~/Desktop` or `ls ~/Documents` to look around.

---

### Step 3: Run the Preflight Check

```
bash scripts/preflight.sh
```

This checks all prerequisites — Node.js, Claude Code, and anything else required — and tells you exactly what's missing and how to install it. If everything passes, you're ready to go.

---

### Step 4: Start Claude Code

```
claude
```

Claude Code will ask for your Anthropic API key the first time you run it. Get one at [console.anthropic.com](https://console.anthropic.com) if you don't have one yet. Paste it in and press Enter.

---

### Step 5: Begin the Process

Once Claude Code is running, type this and press Enter:

```
Read quickstart.md and let's begin.
```

Claude will read the project instructions and start the facilitated design process with you.

---

## How It Works

The process moves through six phases. Each one builds on the last.

**Phase 1: Discovery**
Claude asks you about your product idea — what problem it solves, who it's for, what success looks like. You answer in your own words.

**Phase 2: Research**
You'll do a self-interview. Claude maps out user journeys and the jobs your product helps people get done.

**Phase 3: Requirements**
Claude turns your insights into user stories and scenarios — a structured picture of what the product needs to do.

**Phase 4: Experience Design**
Together you define the UX patterns, visual style, and voice/tone of your product.

**Phase 5: Design Challenge**
Claude synthesizes everything into a design brief — a single document that captures your full vision.

**Phase 6: Prototype**
You choose your output format, and Claude creates it.

---

## What You Get

At the end of the process, choose one of these outputs:

| Output | What It Is | Best For |
|--------|-----------|----------|
| **Figma Design** | Complete design delivered into Figma via MCP | Designers who work in Figma |
| **Design Spec** | Design tokens, components, and layout documentation | Handing off to a development team |
| **Storybook** | Interactive component library | Teams using component-driven development |
| **Next.js Prototype** | Working, clickable prototype | Demos, user testing, investor pitches |

---

## Enhancing Your Experience (Optional)

This project was built on **Claude Copilot** — a framework that adds persistent memory and specialized AI agents to Claude Code.

Without it, the project works great for a single session. With it, Claude remembers your product across sessions, uses expert agents for each phase (service design, UX, visual design, frontend), and tracks your progress over time.

**Check if you already have it:**

```
ls ~/.claude/copilot/CLAUDE.md
```

If the file exists, you have it. If you see "No such file or directory," you don't — yet.

**To install it:**
Visit [github.com/everyone-needs-a-copilot/claude-copilot](https://github.com/everyone-needs-a-copilot/claude-copilot) for setup instructions. Or ask the person who gave you this project — they can walk you through it.

This is completely optional. The project works without it.

---

## Tips for Great Results

- **Answer in your own words.** Don't try to sound technical or formal. The more natural your answers, the better the output.
- **If you don't know something, say so.** Claude will note it as an open question and keep moving.
- **You can pause anytime.** Say "Let's pause here and save progress" and Claude will document where you are.
- **The process builds on itself.** Each phase makes the next one richer. Skipping is allowed, but you'll get more out of staying with it.
- **You don't have to get it right the first time.** You can revisit earlier answers if something changes.

---

## Resuming Work

If you close Terminal and come back later, start here:

```
cd /path/to/product-creation-copilot
claude
```

Then say:

```
Check docs/TODO-DESIGN-PACKAGE.md for where I left off.
```

Claude will read the progress file and pick up from your last stopping point.

---

## Troubleshooting

**"command not found: claude"**
Claude Code didn't install correctly. Try running `npm install -g @anthropic-ai/claude-code` again. If npm itself isn't found, re-run the preflight check (`bash scripts/preflight.sh`) — it will tell you what's missing.

**"API key not working" or authentication errors**
Go to [console.anthropic.com](https://console.anthropic.com) and check two things: that your API key is active, and that you have a positive credit balance under Billing.

**"I'm stuck in the conversation and don't know what to do"**
Type: `Let's pause here and save progress` — Claude will document your current state. You can restart the session fresh or continue from there.

**"I want to start over"**
Say: `Archive the current docs folder and let's start the process from the beginning.` Claude will move your existing work to an archive so nothing is lost, then restart.

**"I'm getting an error I don't understand"**
Copy the exact error message and ask Claude: `I'm seeing this error: [paste error]. What should I do?` Claude can usually diagnose it.

---

## License

This project is licensed under [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/) (Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International).

**You are free to:**
- Use this framework for your own products and projects
- Share it with others
- Adapt and build on it

**Under these terms:**
- **Attribution** — Credit "Everyone Needs A Copilot" and link to this repository
- **NonCommercial** — You may not use this framework to build commercial services, courses, or consulting offerings without permission
- **ShareAlike** — If you build on this framework, share your additions under the same license

**What counts as commercial use?** Selling a product you designed using this framework is fine — that's what it's for. Packaging this framework itself (or derivatives of it) as a paid service, course, template kit, or consulting methodology requires a commercial license.

**Want a commercial license?** Open an issue or reach out to discuss.

The philosophy, facilitation methodology, and AI-native design process in this project are original work by [Everyone Needs A Copilot](https://github.com/Everyone-Needs-A-Copilot).
