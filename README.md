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

## Installation and Work setup

The following explains two ways of working with this document:

    


### Requirements

**TeX system**  
For compiling .tex-files locally, a TeX-System is required. I recommend [MikTeX](https://miktex.org/).
Install with

    winget install -e --id MiKTeX.MiKTeX

Afterwards, open MikTex and search for updates.


**IDE**  
For proper .tex-files editing an IDE is needed. I recommend [VSCode](https://code.visualstudio.com/) with [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) installed.
Install with

    winget install -e --id Microsoft.VisualStudioCode

<details><summary>With VS Code and Latex Workshop</summary>
**LaTeX integration**
In VS Code, open the extensions tab in the side menue and search for Latex Workshop.
Install. Enjoy.
</details>

<details><summary>With Texstudio</summary>
## Setup Texstudio

#### Darkmode

- Optionen --> TexStudio konfigurieren --> Allgemein
- Stil: Adwaita Dark (txs) auswählen
- Farbschema: Modern - dunkel

#### Line Numbers

- Optionen --> TexStudio konfigurieren 
- "Erweiterte Optionen" anhaken (ganz unten)
- --> Editor 
- Zeilennummern anzeigen: Alle Zeilennummern

</details>

### First steps

When working with a local TeX System and IDE, download or clone this repository to your empty project directory:  
Clone with tls/https (requires your Gitlab login):  
`git clone https://github.com/tobias-hamann/research-comic-vol1.git`  

### Install all necessary packages

Compile the main.tex-file with your IDE and consider the resulting PDF for further explanations.

MikTex will ask for packages to be installed.
Once fully compiled, everything should be set up.



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
5. Language-dependent images, such as the FDI/RDI/RDL toy-brick lettering on the
   first page, are stored alongside the corresponding language edition.

The original German and publication-oriented English versions are accompanied
by AI-assisted Latin, Elvish, and Draconic (*Vs'shtak*) proof-of-concept
editions. The Draconic edition uses the project-local identifier `vss`; its
text and page layouts are included, while its `FDI_vss.png` RDL artwork is
supplied separately. These editions demonstrate
support for left-to-right languages and language-specific non-Latin fonts. The
language-dependent FDI/RDI/RDL image variants also demonstrate how translated
artwork can be overlaid without modifying the shared background. Right-to-left
and boustrophedon writing systems have not yet been implemented or tested.

## Workflow for a new language edition

Creating a new language edition deliberately combines LLM-assisted preparation
with human review and manual layout work. The canonical order is:

1. Copy the `eng` folder and rename it to `CODE` according to your language code. Use small letters.
2. Translate `ENG.tex` to a new `CODE.tex`, auditing **all** abbreviations and
   changing only those that are language-dependent;
3. Create `FDI_CODE.png` for the new language
4. Register the new edition in `comic_files/pages_functions.tex`.
5. If needed, import needed fonts into the new `fonts_CODE` folder.
6. Fine-tune `pages_CODE/` manually.

Translation and image generation are performed interactively by
a maintainer. They are **not** run in GitHub Actions. This
project uses the [German source png](language_files/deu/FDI_deu.png) as
the visual blueprint for the image generation.

### Protected and translatable content

This policy applies to every new language edition and overrides any general
instruction to translate all reader-visible text.

**Must not be changed:**

- Fixed abbreviations `PDF`, `DO`, `PID`, `DFG`, `GWK`, and `FAIR`. These exact
  tokens remain unchanged in every language. A translated surrounding phrase
  does not create a new abbreviation; for example, `DO` must not become `OD`.
- Established identifiers and names such as `DOI`, `ISBN`, `QR`, `URN`,
  `ORCID`, `Handle`/`HANDLE`, `NFDI`, `NFDI4ING`, `VLB`, `RWTH`, and `C.A.R.L.`
- Proper names in the source, including names of people, historical persons,
  places, organizations, institutions, projects, products, journals,
  publishers, events, and exhibitions. Preserve their exact spelling and do
  not translate, Latinize, inflect, or attach target-language suffixes. For
  example, keep `Karl der Große`, `Aachen`, `Comiciade`, `DataCite`,
  `Granus Verlag`, and `ing.grid` exactly as written in the source.
- LaTeX commands and arguments that identify content, including all
  `\FDISetText` coordinates, `\FDIUseText` references, command names, citation
  keys, labels, URLs, handles, DOI values, ISBN values, filenames, paths, and
  other machine-readable identifiers.

**May and normally should be changed:**

- Dialogue, captions, explanatory prose, ordinary common nouns, grammar, and
  sound effects, while preserving the LaTeX structure.
- Language-dependent common-noun terms and their abbreviations when they are
  not on the protected list. The central example is
  `Forschungsdateninfrastruktur (FDI)`: English uses
  `Research Data Infrastructure (RDI)` and Latin uses
  `infrastructura datorum scientificorum (IDS)`.
- Line breaks and other language-dependent typography during the later manual
  layout stage.

If a token could be either a proper name or ordinary prose, leave it unchanged
and flag it for human review. Never silently translate an uncertain name.

### 1. Copy the `eng` folder and rename it to `CODE`

Straight forward. For the naming, use the 

### 2. Translate `CODE.tex`

Copy an existing language file to `language_files/CODE/CODE.tex`, attach it to
an LLM, and replace the placeholders in the following prompt. The acronym audit
is essential: abbreviations must be treated as part of the translation rather
than copied mechanically from the source language.

```text
You are an expert literary and technical translator and an experienced LaTeX
editor. Translate the attached comic language file completely.

Inputs:
- Source language: <SOURCE_LANGUAGE>
- Target language: <TARGET_LANGUAGE>
- Target ISO 639 Set 3 code: <CODE>
- Source file: <SOURCE_CODE.tex>

Requirements:
1. Preserve the complete LaTeX structure. Do not change any \FDISetText page,
   panel, or text identifiers, \FDIUseText references, command names, brace
   structure, citation keys, labels, URLs, handles, DOI and ISBN values,
   filenames, paths, or other machine-readable identifiers.
2. Translate reader-visible prose subject to the protected-content rules below.
   Preserve intentional LaTeX commands such as \\, \enquote, \hspace, and
   formatting commands.
3. Before translating, inventory every abbreviation, acronym, initialism, and
   corresponding expanded term in the entire file. This includes occurrences
   without an explicit expansion and occurrences repeated on different pages.
4. The abbreviations PDF, DO, PID, DFG, GWK, and FAIR are protected and must
   remain character-for-character unchanged in every occurrence. Never derive
   a replacement abbreviation for them from a translated phrase. In particular,
   DO must not become OD and PID must not become IP.
5. Also preserve established identifiers and names such as DOI, ISBN, QR, URN,
   ORCID, Handle/HANDLE, NFDI, NFDI4ING, VLB, RWTH, and C.A.R.L. exactly. This
   protected list overrides target-language word order and grammatical form.
6. Preserve every proper name exactly as written in the source. This includes
   people, historical persons, places, organizations, institutions, projects,
   products, journals, publishers, events, and exhibitions. Do not translate,
   Latinize, inflect, respell, or attach target-language suffixes to a proper
   name. Examples include Karl der Große, Karl der Kleine, Alfred, Évariste,
   Tobias, Aachen, Verdun, Comiciade, DataCite, Granus Verlag, NFDI4ING, and
   ing.grid. If uncertain whether something is a proper name, preserve it and
   flag it for human review.
7. Replace every unprotected, language-dependent abbreviation consistently in
   every occurrence. For example, German "Forschungsdateninfrastruktur (FDI)" becomes
   English "Research Data Infrastructure (RDI)" and Latin
   "infrastructura datorum scientificorum (IDS)".
8. Check every all-capital token and short form individually. Classify it as
   "protected" or "language-dependent" before editing it. Do not infer a new
   short form for anything on the protected list.
9. Keep each unprotected abbreviation consistent with its translated expansion
   in every repeated mention, caption, example, and explanatory footnote.
10. Use natural, idiomatic target-language prose without altering protected
    content. Do not treat a recognized localized or historical form as
    permission to replace the exact source proper name.
11. Save-compatible output must be UTF-8 and compile with LuaLaTeX.

Perform a final consistency pass over the complete translation. Specifically
verify that every protected token and proper name still matches the source
character-for-character, then search for unprotected source-language prose and
language-dependent abbreviations that may have survived accidentally.

Output exactly two sections:
1. "Acronym audit": a table with source form, source expansion, classification
   (`protected` or `language-dependent`), target expansion, target abbreviation,
   and reason. The protected entries PDF, DO, PID, DFG, GWK, and FAIR must appear
   in this table even if their expansions are not present in the source.
2. "Complete CODE.tex": the complete translated LaTeX file in one code block,
   with all decisions from the audit applied. Do not omit unchanged lines.
```

Review both the acronym audit and the translated file. Save only the contents
of the `Complete CODE.tex` block as `language_files/CODE/CODE.tex`.

### 3. Create `FDI_CODE.png` for the new language

Attach the translated `language_files\deu\FDI_deu.png`, the German source image created by Alfred by hand, to an LLM.
Promt the LLM to `Keep the style exactly as it is in the image, but change the letters to XXX`.
`XXX` will be the abbreviation your translation of "Research Data Management (RDI)", e.g. in German "ForschungsDatenInfrastruktur" will become `FDI`.  

Inspect the lettering, dimensions, transparency, and style manually.
Make sure the toy bricks are properly aligned.

If not, promt the LLM something like `The bricks aren’t lining up properly on the base. Please try again.`.

If the image is fitting, save the selected image as `language_files/CODE/FDI_CODE.png`.

### 4. Link the new language version

Once all required language files exist, register the edition in
[`comic_files/pages_functions.tex`](comic_files/pages_functions.tex):

1. Add `CODE` to the comma-separated `\FDILanguageList`. The list controls
   which editions are loaded and also determines their order in the navigation
   and appendix.

   ```latex
   \newcommand{\FDILanguageList}{deu,eng,CODE}
   ```

2. Add the human-readable name used in headings and navigation:

   ```latex
   \FDISetLanguageName{CODE}{Language name}
   ```

The remaining files are found automatically from the language code:
`\FDIInputLanguageFile` loads `language_files/CODE/CODE.tex`,
`\FDIInputPage` loads the page files from
`language_files/CODE/pages_CODE/`, and `\FDIInputLanguageFonts` loads
`language_files/CODE/fonts_CODE.tex` if that optional file exists. No separate
input command or language-specific conditional is needed.

No change to [`main.tex`](main.tex) is required if the new language should only
be added as another appendix edition: `\FDIJumpToAll` and
`\FDIAppendixComics` process all entries in `\FDILanguageList` automatically.
To make it the primary comic edition instead, change the language switch near
the beginning of `main.tex`:

```latex
\newcommand{\FDILanguage}{CODE}
```

The primary edition is rendered by `\comic{\FDILanguage}` in the article body
and skipped in the appendix to prevent duplication. Its `CODE.tex` must also
provide the language-specific `\title`, `\subtitle`, and `\shorttitle` values
loaded by `main.tex`.

### 5. Add language-specific fonts (optional)

If the default fonts do not cover the new language, create
`language_files/CODE/fonts_CODE.tex` and place the font files in
`language_files/CODE/fonts_CODE/`. Use
[`language_files/qya/fonts_qya.tex`](language_files/qya/fonts_qya.tex) as an
example.

### 6. Fine-tune `pages_CODE/`

Copy or create `language_files/CODE/pages_CODE/` if not done already.

#### Coordinate system and units

The layout helpers are defined in
[`comic_files/pages_functions.tex`](comic_files/pages_functions.tex). Unless a
macro is documented differently below, they use the upper-left page corner as
their origin:

- `x = 0cm, y = 0cm` is the upper-left page corner.
- A positive `x` value moves to the right; a negative value moves to the left.
- A positive `y` value moves downward; a negative value moves above the top
  edge. The macros convert this convention to TikZ's negative y-shift
  internally.
- Position, width, size, and radius arguments are TeX lengths and need a unit.
  Page geometry normally uses `cm`; font sizes, baselines, dot sizes, and line
  widths normally use `pt`.
- Rotation and arc angles are unitless degree values. Positive rotation is
  counter-clockwise and negative rotation is clockwise.

For example, this node starts `5.3cm` from the left and `22.7cm` from the top
and has a width of `11cm`:

```latex
\FDIText{5.3cm}{22.7cm}{11cm}{...}
```

Do not use raw `xshift`/`yshift` image nodes for normal page layout. Raw TikZ
coordinates use TikZ's native convention, where positive y points upward. Raw
TikZ paths used for exceptional curves, arrows, or rotations therefore need to
be interpreted separately from the FDI helper macros.

#### Required adjustment order

**Changing font size or line spacing is the last option, after every geometric
and textual layout adjustment has been exhausted.** Smaller type can damage
readability and inconsistent baselines make the editions look unrelated. Use
this order for each text element:

1. Verify that the correct `\FDIUseText` entry is used and that the translation
   contains no avoidable wording or whitespace problems.
2. Adjust `x` and `y` to place the element in the intended bubble or panel.
3. Adjust the text-box `width`, image dimensions, anchor, or curve geometry.
4. Improve wrapping with deliberate `\\` line breaks in `CODE.tex` where
   needed.
5. Only if the content still cannot fit, adjust the font size and then the line
   spacing by the smallest possible amount. Re-render the complete page after
   either change.
6. Adjust all images/logos that need to be adjusted. Most often, the NFDI4ING Logos need adjusting.

Most texts are already pretty tightly fit into the bubbles and other places, so for most texts, these adjustments are not neccessary.
Below, the different macros and their functionality are explained.

#### Page and text lookup macros

- `\FDIPage{page content}` creates the next comic page. It increments the page
  counter by `1`, selects that numbered page from the shared twelve-page blank
  PDF, scales it to `\paperwidth` by `\paperheight`, and places the supplied
  overlay content above it. A `page_N.tex` file normally contains exactly one
  wrapper of this kind.
- `\FDISetText{page}{panel}{text}{content}` in `CODE.tex` stores a text under
  three unitless integer identifiers: comic page number, panel number on that
  page, and text number within that panel. These identifiers are lookup keys,
  not positions, and must remain identical in every translation.
- `\FDIUseText{page}{panel}{text}` retrieves the entry with those same three
  integer identifiers inside a page layout.

#### Text and image macros

| Macro | Numerical values | Behaviour |
| --- | --- | --- |
| `\FDIText{x}{y}{width}{text}` | `x`, `y`, and `width` are lengths, normally in `cm`. | Places a centered text minipage. `x,y` address its north-west corner. |
| `\FDITextLeft{x}{y}{width}{text}` | `x`, `y`, and `width` are lengths. | Same geometry as `\FDIText`, but left-aligns the text. |
| `\FDITextLS{x}{y}{width}{font size}{line spacing}{text}` | `x`, `y`, and `width` are lengths; font size and baseline distance normally use `pt`. | Places centered text and makes both typographic values effective for this node. Use only as the final fitting option. |
| `\FDIOvalText{x}{y}{width}{text}` | `x` and `y` are the lengths to the oval's center; `width` is the full text width. | Wraps centered text to an approximate five-line oval. Unlike `\FDIText`, `x,y` identify the center, not the north-west corner. |
| `\FDITextRotated{x}{y}{width}{angle}{text}` | `x`, `y`, and `width` are lengths; `angle` is a unitless degree value. | Places a centered text box by its north-west anchor and rotates it. Positive angles rotate counter-clockwise; negative angles rotate clockwise. |
| `\FDIImage[anchor]{x}{y}{options}{file}` | `x` and `y` are lengths. Numeric `\includegraphics` options can include `width`, `height`, unitless `scale`, degree-valued `angle`, and `trim={left bottom right top}` lengths. | Places an image using the same positive-down y convention. The default anchor is `north west`; `[center]` makes `x,y` refer to its center. Use `clip` with `trim`. |

For example:

```latex
\FDIImage{5.3cm}{22.7cm}{
  trim={0cm 0cm 0cm 0cm},
  clip,
  width=11cm
}{\FDILanguageFolder/FDI_\FDILanguage.png}
```

#### Text styling macros

| Macro | Numerical values | Behaviour |
| --- | --- | --- |
| `\FDIStyledText{font size}{legacy value}{text}` | `font size` is effective and normally uses `pt`. The second length is retained for compatibility but is currently ignored. | Selects `\FDIOverlayFont`. The actual baseline distance is the shared `\FDITextLineSkip`, currently `12pt`, regardless of second-argument values such as `8pt` or `19pt` in existing files. Do not edit that second value when fitting text. |
| `\FDIStyledTextMinuskel{font size}{line spacing}{text}` | Both values are effective lengths, normally in `pt`. | Selects the Carolingian-minuscule font with the requested font size and baseline distance. Change either value only as a final option. |

`\FDITextLS` is the local escape hatch when a node genuinely needs its own
font size and line spacing. Changing the global `\FDITextLineSkip` affects all
`\FDIStyledText` calls in every language and must not be used to solve a single
speech bubble.

#### Curves, dots, panel numbers, and lines

| Macro | Numerical values | Behaviour |
| --- | --- | --- |
| `\FDIArcTextOutside{x}{y}{start angle}{end angle}{radius}{text}{style}` | `x,y` locate the arc's start point; `radius` is a length; both angles are unitless degrees. A style commonly contains `\fontsize{font size}{line spacing}`, normally in `pt`. | Draws text along the arc so it is readable from outside. Arc angles use TikZ's native angular convention. |
| `\FDIArcTextInside{x}{y}{start angle}{end angle}{radius}{text}{style}` | The same five geometric values as `\FDIArcTextOutside`. | Uses the same arc geometry but reverses the text path so it is readable from inside. |
| `\FDICityDot{x}{y}{minimum diameter}{fill colour}` | `x,y` are the center coordinates; `minimum diameter` is a length, normally in `pt`. | Draws a filled circular marker with a fixed white `1.2pt` outline. |
| `\FDILineNumberBox{x}{y}` | `x,y` locate the north-west corner. | Increments the shared panel/line-number counter by `1` and prints that number at the position. Call order therefore controls numbering. |
| `\FDIHLine{x start}{x end}{y}` | All three values are lengths. | Draws a horizontal light-grey line from `(x start,y)` to `(x end,y)` with a fixed width of `0.4pt`. |
| `\FDILine{x1}{y1}{x2}{y2}` | All four values are lengths. | Draws a black line from the first point to the second with a fixed width of `0.4pt`. |

The oval helper also contains shared fixed geometry: a minimum height of
`1.9cm` and a five-line contour with left/right insets of `0.55cm`, `0.25cm`,
`0cm`, `0.25cm`, and `0.55cm`. The corresponding usable widths are reduced by
`1.10cm`, `0.50cm`, `0cm`, `0.50cm`, and `1.10cm`. Change these values only in
the shared macro and only if every language should be affected.

Render the edition and adjust node coordinates, line breaks, font sizes,
rotations, curves, and image placement until every page fits the artwork.
Build locally, inspect all twelve pages, and repeat this render-and-adjust cycle
until the complete edition is ready.

### 7. Check the text for consistency.

Some cases are really heavily language dependant.
E.g. charles is dumb:

![English Charles is dumb](image.png)

The sourrounding texts with the lines work just as intended.
It would not work if the text was "carolus stultus est" as in latin, where there is no "i" to explain that the "i" does not have a dot yet.
You will have to be creative in the adjustments of texts to make it all fit properly and make sense throughout the whole document.

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
| `vss` | Vs'shtak (Draconic) | Translation proof of concept; project-local identifier |

The Draconic edition uses `vss`, derived from its Draconic name *Vs'shtak*.
This is a **project-local identifier**, not an assigned ISO 639 or Zenodo
identifier. It is included in `\FDILanguageList` for document rendering but
excluded from `CITATION.cff` until an appropriate registered identifier is
available.

Each language `CODE` has the following structure, where `CODE` is normally its
lowercase ISO 639 Set 3 identifier:

```text
language_files/CODE/
├── CODE.tex              # text strings in reading order
├── pages_CODE/           # TikZ placement and styling for each page
├── FDI_CODE_AJCP.json    # reviewed context for localized image generation
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

To add another language, follow the
[workflow for a new language edition](#workflow-for-a-new-language-edition),
then register its identifier and display name in
[`comic_files/pages_functions.tex`](comic_files/pages_functions.tex).
The translated `CODE.tex` stores its reviewed, language-appropriate
abbreviations directly; the accompanying AJCP must use exactly the same
localized infrastructure abbreviation for the image.

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
├── scikgtex.sty / scikgtex.lua # vendored SciKGTeX v3.0.0, ORKG annotations
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

## Machine-readable research contributions

The document embeds its central research contributions into the PDF as
structured XMP metadata using
[SciKGTeX](https://github.com/Christof93/SciKGTeX). The generated RDF follows
the vocabulary of the [Open Research Knowledge Graph](https://orkg.org)
(ORKG), so the statements can be harvested without parsing the article text.

The package is vendored in the repository root as [`scikgtex.sty`](scikgtex.sty)
and [`scikgtex.lua`](scikgtex.lua), taken unmodified from the upstream
[v3.0.0](https://github.com/Christof93/SciKGTeX/releases/tag/v3.0.0) release
(MIT). Upstream did not update the package identification line, so the build
log reports `scikgtex 2022/11/13 v2.1.1` even though these are the v3.0.0
files. Annotations are switched on with `\useScikgtex` near the top of
[`main.tex`](main.tex). `inggrid.cls` loads the package through
`\AtEndPreamble`, which means the SciKGTeX commands only become available at
`\begin{document}` and cannot be used in the preamble.

### Contribution properties

Five mandatory properties are annotated. Each one sits at the passage it
describes, so the metadata value and the printed sentence stay together. In the
XMP they appear under `http://orkg.org/property/`, addressed by their ORKG
predicate ID rather than by the command name.

| Command | Location in `main.tex` | XMP tag | ORKG label |
| --- | --- | --- | --- |
| `\objective` | last sentence of the introduction | `P15051` | Objective |
| `\researchproblem*` | abstract | `P32` | research problem |
| `\method` | abstract | `P1005` | method |
| `\result` | abstract | `P1006` | result |
| `\conclusion*` | last paragraph of the discussion | `P15419` | Conclusion |

### Bibliographic properties

Three further annotations describe the paper itself. They print nothing and are
therefore collected directly after `\begin{document}`:

```latex
\metatitle*{A FAIR Comic about Research Data Infrastructure, Part 1: From Charlemagne to ing.grid}%
\metaauthor*{Alfred Neuwald}%
\metaauthor*{Tobias Hamann}%
\metaauthor*{Évariste Demandt}%
\researchfield*{Science and Technology Studies}%
```

They are written to the XMP as `orkg:hasTitle`, one `orkg:hasAuthor` per
author, and `orkg:hasResearchField`. SciKGTeX stores all three as plain
literals and does not resolve them against the ORKG, so the research field uses
the exact label of an existing ORKG research field (`R373`), and the title
matches the wording used in [`CITATION.cff`](CITATION.cff).

### Why some annotations use the starred form

`\command{text}` typesets its argument and records it; `\command*{text}` only
records it and prints nothing.

The starred form is needed wherever the annotated sentence contains inline
commands. SciKGTeX hands the raw LaTeX tokens to its Lua stripper, which
rewrites `\cmd{content}` to `content`. A `\cite{key}` therefore reaches the
metadata as a bare BibTeX key, and several inline commands in one sentence
additionally leave stray braces behind. `\researchproblem` and `\conclusion`
are affected: their passages are written as ordinary prose in the body and
annotated immediately afterwards with a starred command carrying the same
wording, but without `\cite` and `\textit`.

**When editing those two passages, update the starred annotation as well.** A
comment at each location says so. `\objective`, `\method`, and `\result`
contain no inline commands and are annotated directly in place, so their
metadata values are verbatim article text by construction.

### Output and inspection

Every build writes the metadata twice: as the sidecar file
`main.xmp_metadata.xml` next to the PDF, which is a build artifact, and as an XMP stream inside `main.pdf`. Inspect the embedded version
with:

```bash
pdfinfo -meta main.pdf
```

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
