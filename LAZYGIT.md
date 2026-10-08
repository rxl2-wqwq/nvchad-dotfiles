# LazyGit Guide

A simple, visual guide to using **LazyGit** with this Neovim config.

If you already know these Git commands, this guide shows you the LazyGit button for each one:

```bash
git add .
git add <file>
git commit -m "message"
git checkout <branch>
git pull
git push
git push origin <branch>
```

---

## What is LazyGit?

LazyGit is a **visual Git interface** that runs inside Neovim. Instead of typing Git
commands, you press keys and see everything on screen.

Open it from Neovim:

```
<leader>gg      →  Space + g + g
```

> `<leader>` = Space.

---

## The 4 places Git keeps your files

This is the most important thing to understand first.

```
   ┌──────────────┐   ┌──────────────┐   ┌──────────────┐   ┌──────────────┐
   │ 1. WORKING   │   │ 2. STAGING   │   │ 3. LOCAL     │   │ 4. REMOTE    │
   │    DIR       │   │  (index)     │   │    REPO      │   │  (GitHub)    │
   │              │   │              │   │              │   │              │
   │ file you are │   │ files marked │   │ saved        │   │ copy on      │
   │ editing now  │   │ "ready" to   │   │ snapshots    │   │ the server   │
   │              │   │ commit       │   │ (commits)    │   │              │
   └──────────────┘   └──────────────┘   └──────────────┘   └──────────────┘
          │                  │                  │                  │
          │   git add        │   git commit     │   git push       │
          ├─────────────────>├─────────────────>├─────────────────>│
          │                  │                  │                  │
          │<─────────────────┤                  │<─────────────────┤
          │   git restore    │                  │   git pull       │
```

**Simple analogy:**

- **Working Dir** = your desk (the file you are writing)
- **Staging** = shopping basket ("this is what I want to commit")
- **Local Repo** = a saved receipt (changes recorded permanently on your computer)
- **Remote** = the cloud (GitHub, where everyone shares)

---

## LazyGit screen layout

```
┌──────────────────────┬──────────────────────────────────────────┐
│ [1] Status           │                                          │
│   repo: nvim         │  DIFF — content of the selected item     │
│   branch: main ✓     │                                          │
├──────────────────────┤  Shows what you are staging.             │
│ [2] Files            │  Lines starting with + are added,        │
│   M  README.md       │  lines with - are removed.               │
│   M  lua/init.lua    │                                          │
├──────────────────────┤                                          │
│ [3] Branches         │                                          │
│   main               │                                          │
│   fitur-login        │                                          │
├──────────────────────┤                                          │
│ [4] Commits          │                                          │
│   174ca4b update doc │                                          │
├──────────────────────┤                                          │
│ [5] Stash (0 of 0)   │                                          │
├──────────────────────┴──────────────────────────────────────────┤
│ Stage: <space> | Commit: c | Edit: e | Stash: s | Discard: d     │
└─────────────────────────────────────────────────────────────────┘
```

- **[1] Status** — repo name, current branch, sync state (✓ = in sync with remote)
- **[2] Files** — changed files (M = modified, A = added, D = deleted, ? = untracked)
- **[3] Branches** — your local branches
- **[4] Commits** — commit history
- **[5] Stash** — temporarily saved changes
- **Right panel** — the diff / content of whatever is selected

---

## Your 5 commands → LazyGit buttons

```
┌────────────────────────────────┬──────────────────────────────┐
│  YOUR COMMAND                  │  IN LAZYGIT                  │
├────────────────────────────────┼──────────────────────────────┤
│  git add .                     │  press  a                    │
│  git add <file>                │  highlight file → Space      │
├────────────────────────────────┼──────────────────────────────┤
│  git commit -m "message"       │  press  c  → type → Enter    │
├────────────────────────────────┼──────────────────────────────┤
│  git checkout <branch>         │  panel [3] → highlight → ␣   │
├────────────────────────────────┼──────────────────────────────┤
│  git pull                      │  press  p                    │
├────────────────────────────────┼──────────────────────────────┤
│  git push                      │  press  P                    │
│  git push origin <branch>      │  press  P  (on active branch)│
└────────────────────────────────┴──────────────────────────────┘
```

---

## Step by step (visual)

