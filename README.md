# A FAIR Comic about Research Data Infrastructure

*Part 1: From Charlemagne to ing.grid*

[![Build PDF](https://github.com/tobias-hamann/research-comic-vol1/actions/workflows/build-pdf.yml/badge.svg?branch=main)](https://github.com/tobias-hamann/research-comic-vol1/actions/workflows/build-pdf.yml)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.21921315.svg?cache=1)](https://doi.org/10.5281/zenodo.21921315)
[![Release](https://img.shields.io/github/v/release/tobias-hamann/research-comic-vol1?include_prereleases&label=release)](https://github.com/tobias-hamann/research-comic-vol1/releases)
[![Read PDF](https://img.shields.io/badge/read-PDF-red.svg)](main.pdf)

[![Code: MIT](https://img.shields.io/badge/code-MIT-yellow.svg)](LICENSE)
[![ing.grid class: LPPL 1.3c](https://img.shields.io/badge/ing.grid%20class-LPPL%201.3c-blue.svg)](LICENSE_1)
[![Comic: CC BY 4.0](https://img.shields.io/badge/comic-CC%20BY%204.0-green.svg)](https://creativecommons.org/licenses/by/4.0/)

## About the project

This repository contains the article and multilingual LaTeX sources for
*A FAIR Comic about Research Data Infrastructure. Part 1: From Charlemagne to
ing.grid*. The 12-page research comic uses comics journalism to document how
comic artist Alfred Neuwald and members of NFDI4ING developed a shared
understanding of research data infrastructure and FAIR data through a series
of weekly conversations.

The article describes the project's documentary basis, its development as a
conversation-driven collaboration, and the technical method used to separate
the artwork from its multilingual text. The current rendered document is
available as [main.pdf](main.pdf).

## Manuscript preparation and translation

The comic was outlined, discussed, and initially written in German. Redrawing
the complete artwork for every translation would have created long revision
cycles and made small textual corrections expensive. The project therefore
uses a language-neutral production workflow:

1. Alfred Neuwald supplied a blank version of the comic containing the
   characters, maps, panels, and other artwork, but no dialogue or captions.
2. LaTeX places each page of this blank PDF as a full-page background.
3. TikZ nodes overlay the translated dialogue and captions at precise
   coordinates.
4. Text content and visual placement are kept in separate, language-specific
   files. This allows translators to work on text independently while each
   edition can adjust line breaks, font sizes, rotations, curves, and node
   positions to fit the artwork.
5. Language-dependent images, such as the FDI/RDI toy-brick lettering on the
   first page, are stored alongside the corresponding language edition.

The original German and publication-oriented English versions are accompanied
by AI-assisted Latin and Elvish proof-of-concept editions. An AI-assisted
Draconic (*Vs'shtak*) translation is referenced in the manuscript; its rendered
appendix edition is currently represented by the project-local placeholder
`vss`. These editions demonstrate
support for left-to-right languages and language-specific non-Latin fonts. The
language-dependent FDI/RDI image variants also demonstrate how translated
artwork can be overlaid without modifying the shared background. Right-to-left
and boustrophedon writing systems have not yet been implemented or tested.

## Language structure

Language directories and their associated text, page, image, and font files
use lowercase three-letter identifiers from **ISO 639 Set 3** (formerly
ISO 639-3:2007). This set covers individual languages and is also the basis of
Zenodo's language vocabulary. In particular, German uses `deu`; the legacy
bibliographic code `ger` is not accepted by Zenodo.

Authoritative references:

- [ISO 639 — Language code](https://www.iso.org/iso-639-language-code), the
  official ISO overview of the current standard and its identifier sets
- [ISO 639-3 Language Code Tables](https://iso639-3.sil.org/code_tables/639/data),
  published by SIL International as the ISO language coding agency for Set 3
- [Zenodo's software metadata guidance](https://help.zenodo.org/docs/github/describe-software/zenodo-json/),
  whose example uses the three-letter language identifier `eng`

| Identifier | Language | Role |
| --- | --- | --- |
| `deu` | German | Original manuscript |
| `eng` | English | Publication translation and current primary comic language |
| `lat` | Latin | Translation proof of concept |
| `qya` | Quenya (Elvish) | Font and script proof of concept |

The planned Draconic edition uses `vss`, derived from its Draconic name
*Vs'shtak*. This is a **project-local placeholder**, not an assigned ISO 639 or
Zenodo identifier. It is therefore excluded from `\FDILanguageList` and from
`CITATION.cff` until an appropriate registered identifier is available.

Each language `CODE` has the following structure, where `CODE` is normally its
lowercase ISO 639 Set 3 identifier:

```text
language_files/CODE/
├── CODE.tex              # text strings in reading order
├── pages_CODE/           # TikZ placement and styling for each page
├── FDI_CODE.png, ...     # translated or language-dependent artwork
└── fonts_CODE.tex        # optional language-specific font setup
```

The shared rendering logic lives in
[`comic_files/pages_functions.tex`](comic_files/pages_functions.tex). The
language-neutral artwork is
[`comic_files/BLANKO_1-12_v1.0.0.pdf`](comic_files/BLANKO_1-12_v1.0.0.pdf).

### Selecting and rendering languages

The primary comic language and its language-specific title, subtitle, and
short title are selected near the beginning of [`main.tex`](main.tex). The
article body and remaining metadata are maintained separately.

```latex
\newcommand{\FDILanguage}{eng}
```

The main comic is rendered with:

```latex
\comic{\FDILanguage}
```

Individual languages or page ranges can also be rendered directly:

```latex
\comic{deu}       % complete German comic
\comic[3-5]{eng}  % English pages 3 to 5
```

At the end of the article, `\FDIAppendixComics` adds every language listed in
`\FDILanguageList` except the edition already used in the main text. Each
appendix edition receives a heading, PDF bookmark, and internal jump target.
The navigation bar generated by `\FDIJumpToAll` links the article and all comic
editions.

To add another language, create its directory under `language_files/`, add the
text and page-placement files, provide any language-dependent images or fonts,
and register its identifier and display name in
[`comic_files/pages_functions.tex`](comic_files/pages_functions.tex).

## Repository layout

```text
.
├── main.tex                    # article, configuration, and document entry point
├── main.pdf                    # current rendered article and comic editions
├── comic_files/                # shared artwork and rendering macros
├── language_files/             # German, English, Latin, and Elvish editions
├── fonts/                      # bundled fonts used by the overlays and article
├── figures/                    # article figures
├── logos/                      # ing.grid assets
├── metadata/                   # article and author metadata
├── references.bib              # bibliography
├── inggrid.cls / final.def     # ing.grid document class and layout
├── scikgtex.sty / scikgtex.lua # optional machine-readable annotations
├── CITATION.cff                # software citation metadata
└── .github/workflows/          # automated PDF build
```

## Building the document

The document requires LuaLaTeX, Biber, and `latexmk`. A complete TeX Live 2026
installation includes the packages used by the project. Build the document
from the repository root with:

```bash
latexmk -lualatex -interaction=nonstopmode -halt-on-error main.tex
```

The [Build PDF workflow](.github/workflows/build-pdf.yml) runs the same type of
LuaLaTeX build automatically for pushes to `main`, pull requests, and manual
workflow dispatches. Successful runs upload the rendered `main.pdf` as the
`fair-comic-pdf` artifact for 30 days.

## Citation and archived releases

Use GitHub's **Cite this repository** function or the metadata in
[`CITATION.cff`](CITATION.cff) when citing the LaTeX sources.

- Latest archived release: [Zenodo Concept DOI
  10.5281/zenodo.21921315](https://doi.org/10.5281/zenodo.21921315)
- Version `0.1.0`: [10.5281/zenodo.21921316](https://doi.org/10.5281/zenodo.21921316)
- Accompanying research data:
  [10.5281/zenodo.19468332](https://doi.org/10.5281/zenodo.19468332)

## Contributors

- [Alfred Neuwald](https://orcid.org/0009-0001-0152-7504):
  conceptualization, methodology, writing, and visualisation
- [Tobias Hamann](https://orcid.org/0000-0002-8021-5524):
  conceptualization, methodology, writing, and software
- [Évariste Demandt](https://orcid.org/0000-0002-2239-3955):
  conceptualization and writing

## Licenses

- Repository software and original source code: [MIT License](LICENSE)
- `inggrid.cls` and `final.def`: [LaTeX Project Public License 1.3 or
  later](LICENSE_1)
- Published comic and article: [Creative Commons Attribution 4.0
  International](https://creativecommons.org/licenses/by/4.0/)
- Bundled third-party fonts retain the license notices included in their
  respective directories.
