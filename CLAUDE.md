# CLAUDE.md — context for working on liang-li.com

> Auto-loaded by Claude Code at the start of every session in this repo. It carries the design decisions and constraints so we don't re-litigate them every time. This is v2 of the design system — it fully replaces the earlier "editorial monograph / Fraunces + persimmon" direction.

## What this is

Personal website for Liang Li — engineer in the SF Bay Area, ex-ASML electron optics (e-beam inspection), pivoting into the physical AI / robotics ecosystem with DevRel as the target function. **Primary goal of the site: build personal IP through writing, not function as a job-search portfolio.**

Live domain: `liang-li.com` (static hosting, GitHub Pages or equivalent).

## Audience priority order

1. Physical AI / robotics startup founders + recruiters scanning Liang as a candidate or potential cofounder
2. Other engineers who might read the writing and reshare
3. Long-tail: friends, future collaborators

If a change helps audience 1 and 2 — do it. If it only helps 3 — push back.

## Aesthetic system v2: "Renaissance humanism" (do not drift from this)

The look is scholarly parchment + Old Master paintings — Renaissance humanism meets AI. Reference lineage: Emergences Labs. It is intentionally NOT a dark-mode gradient SV portfolio, and NOT the previous Fraunces/persimmon system.

### Tokens
```
--cream:  #efe8da   (parchment background)
--cream2: #f4efe4   (card / section background)
--ink:    #2a2218   (primary text, warm near-black)
--ink-soft: #473c2c
--muted:  #736755
--brown:  #8a6b45   (accent — labels, category text, active states)
--brown-deep: #6f5536 (emphasis <em> inside body copy)
--taupe:  #c5b69d   (inactive tabs)
--line:   rgba(52,40,24,.18)   (hairline rules)
--frame:  rgba(46,36,22,.42)   (card borders — darker than --line)
--hl:     #ffdd49   (fluorescent-yellow marker highlight — hover only)
```

### Fonts (Google Fonts) — v2.4
- Display: **Newsreader** (variable, optical sizes 6–72; weight 500 on headings, `font-optical-sizing:auto`, tracking ~-0.01em). Conventional ampersand — Playfair was retired because its swash "&" looked odd in labels.
- Body: **Source Serif 4** (variable; 400–700).
- Utility: **Hanken Grotesk** (`--sans`; weights 500–700) — eyebrows, metadata, bylines, [NO. 00X] labels, pills, footer. Uppercase labels at weight 600, tracking .10–.14em (emergences-style; the old .2em+ mono tracking is retired along with the mono face).
- **Never use** Inter, Roboto, Space Grotesk, Arial, Fraunces, IBM Plex, Cormorant Garamond, EB Garamond, Instrument Serif, Space Mono, Playfair Display, DM Mono (all retired). The CSS var is `--sans`; there is no `--mono` anymore.

### Signature elements (keep all of these)
1. **Classical paintings as imagery** — public domain via Wikimedia Commons `Special:FilePath` URLs only. Panel/about images get the sepia treatment: `filter:sepia(.4) saturate(.8) contrast(1.03)` + brown multiply overlay. Journal card thumbnails are grayscale at rest and **colorize on hover**.
2. **Marker-highlight hover** — post titles get the `--hl` yellow swept left-to-right via background-size transition (`.ttl` class).
3. **Window-chrome cards** — journal entries have the three-dot bar + `FEATURED` dotted rule + `[NO. 00X]` index in Space Mono.
4. **Topics tab panel** — serif tabs + circular brown arrow buttons + painting panel with right-edge cream fade.
5. **Hero painting** — the hero background IS a generated classical oil painting featuring Liang, subject in the right third, headline text left-aligned in the quiet left half (`assets/hero-painting.jpg`; falls back to the Cole landscape until it exists). Generation prompt lives in `assets/README.txt`. About shows the real photo (`assets/portrait-about.jpg`) UNFILTERED and with NO caption — a pure image; the classical treatment is for artwork only, never for his actual photo.
6. **English only (for now)** — the EN/中文 toggle and the whole i18n layer were removed by request; site copy is English, no Chinese fragments anywhere. If Chinese content returns later, do it as separate pages or posts (e.g. `post-slug-zh.html`), not a live-swap toggle — ask first.
7. **Brand is "Liang Li"** — no trailing dot, no accent glyph, everywhere (nav, post bars).
8. **Post pages have NO byline, avatar, or social pills** — a single-author blog needs neither an author card nor fake comment/like/share buttons. The meta line under the dek is just the date (`.pdate`). Don't reintroduce these.

