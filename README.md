# Minimal template for my research project.

## Initialisation

Generate common directories using `make`.

```zsh
make init

rm -rf .git
git init
```

## Structure

```zsh
├── Makefile
├── README.md
├── code
│   ├── notebooks
│   ├── src
│   └── tests
├── doc
│   ├── config.tex  # frequently used packages and commands
│   ├── guideline # author guideline and template files
│   ├── figures
│   ├── jmlr2e.sty # modified JMLR style file
│   ├── main.tex # clean JMLR LaTeX file
│   └── tables
├── misc  # comments by co-authors, blackboard, etc
├── poster
└── slides
```
