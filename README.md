# ai-profile — 跨 AI 个人档案（Cross-AI Personal Context）

维护一次、所有 AI 都能读的个人档案与工作偏好。基于目前主流的跨 AI 上下文规范：

- **[AGENTS.md](https://agents.md)** 事实标准 —— OpenAI Codex、Claude Code、GitHub Copilot、Gemini CLI、Cursor 等都原生读取
- **CLAUDE.md**（Claude Code 全局记忆）、**GEMINI.md**（Gemini CLI）、**User Rules**（Cursor）、**Custom Instructions**（ChatGPT）、**Project Instructions**（Claude Projects）—— 通过符号链接或粘贴接入

## 文件结构

```
ai-profile/
├── PROFILE.md    # 单一事实来源：我是谁、技术背景、沟通与工作偏好
├── AGENTS.md     # 跨 AI 行为规范（agents.md 规范），CLI 工具直接链接这一份
├── install.sh    # 一键把档案接入本机各 AI CLI（非破坏式，已存在的配置不动）
├── platforms/    # 有字数/格式限制的粘贴类平台专用版本
│   ├── chatgpt-custom-instructions.md   # ChatGPT 设置 → Custom Instructions
│   ├── claude-projects-context.md       # Claude Projects / GPTs / Gemini Gems
│   └── cursor-user-rules.md             # Cursor 设置 → Rules → User Rules
└── README.md
```

## 一键接入本机 CLI

```bash
git clone https://github.com/Jacquesxu666/ai-profile.git ~/Projects/ai-profile
~/Projects/ai-profile/install.sh
```

`install.sh` 做的事（已存在的文件一律跳过，绝不覆盖）：

| 目标 | 工具 | 方式 |
|---|---|---|
| `~/.claude/CLAUDE.md` | Claude Code | symlink → `AGENTS.md` |
| `~/.codex/AGENTS.md` | Codex CLI | symlink → `AGENTS.md` |
| `~/.gemini/GEMINI.md` | Gemini CLI | symlink → `AGENTS.md` |

粘贴类平台（ChatGPT / Claude Projects / Cursor）没有全局文件可链接，
打开 `platforms/` 里对应文件，整段复制到平台设置里即可。

## 各平台接入速查

| 平台 | 接入方式 |
|---|---|
| Claude Code | `ln -sf <repo>/AGENTS.md ~/.claude/CLAUDE.md` |
| Codex CLI | `ln -sf <repo>/AGENTS.md ~/.codex/AGENTS.md` |
| Gemini CLI | `ln -sf <repo>/AGENTS.md ~/.gemini/GEMINI.md` |
| Cursor | 设置 → Rules → User Rules，粘贴 `platforms/cursor-user-rules.md` |
| ChatGPT | 设置 → Personalization → Custom Instructions，粘贴 `platforms/chatgpt-custom-instructions.md` |
| Claude Web / Projects | Project → Instructions，粘贴 `platforms/claude-projects-context.md` |
| GitHub Copilot | 各项目内放 `.github/copilot-instructions.md`（内容可用 `platforms/` 里的通用版） |
| 其他能联网的 AI | 直接给它仓库 raw 链接：`https://raw.githubusercontent.com/Jacquesxu666/ai-profile/main/PROFILE.md` |

## 日常维护

- 改 `PROFILE.md` / `AGENTS.md` → `git push` → 所有 symlink 的 CLI **立即生效**
- 粘贴类平台内容有改动时，重贴一次对应 `platforms/` 文件
- 项目级的特殊规则写在各项目自己的 `AGENTS.md`，项目内规则优先于本档案

## 隐私说明

本仓库刻意保持「可公开」：只含工作偏好与技术背景的抽象描述，
不含真实姓名、地址、IP、凭据、内网拓扑细节。如果日后想收紧，
可在 GitHub 仓库 Settings 里一键转 Private（但网页版 AI 将无法直接 fetch raw 链接）。

## 参考

- [AGENTS.md 官方规范](https://agents.md)
- [Complete Guide to AI Agent Memory Files (CLAUDE.md / AGENTS.md)](https://medium.com/data-science-collective/the-complete-guide-to-ai-agent-memory-files-claude-md-agents-md-and-beyond-49ea0df5c5a9)
- [MSiccDev/ai-context-kit — 跨工具 AI 上下文仓库范例](https://github.com/MSiccDev/ai-context-kit)
- [CONTEXT.md living document 讨论](https://github.com/orgs/community/discussions/191257)
