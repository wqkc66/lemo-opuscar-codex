# Lemo-Opuscar for Codex

A Chinese-first Codex skill package for choosing and using the 59 visual styles in [Lemo-Opuscar](https://github.com/lemomo-ai/lemo-opuscar). The upstream project is built for Claude Code; this package adapts the workflow for Codex and retains attribution and the upstream MIT license.

## Install on this PC

Windows PowerShell, for all projects:

```powershell
.\install.ps1
```

For the current project only:

```powershell
.\install.ps1 -Scope project
```

macOS/Linux:

```sh
./install.sh
./install.sh project
```

Restart Codex after installing. Ask, for example, “用水彩笔刷风格，为家乡的茶园做一支 30 秒短片方案” or “帮我挑一个适合产品拆解的风格”.

The skill index works offline. To load an upstream style's complete prompt, use Python 3:

```powershell
python scripts/get_style.py --style watercolor
```

The fetched style is cached locally for later offline use.

## Share online

This folder is a GitHub-ready repository. Create a repository under your account, then run:

```sh
git init
git add .
git commit -m "Add Lemo-Opuscar Codex skill"
git branch -M main
git remote add origin https://github.com/YOUR-ACCOUNT/lemo-opuscar-codex.git
git push -u origin main
```

Anyone can install the published skill by downloading this folder and running the matching installer. Keep LICENSE and upstream attribution when redistributing.
