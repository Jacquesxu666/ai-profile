#!/usr/bin/env bash
# 把本档案接入本机各 AI CLI（非破坏式：目标已存在则跳过并提示，绝不覆盖）
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
  local target="$1" source="$2"
  if [ -e "$target" ] || [ -L "$target" ]; then
    echo "跳过：$target 已存在（如需替换请先手动备份）"
  else
    mkdir -p "$(dirname "$target")"
    ln -s "$source" "$target"
    echo "已链接：$target -> $source"
  fi
}

link "$HOME/.claude/CLAUDE.md" "$REPO_DIR/AGENTS.md"
link "$HOME/.codex/AGENTS.md"  "$REPO_DIR/AGENTS.md"
link "$HOME/.gemini/GEMINI.md" "$REPO_DIR/AGENTS.md"

cat <<'EOF'

粘贴类平台请手动操作（内容在 platforms/ 目录）：
- ChatGPT:            设置 → Personalization → Custom Instructions，粘贴 platforms/chatgpt-custom-instructions.md
- Claude Web/Projects: 新建 Project → Instructions，粘贴 platforms/claude-projects-context.md
- Cursor:             设置 → Rules → User Rules，粘贴 platforms/cursor-user-rules.md
- GitHub Copilot:     各项目内放 .github/copilot-instructions.md
EOF
