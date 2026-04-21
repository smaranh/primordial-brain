# 🧠 Primordial Brain

> A personal AI-powered knowledge base — drop in your messy notes, let Claude organise them, and never lose an idea again.

---

## Prerequisites

Before you begin, install the following:

1. **[Obsidian](https://obsidian.md/)** — Your knowledge base viewer and editor
2. **[Claude Code](https://www.claude.com/)** — Your AI assistant for organising knowledge

---

## The Big Picture

```
 ┌────────────────────────┐      ┌────────────────────────┐      ┌──────────────────────────┐
 │  1. YOUR MESSY NOTES   │      │   2. CLAUDE ORGANISES  │      │  3. YOUR PRIMORDIAL BRAIN │
 │  ────────────────────  │      │   ───────────────────  │      │  ───────────────────────  │
 │                        │      │                        │      │                           │
 │   raw/                 │      │   Reads raw/, follows  │      │   wiki/                   │
 │   • claude-chat.md     │ ───► │   rules in CLAUDE.md,  │ ───► │   • index.md              │
 │   • chatgpt-chat.md    │      │   writes wiki/         │      │   • concepts/             │
 │   • meeting-notes.md   │      │                        │      │   • people/               │
 │   • notion-export.md   │      │   Commands you run:    │      │   • projects/             │
 │                        │      │     /ingest  /query    │      │                           │
 │   YOU drop notes here. │      │     /lint    /log      │      │   YOU read here, in       │
 │                        │      │                        │      │   Obsidian.               │
 └────────────────────────┘      └────────────────────────┘      └──────────────────────────┘

       scattered across               turns mess into               ask questions, spot
       5 different apps               linked knowledge              patterns, never lose
                                                                    an idea again
```

---

## Getting Started

> [!TIP]
> **For humans:** You can skip the manual steps and run this single prompt in Claude Code — it will handle everything automatically. Jump to [Step 3](Welcome.md#step-3--verify-your-setup) when done.
> ```
> Review @Welcome.md and proceed with implementing the required steps.
> ```

For a step-by-step walkthrough, see **[Welcome.md](Welcome.md)**.

---

## Slash Commands

Once set up, you'll have four commands available in Claude Code:

| Command    | Description                                              |
|------------|----------------------------------------------------------|
| `/ingest`  | Ingest new files from `raw/` into `wiki/`               |
| `/query`   | Synthesise an answer from the wiki                       |
| `/lint`    | Run a health check — find broken links, orphans, gaps   |
| `/log`     | Append a timestamped note to `wiki/log.md`              |