### Rules
- Artwork must be public domain; keep the footer credit line "Artwork: public domain, via Wikimedia Commons."
- Every new post picks a distinct painting not already used. Current assignments: Cole Arcadian State (hero), Wright Orrery (about), Vermeer Astronomer (post-ai-tutor), Raphael School of Athens (optics post + semis-infra thread), David Oath of the Horatii (marvell post), Michelangelo Creation of Adam (cleanroom post + AI & Robotics thread), Friedrich Wanderer above the Sea of Fog (Thoughts & Misc thread).
- The reference (emergences.ai) uses genuine Old Master paintings, so real public-domain paintings ARE the target look — not an approximation. If Liang later wants "classical feel without real paintings," the sanctioned alternatives are 19th-century scientific/engineering engravings (also public domain, thematically stronger for an engineer) or a commissioned/AI-generated consistent illustration set; discuss before switching, and swap the whole set at once — never mix.
- The yellow highlight is hover-only. Never use it as a static decoration.
- **Motion budget (full list — don't add more):** scroll-reveal (`.reveal`), hero parallax (bg translateY at 0.32× scroll, JS + rAF), nav transparent-over-hero → translucent cream blur after scrolling past the hero (no border line, soft shadow only), slow 1.03× zoom on painting panels/thumbnails on hover, marker-highlight on titles, subtle fixed film-grain overlay (`body::after`, opacity .22, multiply). All gated behind `prefers-reduced-motion`. No particles — they fight the classical material.

## Positioning & accuracy (non-negotiable)

Copy must match the resume facts. Approved claims:
- 4 years at ASML e-beam inspection (NOT "8+ years")
- CV alignment tool: designed and shipped; sub-pixel detection + patented physics model; alignment error down 10x to ~1 nm; cycle time down 66%; authored end-user documentation
- MuJoCo demo: honest "assisted grasp / weld constraint" framing; built on M1 MacBook Air, CPU only
- AI agent: "contributed domain knowledge" (never "architected")
- TSMC: "resolved customer-site issues" (never "partnered directly")
- Tonewood: solo-built AI guitar coach, live beta at tonewood.vercel.app (private repo); companion public eval repo github.com/liangli16/guitarset-strum-eval. Approved framing: timestamped claims come from signal analysis (LLM never supplies a number); thresholds calibrated on public corpora (GuitarSet, Ego-Exo4D); approved metric: spurious gap detections cut ~14/min → ~1/min via corpus-validated gating (matches resume). Site copy stays narrative voice — never resume-bullet style — but carries this one metric as proof. Quid Pro Quo: hackathon winner. Virtuoso Ads: solo-built (removed from site Aug 2026, may reference in writing).

Positioning: physical AI / robotics / DevRel. Not PM, not pure investing — markets essays are welcome as a category, but the site identity is "engineer building for the physical AI developer ecosystem."

## Site structure (flat, no subdirectories)

```
index.html          ← landing: Hero, About, Now, Blog (eyebrow + threads panel ONLY — no section title/sub, no post cards, no subscribe; "All essays →" link sits in the tabs row next to the arrows), Work (Projects/Papers segmented toggle + 2-per-page project pager with the circular arrows), Contact
                       nav order is fixed: About · Blog · Work · Contact (+ language toggle)
                       nav "Blog" links to writing.html directly, NOT to the home section
                       nav links align to the same 1180px content grid as everything else — don't push them to the viewport edge
assets/             ← hero-painting.jpg + portrait-about.jpg (see assets/README.txt)
writing.html        ← journal index with category filter chips
post-<slug>.html    ← individual essays (duplicate post-ai-tutor.html as the template)
CLAUDE.md           ← this file
```

## Writing system

### Categories — mirror the three Blog threads (data-cat values on writing.html)
- `ai-robotics` — "AI & Robotics": technical essays, demos, CV/robotics builds
- `semis-infra` — "Semiconductors & Infra": chips, AI infrastructure, markets essays
- `thoughts` — "Thoughts & Misc": books, reflections, non-technical detours
- `ai-events` — hackathons, meetups, SF events (kept as a filter; no thread tab)
The three tabs in the Blog section panel (index.html `TOPICS` + `th1/th2/th3` i18n keys) must stay in sync with these.

### Current posts (chronological numbering, never reuse a number)
- [NO. 001] post-buildout.html — "All-you-can-eat compute" — Semiconductors & Infra — May 27, 2026 — Bruegel, Tower of Babel (Vienna); Fig 1 chart is base64-embedded
- [NO. 002] post-zerotoone.html — "Monopoly isn't a dirty word" — Thoughts & Misc — Jun 2026 — Friedrich, Wanderer above the Sea of Fog
- [NO. 003] post-ai-tutor.html — "How I accidentally became an AI tutor" — AI & Robotics — Jul 2026 — Vermeer, The Astronomer
The three placeholder posts (optics / marvell / cleanroom) were DELETED before launch — the journal contains only real essays. Don't scaffold new placeholder posts.

### Adding a new post (two edits — the homepage does NOT list posts)
1. Duplicate `post-ai-tutor.html` → `post-<slug>.html`; replace category, title, dek, date, painting, content
2. Add an `.entry` card to `writing.html` with the right `data-cat` and next `[NO. 00X]`
The homepage Blog section stays posts-free by design (emergences-style: blog lives on its own page). Don't re-add cards or a subscribe form to the home without being asked.

### Voice (when drafting posts for Liang)
- Lede first — one sentence that earns the second
- Direct, slightly dry, observation-first. Someone who has shipped things telling you what he noticed.
- One `<em>` quotable line per section max — it renders in brown, treat it as precious
- 800–2000 words; substantive but phone-readable
- Avoid: "In today's fast-paced world", "leveraged", "I'm excited to share", any LinkedIn-ese
- English primary; occasional Chinese for color is fine
- Markets posts end with "Nothing here is investment advice."

## Current placeholder state (as of Jul 2026)

- All four post bodies are placeholders. `post-ai-tutor.html` is the finished launch essay (personal/opinion voice; the technical depth lives in the demo repo README by design). The other three still carry earlier PM/investing-voice placeholder text and should be rewritten or unpublished before launch.
- There is NO subscribe form or button anywhere, including post-page top bars (removed by request). If subscriptions come back, they go on `writing.html`, wired to Buttondown/Substack — ask first.
- **No ASML-adjacent code goes public.** The sub-pixel tool's repo is company IP; even synthetic-data reproductions of its pipeline/parameters/GUI are off-limits. The public GitHub portfolio is personal robotics work only (MuJoCo demos etc.). The essay `post-ai-tutor.html` deliberately stays at the story/opinion level with no code.
- Contact is ONE closing section with icon buttons only (Email, LinkedIn, GitHub, YouTube inline SVGs). Live links: liangli.careers@gmail.com, linkedin.com/in/liangli98, github.com/liangli16, youtube.com/@MikeLee_98. Add an X / Xiaohongshu icon only when those channels go live.
- Footer is a single line: "© Liang Li". Nothing else — no columns, no year, no artwork credit (public-domain art requires none). Less is more; don't re-expand it.

## Common asks and how to handle them

| Request | Default response |
|---|---|
| "Add a contact form" | Push back. Email + LinkedIn is enough for a static site. |
| "Add more animation" | Push back. Reveal + hover highlight + thumbnail colorize is the full budget. |
| "Dark mode" | Skip. The parchment feel is the identity. |
| "Add analytics" | Plausible/GoatCounter only if asked twice; no Google Analytics. |
| "Migrate to a framework" | No. Plain HTML until 20+ posts. |
| "Make the site say I'm job hunting" | No. Personal IP platform; the Contact section handles opportunity inbound. |

## Don't break

- `Updated · [month year]` stamp on the Now block — bump whenever Now content changes
- `[NO. 00X]` numbering on writing.html is chronological and never reused
- Work section: Projects/Papers segmented toggle (`.wswitch`) with a 2-cards-per-page pager (`renderProjects()`); both live in one section — never split Papers back out. NOTE: toggling visibility must use `style.display`, never the `hidden` attribute — authored `display:grid` on `.wgrid` overrides `hidden` (this was a real bug).
- Blog threads panel has a FIXED height (440px desktop) so switching tabs never resizes the box; art images are absolutely positioned to fill
- Mobile: test at ~380px; grids collapse to one column below ~880px
- Keyboard focus outlines (`:focus-visible`) and `prefers-reduced-motion` support stay

## Session decisions (Jul 2026, v2.5)
- Hero: single greeting line only — "Hi, I'm *Liang Li.*" (name italic). No dek/bio paragraph in hero; personal details live in About. Animation: word-staggered "ink settle" (blur 10px -> 0, fade, slight rise; delays .15/.4/.7s; disabled under prefers-reduced-motion). No typewriter effect — doesn't fit the classical theme.
- About: personal voice, NOT resume/job-hunting tone. Current copy: Sunnyvale intro + "equations meet execution" -> ASML/UC Davis/Penn/Fermilab woven as narrative (not a role list) -> hobbies (ping-pong, guitar, museums) closing with the museums-to-old-paintings tie. Stats trio REMOVED (Jul 2026). Institution names (ASML / UC Davis / Penn / Fermilab) get static marker-highlight via .acopy .hlt (lower-half --hl swipe).
- NOW block: REMOVED (less is more). Do not re-add.
- Journal categories: exactly three — AI & Robotics / Semiconductors & Infra / Thoughts & Misc (+ All chip). No "AI Events". Filter values must match card data-cat exactly: ai-robotics / semis-infra / thoughts-misc.
- Selected Work (Aug 2026): exactly 2 projects — [W.01] Tonewood (AI guitar coach, live beta; links: tonewood.vercel.app + guitarset-strum-eval GitHub repo), [W.02] Quid Pro Quo — plus 2 papers. Virtuoso Ads card REPLACED by Tonewood (Aug 2026). Sub-pixel CV card REMOVED (ASML-sensitive) and MuJoCo card REMOVED (not polished yet); may return later. Pager arrows auto-hide when pages<=1.
- About layout: photo LEFT (.72fr, smaller) / text RIGHT (1.28fr) to alternate with the hero portrait (which sits right). Mobile: text first, photo below.
- Post 4 (Jul 2026): post-no-deep-learning.html — "Why we didn't use deep learning", AI & Robotics, July 7 2026, [NO. 004], hero = Vermeer The Lacemaker (Commons hotlink, same pattern as Astronomer). The technical/judgment essay for the Roboflow DevAdvocate application. No ASML-proprietary details: approach described at edge-detection/filters/physics-model level only, numbers limited to the public resume set (10x, ~1 nm, 66%).

## Publishing workflow (v3.0, Jul 2026) — IMPORTANT
The journal is now data-driven. writing.html contains NO hardcoded cards; it renders from assets/posts.js at load.
- assets/posts.js — single source of truth for the post list (newest first). Adding/editing a post's card = edit this file only.
- assets/post.css — shared stylesheet for ALL post pages. Post pages link it; never add inline <style> to a post.
- post-template.html — copy-and-fill skeleton with a checklist comment at the top.
To publish: (1) copy post-template.html -> post-slug.html, fill in; (2) add one entry at top of POSTS in assets/posts.js; (3) commit both. Nothing else changes.
Do NOT regress to hardcoded cards in writing.html.

## Repo structure (v3.1, Jul 2026) — canonical
/
├── index.html          # home (hero, about, blog panel, work, contact)
├── writing.html        # journal index — renders cards from assets/js/posts.js
├── posts/              # one HTML file per essay + post-template.html
├── assets/
│   ├── css/post.css    # shared stylesheet for all post pages
│   ├── js/posts.js     # POST MANIFEST — the only file to edit when publishing
│   └── img/            # ALL images, local: heroes/thumbs (paintings), hero-painting.jpg, portrait-about.jpg, figures
├── scripts/download-images.sh  # one-time fetch of the 6 classical paintings from Wikimedia
└── .gitignore          # .DS_Store
Rules: no Wikimedia hotlinks in content (local assets/img only; the two onerror fallbacks in index.html JS are the sole allowed remote refs). Posts live in posts/ and use ../ relative paths. Publishing = add posts/post-slug.html + one entry in assets/js/posts.js (+ hero image in assets/img/ if new).
- Post 5 (Jul 2026): posts/post-line-shaft.html — "AI has a line-shaft problem", AI & Robotics, July 12 2026, [NO. 005], hero = Menzel The Iron Rolling Mill (assets/img/ironmill.jpg). Tokenmaxxing/Uber vs Paul David dynamo paradox; corrected details: 5% = electric motors’ share of factory drive in 1899 (not coal cost share); factory-redesign emblem = Ford Highland Park (not GE).
- Image delivery workflow (Jul 2026): Claude's sandbox CANNOT reach Wikimedia (network allowlist), so hero paintings are never inside delivered zips. When delivering a new post, ALWAYS include the direct browser save-as link (Special:FilePath URL with ?width=1400) so Mike downloads the one new image manually (10 seconds). scripts/download-images.sh is disaster-recovery only, not the routine path. WARNING: delivered zips lack the 7 committed paintings in assets/img/ — never let a zip overwrite/delete that folder; merge or copy individual files only.
