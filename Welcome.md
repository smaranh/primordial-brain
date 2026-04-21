# 🧠 Primordial Brain — Setup Guide

> A step-by-step guide to scaffolding your AI-powered primordial brain using **Obsidian** and **Claude Code**.

---

## Prerequisites

Before you begin, install the following:

1. **[Obsidian](https://obsidian.md/)** — Your knowledge base viewer and editor
2. **[Claude Code](https://www.claude.com/)** — Your AI assistant for organizing knowledge

---

## The Big Picture

This is the objective we're trying to achieve:

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

> [!TIP]
> **For humans:** You can skip reading the steps below and just run this single prompt in Claude Code — it will handle everything automatically. Then jump straight to [Step 3](#step-3--verify-your-setup) when done.
> ```
> Review @Welcome.md and proceed with implementing the required steps.
> ```

---

## Step 1 — Scaffold the Vault Structure

Use Claude Code to generate your vault's folder structure. Run the following prompt:

```
Create the following directory structure for my primordial brain vault:

primordial-brain/
├── raw/                # MY source documents, never modified by you
├── wiki/               # YOUR domain, you create and maintain these pages
│   ├── index.md        # Master catalog of all wiki pages
│   ├── log.md          # Append-only activity log
│   ├── concepts/       # Concept and topic pages
│   ├── projects/       # Project-specific pages
│   └── people/         # People dossiers
├── journal/            # Daily notes (Part 2)
└── content/            # Content pipeline (Part 2)

Then create these subfolders inside raw/, one per source I want to bring into this primordial brain:

// replace with whatever source you want the brain to ingest
(e.g. claude-exports, chatgpt-exports, notion-exports, granola-exports, articles, notes)

Add a brief README.md in every folder you create (including each raw/ subfolder) explaining what belongs there and, where relevant, where to export it from.
```

---

## Step 2 — Define Schema & Slash Commands

### 2a. Create `CLAUDE.md`

Run the following prompt to establish your project rules and page conventions:

```
Create a CLAUDE.md file for my primordial brain vault with these four sections:

1. Project Structure
   Document the raw/ vs wiki/ folder separation, every subfolder,
   and the purpose of index.md and log.md.

2. Page Conventions
   Every wiki page must have YAML frontmatter with these fields:
   title, type (one of: concept, entity, source-summary, comparison,
   project, person), sources, related, created, last-updated.
   Pages should use [[wiki-links]], be atomic (one idea per page),
   and use a consistent heading structure.

3. Style Guide
   Use clear, concise prose. Prefer bullet points. Attribute every claim
   to its source. Note contradictions explicitly.

4. Domain Context
   IMPORTANT: Do NOT write this section yet. First, pause and ask me
   2-3 short questions, one at a time, to learn what I actually work
   on day to day. Suggested questions:
   - What topics or subjects come up most often in your conversations and notes?
   - Who are the main people, projects, or systems you think about?
   - What are you trying to remember or get smarter about over time?
   Wait for my answers, then use them to write the Domain Context
   section in 4-6 sentences using my own language. Do not invent
   details I did not give you.
```

> [!IMPORTANT]
> Answer the questions Claude asks you — your responses shape the **Domain Context** section of `CLAUDE.md`.

### 2b. Create Slash Commands

Run the following prompt to generate four slash commands:

```
Create a .claude/commands/ folder inside my current working directory (this vault root, next to CLAUDE.md, raw/, and wiki/). Do NOT create it anywhere else. Add four slash-command files inside that folder. Each file should start with a short frontmatter block (description, argument-hint) and then the prompt body.

1. .claude/commands/ingest.md
   Description: Ingest new files from raw/ into wiki/.
   Prompt body should instruct Claude to:
   - For each unread file in raw/ (skip anything already summarised):
     read it, write a source-summary page in wiki/, create or update
     concept/project/person pages as needed, cross-link with [[wiki-links]],
     update wiki/index.md, and append a timestamped entry to wiki/log.md.
   - Process 5-10 sources thoroughly per run. If $ARGUMENTS is provided,
     limit to that many sources.

2. .claude/commands/query.md
   Description: Synthesise an answer from the wiki.
   Argument-hint: the question to answer
   Prompt body should instruct Claude to:
   - Read wiki/index.md and the pages most relevant to $ARGUMENTS.
   - Synthesise an answer grounded in the wiki, cite every claim by
     wiki page name, and flag if sources disagree.
   - If the synthesis reveals a new connection, propose a wiki update
     but do not write it without confirmation.

3. .claude/commands/lint.md
   Description: Run a health check on the wiki.
   Prompt body should instruct Claude to:
   - Scan wiki/ for broken [[wiki-links]], orphan pages, pages missing
     required frontmatter, stale pages (30+ days untouched), and
     contradictions between pages.
   - Report findings as a structured list. Do not fix anything yet,
     ask for permission first.

4. .claude/commands/log.md
   Description: Append a timestamped note to wiki/log.md.
   Argument-hint: the thought or note to capture
   Prompt body should instruct Claude to:
   - Append a timestamped entry containing $ARGUMENTS to wiki/log.md.
   - If the note mentions a project, person, or concept that has a
     wiki page, update that page too. Otherwise do not create new pages.

Create all four files now.
```

---

## Step 3 — Verify Your Setup

Restart Claude Code to pick up the new slash commands, then run the following test prompt:

```
List the slash commands available in /.claude/commands folder and tell me the rules from CLAUDE.md in one paragraph each. Add a workflow section to the output with one line description of each command.
```

---

> 🎉 **You're all set!** Start dropping files into `raw/` and run `/ingest` to build your primordial brain.