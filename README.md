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

## Workflow for a new language edition

Creating a new language edition deliberately combines LLM-assisted preparation
with human review and manual layout work. The canonical order is:

1. translate `ENG.tex` to a new `CODE.tex`, auditing **all** abbreviations and
   changing only those that are language-dependent;
2. create an Advanced JSON Context Profile (AJCP) for the localized brick image;
3. generate the localized image from the AJCP and the reference image;
4. fine-tune `pages_CODE/` manually.

Translation, AJCP creation, and image generation are performed interactively by
a maintainer. They are **not** run in GitHub Actions. AJCP is a loosely
structured prompting convention rather than a formal standardized schema. This
project uses the [German source AJCP](language_files/deu/FDI_deu_AJCP.json) as
the visual blueprint and the
[English AJCP](language_files/eng/FDI_eng_AJCP.json) and
[Latin AJCP](language_files/lat/FDI_lat_AJCP.json) as localized examples.

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

### 1. Translate `CODE.tex`

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

### 2. Create the AJCP

Attach the translated `CODE.tex`, the German source image,
[`FDI_deu_AJCP.json`](language_files/deu/FDI_deu_AJCP.json), and
[`FDI_eng_AJCP.json`](language_files/eng/FDI_eng_AJCP.json), and
[`FDI_lat_AJCP.json`](language_files/lat/FDI_lat_AJCP.json) to an LLM. The
German profile describes the source artwork; the English and Latin profiles
demonstrate how that source is localized. Their language-specific letters and
descriptions must not leak into the new profile.

```text
Create an Advanced JSON Context Profile (AJCP) for a localized version of the
attached brick-letter image.

Inputs:
- Target language: <TARGET_LANGUAGE>
- Target ISO 639 Set 3 code: <CODE>
- Translated language file: <CODE.tex>
- Source/reference image: language_files/deu/FDI_deu.png
- Source visual AJCP: language_files/deu/FDI_deu_AJCP.json
- Localized AJCP examples: language_files/eng/FDI_eng_AJCP.json and
  language_files/lat/FDI_lat_AJCP.json
- Required output filename: FDI_<CODE>_AJCP.json
- Required generated image filename: FDI_<CODE>.png

Requirements:
1. Use FDI_deu_AJCP.json as the authoritative visual analysis of the source
   image and the English and Latin AJCP files as localization patterns. Retain
   their descriptive depth and relevant sections, including source,
   localization, canvas, intent, visual_summary, scene, subjects,
   spatial_relationships, composition, style, color_palette, materials,
   lighting, rendering, constraints, generation_directive, and analysis_notes.
2. Read the translated CODE.tex and identify the exact translated term for
   research data infrastructure and its exact translated abbreviation. Do not
   invent a second translation and do not copy FDI or RDI unless CODE.tex
   actually uses it.
3. Do not reinterpret or alter protected abbreviations, proper names,
   identifiers, filenames, paths, or citation keys from CODE.tex. PDF, DO, PID,
   DFG, GWK, and FAIR are fixed project-wide. Only the language-dependent
   abbreviation for research data infrastructure determines the brick letters.
4. Record the target language code, language name, translated term,
   abbreviation, derivation, and CODE.tex source under localization.
5. Update every language-, word-, acronym-, glyph-, filename-, subject-, and
   geometry-dependent value throughout the entire JSON. The new abbreviation
   may require different letters, silhouettes, counters, widths, spacing, and
   brick arrangements.
6. Preserve the visual identity of the reference image: interlocking toy bricks,
   black hand-drawn contours, established colors, baseplate, perspective,
   transparent background, and overall comic style.
7. Describe one subject entry for each target letter in the correct order. Each
   subject must use the correct glyph and a geometrically plausible description
   of that glyph constructed from bricks.
8. Put the exact target abbreviation in visible_text, semantic_expansion,
   content_tags, constraints, must_include, must_preserve, avoid, and the
   generation directive wherever those fields discuss visible lettering.
9. Add explicit negative constraints against the source abbreviation and every
   stale alternative found in the structural reference.
10. Distinguish measured source-image properties from requested output
   properties. Do not fabricate hashes, pixel counts, bounding boxes, file
   sizes, or DPI values. If they cannot be measured from the attachment, use
   null and explain the uncertainty in analysis_notes.
11. Preserve a fully transparent RGBA background and specify exact output pixel
    dimensions and aspect ratio consistently in every relevant field.
12. Remove obsolete project-configuration fields or LaTeX macro mappings. The
    abbreviation is already written directly and consistently in CODE.tex.

Before answering, perform a global consistency audit over every JSON string:
- the language code and filenames are the target ones;
- the visible abbreviation is identical everywhere;
- subject IDs, glyphs, order, and geometric descriptions match every target
  letter;
- no description refers to a source letter that is absent from the target;
- canvas dimensions and aspect ratios agree;
- must_include, must_preserve, avoid, and generation_directive do not contradict
  one another;
- the JSON parses without comments or trailing commas.

Return only the complete valid JSON object, without Markdown fences or
explanatory text.
```

Save the reviewed result as `language_files/CODE/FDI_CODE_AJCP.json`.

### 3. Generate the localized image

Attach the reviewed AJCP and its reference image to an image-generation model.
Use the following prompt without restating the target letters manually; the
reviewed AJCP must remain the authoritative source.

```text
Generate one localized image from the attached AJCP and reference image.

Treat the AJCP as the authoritative generation specification. Read the target
language, visible abbreviation, ordered glyphs, canvas dimensions, alpha
requirements, composition, style, palette, subject geometry, constraints,
negative constraints, and generation_directive directly from it.

Reconstruct the target abbreviation as physical uppercase sculptures assembled
from individually outlined interlocking toy bricks. Preserve the reference
image's baseplate, perspective, color blocking, black hand-drawn contours,
studs, cel-shaded illustration style, spacing logic, and transparent outer and
inner negative spaces. Adapt letter geometry only where required by the target
glyphs.

The visible letters must exactly match the AJCP abbreviation, in the specified
order, with no additional letters, printed caption, logo, scenery, floor, wall,
or background. Do not reproduce a source-language letter merely because it is
present in the reference image.

Return exactly one RGBA PNG at the exact dimensions specified by the AJCP. Keep
the full baseplate and every letter inside the canvas. Before returning the
image, verify the glyph sequence, letter count, dimensions, aspect ratio, and
transparent background against the AJCP.
```

Save the selected image as `language_files/CODE/FDI_CODE.png` and inspect the
lettering, dimensions, transparency, and style manually.

### 4. Fine-tune `pages_CODE/`

Copy or create `language_files/CODE/pages_CODE/`. Render the edition and adjust
TikZ nodes, line breaks, font sizes, rotations, curves, and image placement
until every page fits the artwork. Then build locally:

```bash
latexmk -lualatex -interaction=nonstopmode -halt-on-error main.tex
```

CI performs only this deterministic LaTeX build. It neither calls an LLM nor
creates, modifies, or replaces translations, AJCP files, or image assets.

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
