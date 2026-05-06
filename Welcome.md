# 🧠 Primordial Brain — Setup Guide

> Follow these steps to scaffold your AI-powered knowledge base using **Obsidian** and **Claude Code**.

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

## Step 2 — Define Schema & Skills

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

### 2b. Create Skills

Run the following prompt to generate four skills:

```
Create a .claude/skills/ folder inside my current working directory (this vault root, next to CLAUDE.md, raw/, and wiki/). Do NOT create it anywhere else. Each skill lives in its own subfolder with a SKILL.md file. Each SKILL.md should start with a YAML frontmatter block (name, description, and argument-hint where relevant) followed by the prompt body.

1. .claude/skills/ingest/SKILL.md
   name: ingest
   description: Ingest new files from raw/ into wiki/.
   Prompt body should instruct Claude to:
   - For each unread file in raw/ (skip anything already summarised):
     read it, write a source-summary page in wiki/, create or update
     concept/project/person pages as needed, cross-link with [[wiki-links]],
     update wiki/index.md, and append a timestamped entry to wiki/log.md.
   - Process 5-10 sources thoroughly per run. If $ARGUMENTS is provided,
     limit to that many sources.

2. .claude/skills/query/SKILL.md
   name: query
   description: Synthesise an answer from the wiki.
   argument-hint: the question to answer
   Prompt body should instruct Claude to:
   - Read wiki/index.md and the pages most relevant to $ARGUMENTS.
   - Synthesise an answer grounded in the wiki, cite every claim by
     wiki page name, and flag if sources disagree.
   - If the synthesis reveals a new connection, propose a wiki update
     but do not write it without confirmation.

3. .claude/skills/lint/SKILL.md
   name: lint
   description: Run a health check on the wiki.
   Prompt body should instruct Claude to:
   - Scan wiki/ for broken [[wiki-links]], orphan pages, pages missing
     required frontmatter, stale pages (30+ days untouched), and
     contradictions between pages.
   - Report findings as a structured list. Do not fix anything yet,
     ask for permission first.

4. .claude/skills/log/SKILL.md
   name: log
   description: Append a timestamped note to wiki/log.md.
   argument-hint: the thought or note to capture
   Prompt body should instruct Claude to:
   - Append a timestamped entry containing $ARGUMENTS to wiki/log.md.
   - If the note mentions a project, person, or concept that has a
     wiki page, update that page too. Otherwise do not create new pages.

Create all four SKILL.md files now.
```

---

## Step 3 — Verify Your Setup

Restart Claude Code to pick up the new skills, then run the following test prompt:

```
List the skills available in .claude/skills/ and tell me the rules from CLAUDE.md in one paragraph each. Add a workflow section to the output with one line description of each skill.
```

---

> [!TIP]
> 🎉 **You're all set!** Drop files into `raw/` and run `/ingest` to start building your primordial brain.
>
> Skills are invoked with `/skill-name` (e.g. `/ingest`, `/query`, `/lint`, `/log`).

---

## Step 4 — Make It Yours (Optional)

This vault is a template. You can keep using it as-is, or spin it off into a named, private GitHub repo tied to your specific domain — while leaving the original `primordial-brain` folder intact to clone again later.

Run the following prompt:

```
/personalize
```

Claude will ask for a new folder name, then:

1. Creates a new folder with your chosen name
2. Preserve the `primordial-brain` template as a `upstream` remote
3. Create a new **private** GitHub repo under your account
4. Push your vault and set `origin` to the new repo

> [!IMPORTANT]
> After the script completes, **close Claude Code and reopen it pointing at the renamed folder**. Claude Code's working directory is set at launch and won't follow a rename automatically.

> [!NOTE]
> Requires the [GitHub CLI](https://cli.github.com/) (`gh`) to be installed and authenticated. Run `gh auth status` to check.
