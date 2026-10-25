---
name: lemo-opuscar
description: Create a short film or animation in a named Lemo-Opuscar visual style, find a suitable style from its 59-style library, adapt a style, or write a reusable visual treatment. Use for visual storytelling and code-made films; not for routine editing of existing footage.
---

# Lemo-Opuscar · Codex edition

Use this skill to turn a topic into a visual treatment, storyboard, or code-made short film with a deliberate visual language. The source library was authored by Lemomo for Claude Opus; adapt its directions to the current model and tools, and treat every style prompt as a starting point rather than a guarantee of identical output.

## Choose a style

Read the style index at references/style-index.md to search by English name, Chinese name, or slug. If the user has not chosen a style, recommend up to three from the index and explain the visual fit in one sentence each. Ask only for decisions that materially change the result, such as subject, duration, aspect ratio, intended platform, available source material, and whether the user wants a storyboard before production.

## Load a style prompt

The index includes an upstream URL for each style's complete STYLE.md. When internet access is available, retrieve the selected prompt with:

```powershell
python scripts/get_style.py --style watercolor
```

Use the slug from the index. The script saves the prompt under references/styles/<slug>/STYLE.md and prints its path. It requires only Python's standard library. Read that file before drafting the treatment. If network access is unavailable or retrieval fails, work from the index's concise visual cues and tell the user the full prompt could not be fetched.

## Make the deliverable

- For a treatment only, create a concise premise, visual rules, palette/materials, camera and motion language, sound direction, and a beat-by-beat outline suited to the requested duration.
- For a storyboard, make key frames and transitions legible; keep the selected style consistent across every frame.
- For a code-made film, inspect the workspace and available render tools. Build a small implementation that fits the environment. Prefer Canvas/SVG/CSS for 2D and WebGL/Three.js only when depth helps. Keep animation deterministic and render/export through the available local or hosted workflow.
- Do not claim that a video is rendered, a source is factual, or an asset is licensed unless verified. For evidence-based stories, cite sources for factual claims. Credit third-party media and fonts in the deliverable.
- Respect the user's chosen output location and format. Do not install system packages, publish, upload, or incur paid services without explicit authorization.

## Adapt a style

When asked to customize a style, preserve the elements the user wants to keep and change only the requested dimensions (for example palette, typography, pacing, material, or signature shot). Summarize the proposed changes, then create a new named treatment rather than overwriting the upstream prompt. Keep user-specific styles in the current project unless they request a global install.

## Attribution

This Codex adaptation is based on [Lemo-Opuscar](https://github.com/lemomo-ai/lemo-opuscar) by LemoLab. The upstream repository is MIT licensed; see LICENSE. Style prompts are fetched from the upstream repository and remain attributed to their author.