### 1. `git add` — stage your changes

**Manual:** `git add .`
**LazyGit:** press **`a`**

```
   [2] Files
     M  README.md
     M  lua/init.lua
              │
              │  press  a
              ▼
     ✓ README.md          ← green = staged
     ✓ lua/init.lua
```

- Only one file? Move with `j` / `k` to the file, press **`Space`**.
- Only part of a file? Press **`Enter`** on the file, then `Space` on the
  lines/hunks you want. (This is `git add -p`.)

### 2. `git commit -m "message"` — save a snapshot

**Manual:** `git commit -m "update mappings"`
**LazyGit:** press **`c`** → type the message → press **`Enter`**

```
     ✓ README.md
     ✓ lua/init.lua
              │
              │  press  c
              ▼
     ┌────────────────────────────────┐
     │ Commit message:                │
     │ update mappings_               │  ← type here
     │                                │
     │ <Enter> = commit               │
     └────────────────────────────────┘
              │
              ▼
   [4] Commits
     3f9a1c2 update mappings          ← new commit appears on top
     174ca4b update documentation
```

### 3. `git push` — send to GitHub

**Manual:** `git push`
**LazyGit:** press **`P`** (Shift + p)

```
   [1] Status   main ↑1     ← ↑1 = 1 commit not pushed yet
              │
              │  press  P
              ▼
   [1] Status   main ✓      ← ✓ = in sync with GitHub
```

### 4. `git pull` — get changes from GitHub

**Manual:** `git pull`
**LazyGit:** press **`p`**

```
   [1] Status   main ↓2     ← ↓2 = remote has 2 new commits
              │
              │  press  p
              ▼
   Changes from GitHub come into your code
```

> If there is a conflict, LazyGit shows the files that clash. Fix them, then
> press `Space` to mark each one as resolved.

### 5. Switch branch — `git checkout <branch>`

**Manual:** `git checkout fitur-login`
**LazyGit:** panel **[3]**, highlight the branch, press **`Space`**

```
   press  3            (jump to the Branches panel)
              │
              ▼
   [3] Branches
       main
       fitur-login     ← highlight this one
              │
              │  press  Space
              ▼
   [1] Status   branch: fitur-login   ← now on fitur-login
```

- New branch? Press **`n`** in panel [3].

---

## The one-line cheat sheet

```
<leader>gg  →  a  →  c  →  Enter  →  P  →  q
   open      stage  commit  send    push  quit
```

| Key | Same as command |
|-----|-----------------|
| `a` | `git add .` |
| `Space` (on file) | `git add <file>` |
| `c` + Enter | `git commit -m "message"` |
| `p` | `git pull` |
| `P` | `git push` / `git push origin <branch>` |
| `3` then `Space` | `git checkout <branch>` |
| `n` (panel 3) | `git checkout -b <branch>` |
| `q` | quit |
| `?` | show all keys for the current panel |

---

## About `git push origin <branch>`

In LazyGit you **never type the branch name**. LazyGit already knows which
branch you are on (see `[1] Status`). Pressing `P` pushes the current branch
to its remote.

So:

- `git push origin main` (while on main) → **`P`**
- `git push origin fitur-login` (while on fitur-login) → **`P`**

---

## Full example with a real repo

```
1. <leader>gg              open LazyGit
2. press  a                stage all changed files
3. press  c, then type:    "fix: remove jk mapping"
4. press  Enter            commit
5. press  P                push to origin/main
6. press  q                quit
```

All your files are now on GitHub.

---

## Safety: undo a mistake

| Key | What it does |
|-----|--------------|
| `z` | **Undo** the last LazyGit action ⭐ |
| `Z` | Redo |
| `d` | Discard changes (careful — deletes work) |

If you accidentally staged, committed, or discarded something, press `z`
immediately to undo it.

---

## Notes

- Version used: **LazyGit 0.66.0**
- Config file: `~/.config/lazygit/config.yml`
- Commit editor is set to **Neovim** (via `os.edit` in the config)
- Optional: install `git-delta` (`sudo pacman -S git-delta`) for nicer diffs,
  then uncomment the `paging:` lines in the config.

When in doubt, press **`?`** — LazyGit shows every key that works for the
panel you are in.
