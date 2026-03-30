#!/bin/bash
# preflight.sh — Dependency checker for Product Creation Copilot
# macOS only. Run this before starting the quickstart process.

# ── Colors ────────────────────────────────────────────────────────────────────
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
RESET='\033[0m'

PASS="${GREEN}✓${RESET}"
FAIL="${RED}✗${RESET}"
WARN="${YELLOW}~${RESET}"

# ── Counters ──────────────────────────────────────────────────────────────────
required_failures=0
missing_required=()

# ── Helpers ───────────────────────────────────────────────────────────────────
check_required() {
  local label="$1"
  local version_cmd="$2"
  local install_hint="$3"

  local version
  version=$(eval "$version_cmd" 2>/dev/null)

  if [[ -n "$version" ]]; then
    echo -e "  ${PASS} ${label} ${version}"
  else
    echo -e "  ${FAIL} ${label} — not found"
    echo    "    → Install: ${install_hint}"
    (( required_failures++ ))
    missing_required+=("${label}")
  fi
}

check_optional() {
  local label="$1"
  local found="$2"      # "true" or "false"
  local hint="$3"
  local detail="$4"     # optional second hint line

  if [[ "$found" == "true" ]]; then
    echo -e "  ${PASS} ${label}"
  else
    echo -e "  ${WARN} ${label} — not configured"
    [[ -n "$hint" ]]   && echo "    → ${hint}"
    [[ -n "$detail" ]] && echo "    → ${detail}"
  fi
}

# ── Header ────────────────────────────────────────────────────────────────────
echo ""
echo "Product Creation Copilot — Preflight Check"
echo "────────────────────────────────────────────"
echo ""
echo "Required:"

# ── 1. Homebrew ───────────────────────────────────────────────────────────────
brew_version=$(brew --version 2>/dev/null | head -1 | awk '{print $2}')
if [[ -n "$brew_version" ]]; then
  echo -e "  ${PASS} Homebrew ${brew_version}"
else
  echo -e "  ${FAIL} Homebrew — not found"
  echo    "    → Install: /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
  (( required_failures++ ))
  missing_required+=("Homebrew")
fi

# ── 2. Node.js ────────────────────────────────────────────────────────────────
check_required "Node.js" "node --version" "brew install node"

# ── 3. npm ────────────────────────────────────────────────────────────────────
check_required "npm" "npm --version" "Comes with Node.js — reinstall Node: brew install node"

# ── 4. git ────────────────────────────────────────────────────────────────────
check_required "git" "git --version | awk '{print \$3}'" "brew install git"

# ── 5. GitHub CLI ─────────────────────────────────────────────────────────────
check_required "GitHub CLI" "gh --version 2>/dev/null | head -1 | awk '{print \$3}'" "brew install gh"

# ── 6. GitHub CLI auth ────────────────────────────────────────────────────────
if gh auth status &>/dev/null; then
  account=$(gh auth status 2>&1 | grep -o 'account [^ ]*' | head -1 | awk '{print $2}')
  if [[ -n "$account" ]]; then
    echo -e "  ${PASS} GitHub CLI auth (${account})"
  else
    echo -e "  ${PASS} GitHub CLI auth"
  fi
else
  echo -e "  ${FAIL} GitHub CLI auth — not logged in"
  echo    "    → Run: gh auth login"
  (( required_failures++ ))
  missing_required+=("GitHub CLI auth")
fi

# ── 7. Claude Code ────────────────────────────────────────────────────────────
claude_version=$(claude --version 2>/dev/null | head -1)
if [[ -z "$claude_version" ]]; then
  # fall back to which in case --version isn't supported
  claude_path=$(which claude 2>/dev/null)
  [[ -n "$claude_path" ]] && claude_version="(found at ${claude_path})"
fi

if [[ -n "$claude_version" ]]; then
  echo -e "  ${PASS} Claude Code ${claude_version}"
else
  echo -e "  ${FAIL} Claude Code — not found"
  echo    "    → Install: npm install -g @anthropic-ai/claude-code"
  (( required_failures++ ))
  missing_required+=("Claude Code")
fi

# ── Optional ──────────────────────────────────────────────────────────────────
echo ""
echo "Optional:"

# ── 8. Claude Copilot ─────────────────────────────────────────────────────────
if [[ -f "$HOME/.claude/copilot/CLAUDE.md" ]]; then
  copilot_found="true"
else
  copilot_found="false"
fi
check_optional \
  "Claude Copilot" \
  "$copilot_found" \
  "Enhances experience with persistent memory and specialized agents" \
  "Install: https://github.com/Everyone-Needs-A-Copilot/claude-copilot"

# ── 9. Figma MCP ──────────────────────────────────────────────────────────────
figma_found="false"

# Check project-local .mcp.json
if [[ -f ".mcp.json" ]] && grep -qi "figma" ".mcp.json" 2>/dev/null; then
  figma_found="true"
fi

# Check Claude Code's global MCP config locations
for config_path in \
  "$HOME/.claude/claude_desktop_config.json" \
  "$HOME/Library/Application Support/Claude/claude_desktop_config.json" \
  "$HOME/.config/claude/claude_desktop_config.json"
do
  if [[ -f "$config_path" ]] && grep -qi "figma" "$config_path" 2>/dev/null; then
    figma_found="true"
    break
  fi
done

check_optional \
  "Figma MCP" \
  "$figma_found" \
  "Needed only if you choose Figma for Phase 6 prototype output"

# ── Summary ───────────────────────────────────────────────────────────────────
echo ""
echo "────────────────────────────────────────────"

if [[ "$required_failures" -eq 0 ]]; then
  echo -e "${GREEN}All prerequisites met. Ready to start!${RESET}"
  echo ""
  exit 0
else
  echo -e "${RED}${required_failures} prerequisite(s) missing. Install them above, then run this check again.${RESET}"
  echo ""
  echo "Missing:"
  for item in "${missing_required[@]}"; do
    echo -e "  ${FAIL} ${item}"
  done
  echo ""
  exit 1
fi
