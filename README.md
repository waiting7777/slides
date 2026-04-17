# Slides

Wayne's tech sharing slide decks, built with [Slidev](https://sli.dev/) and hosted on GitHub Pages.

**Live:** https://waiting7777.github.io/slides/

## Structure

```
.
├── decks/
│   └── harness-engineering/    # individual deck (slides.md + package.json)
├── index.html                  # landing page listing all decks
├── scripts/build-all.sh        # build every deck into dist/
└── .github/workflows/deploy.yml
```

## Local Dev

Run a single deck:

```sh
cd decks/harness-engineering
npm install
npm run dev
```

Build everything and preview:

```sh
npm run build
npm run preview   # serves dist/ at http://localhost:8000
```

## Add a New Deck

1. `mkdir decks/<new-deck-name>`
2. Copy `package.json` pattern from an existing deck
3. Write `slides.md`
4. Add a card to `index.html`
5. Push — GitHub Actions rebuilds and deploys

## Deploy

Auto-deploys on push to `main` via GitHub Actions. The workflow:
1. Builds each deck with `--base /slides/<deck-name>/` so asset URLs resolve under GitHub Pages
2. Copies `index.html` to `dist/`
3. Uploads `dist/` as the Pages artifact
