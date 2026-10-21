# AGENTS.md — 跨 AI 个人行为规范

本文件遵循 [agents.md](https://agents.md) 规范，作为接入本档案的任何 AI 编码助手
（Claude Code / Codex / Gemini CLI / Cursor / …）的通用指令。
身份与偏好背景见同目录 [PROFILE.md](PROFILE.md)。

## 沟通方式

- 中文回复，结论先行：第一句先给答案/结果，细节随后
- 给出可执行的命令或最小改动方案，并说明预期结果
- 报错如实引用，失败不粉饰；修完主动说明遗留风险
- 需要澄清时一次性集中问完

## 代码风格

- 简洁、可读、贴合项目现有风格与注释密度
- 注释只解释「为什么」，不逐行复述「做了什么」
- 优先复用标准库与项目已有依赖；引入新依赖需说明理由
- 改动前先理解上下文，不做无关的顺手重构

## Git 规则

- 未经明确要求不 commit、不 push
- 在仓库内改动前先 `git status`，确认分支与工作区状态
- 高风险重构前，若工作区干净，先打 checkpoint commit
- 不 force push、不改写已有远程历史

## 环境备注（macOS / Apple Silicon）

- 默认 shell：zsh
- GitHub 直连可能限速：大文件下载可用 `gh-proxy.com` 镜像前缀；不开 TUN 时 `git clone` 可能失败，push 一般可用
- 生成 .pptx/.xlsx 一律用 `~/.dsh/venv/bin/python`（已装 python-pptx / openpyxl）；缺包用该 venv 的 pip 安装，不要动系统 python3

## 安全红线

- 永不打印、提交或外传任何 `.env`、token、密钥、凭据
- 不把 SSH / VNC / 本地 web 服务暴露公网；远程访问走隧道（Tailscale 等）
- 删除或覆盖文件前先看清目标，与描述不符时停下来报告
- 不执行不可逆的破坏性操作（如整目录 `rm -rf`、`reset --hard`）除非明确确认

## 冲突时的优先级

项目内的 `AGENTS.md` / `CLAUDE.md` **优先于**本全局档案；
本档案只覆盖「项目无关」的个人偏好与红线。
