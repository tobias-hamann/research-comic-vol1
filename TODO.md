# TODO: SciKGTeX

Stand dieses Branches: `\useScikgtex` ist aktiv, SciKGTeX liegt in **v3.0.0**
vor. Die fünf Pflicht-Properties stehen bei ihrem jeweiligen Fließtext —
`\researchproblem*`, `\method` und `\result` beim Abstract, `\objective` am
Ende der Introduction, `\conclusion*` im letzten Absatz der Discussion. Dazu
kommen die drei bibliografischen Properties `\metatitle*`, `\metaauthor*` und
`\researchfield*` direkt nach `\begin{document}`.

Verifiziert am gebauten `main.pdf`: die fünf Properties landen tatsächlich im
XMP-Block unter `http://orkg.org/property/`, als Contribution
`contribution_ORKG_default`, die bibliografischen Angaben als `orkg:hasTitle`,
`orkg:hasAuthor` und `orkg:hasResearchField`. Build läuft fehlerfrei durch,
58 Seiten.

Alle drei Punkte sind abgearbeitet. Offen ist nur noch eine inhaltliche
Bestätigung, siehe Punkt 3.

---

## 1. Update auf v3.0.0 — erledigt

`scikgtex.sty` und `scikgtex.lua` sind gegen die Release-Assets von
<https://github.com/Christof93/SciKGTeX/releases/tag/v3.0.0> getauscht
(unverändert übernommen, Stand 29.05.2024). Vorher lag v1.0 vom 21.12.2021 im
Repo.

Zu beachten: Upstream hat die Versionszeile nicht mitgezogen, `scikgtex.sty`
meldet sich im Log weiterhin als `2022/11/13 v2.1.1`. Die Datei ist trotzdem
die aus dem v3.0.0-Release; sie wurde absichtlich nicht angefasst, damit sie
byteweise dem Upstream entspricht.

Was das Update gebracht hat:

* `\background` gibt es nicht mehr, die Annotation im Abstract steht jetzt auf
  `\objective`. Der Rest der Befehle ist unverändert.
* Neu und noch ungenutzt: `\metatitle*{..}`, `\metaauthor*{..}`,
  `\researchfield*{..}` — siehe Punkt 3.
* Der Namensraum bleibt `http://orkg.org/property/`, aber die fünf Properties
  werden nun auf die echten ORKG-Prädikat-IDs abgebildet statt auf die
  Befehlsnamen. Im XMP steht also nicht mehr `orkg_property:background`,
  sondern:

  | Befehl | XMP-Tag | ORKG-Label |
  |---|---|---|
  | `\objective` | `P15051` | Objective |
  | `\researchproblem` | `P32` | research problem |
  | `\method` | `P1005` | method |
  | `\result` | `P1006` | result |
  | `\conclusion` | `P15419` | Conclusion |

  Alle fünf gegen die ORKG-API geprüft, z. B.
  <https://orkg.org/api/predicates/P32>.
* Die Lizenz hat sich schon mit v2.0.0 von LPPL auf MIT geändert. `LICENSE_1`
  führt SciKGTeX bereits als MIT, passt also.

Das Paket ist ausdrücklich dafür gedacht, in das Projekt kopiert zu werden. Es
sind aber Dateien, die das ing.grid-Template mitliefert — ggf. der Redaktion
Bescheid geben, dass hier eine neuere Fassung liegt.

## 2. Zitate landen als nackte BibTeX-Keys in den Metadaten — erledigt

Ursache: Die Annotationsbefehle reichen ihr Argument über
`\luaescapestring{\unexpanded{#2}}` weiter, Lua sieht also die rohen
LaTeX-Tokens. Der Stripper `remove_any_latex_command` ersetzt `\cmd{inhalt}`
durch `inhalt` — aus `\cite{bak_comics_2026}` wird der blanke Key. Da das
Muster `'\\%w+%s*{(.*)}'` gierig bis zur letzten Klammer der Zeichenkette
greift, zerlegt es bei mehreren Inline-Befehlen zusätzlich die Klammerpaare;
daher die verwaisten `}` im alten `\conclusion`-Wert. Keine Regression durch
das Update — die Funktionen `remove_latex_commands`, `remove_any_latex_command`
und `remove_environments` sind in v3.0.0 byteweise dieselben wie in v1.0.

Auf TeX-Ebene ist dagegen nichts auszurichten: Wegen `\unexpanded` hilft kein
Makro-Wrapper, jede Lösung müsste im Lua-Stripper ansetzen.

Umgesetzt ist deshalb die Sternform. `\objective*`, `\researchproblem*` und
`\conclusion*` setzen keinen Text, sie schreiben nur ins XMP. Der Fließtext
steht als normale Prosa da (Zitate und Kursivierung unverändert an Ort und
Stelle), die Annotation folgt unmittelbar darauf mit demselben Wortlaut, aber
ohne `\cite` und ohne `\textit`. `\method` und `\result` enthalten keine
Zitate und stehen weiterhin als normale Inline-Annotation im Abstract.

Ergebnis im XMP, alle fünf Werte sauber:

> `<orkg_property:P15419>` … such as comics about researchers in research
> institutions (see, for example, Jorge Cham's PHD Comics or Eppendorf's Lab
> Life), as well as science communication comics … about the process of
> learning—or coming to understand.

Am Satzbild ändert sich nichts: Seite 1 und der Discussion-Absatz sind Zeichen
für Zeichen wie vorher, das Dokument bleibt bei 58 Seiten.

Preis der Lösung: Die drei Werte stehen doppelt in `main.tex`. Sie liegen
direkt neben ihrem Fließtext, damit ein Auseinanderlaufen beim Redigieren
auffällt — ein Kommentar an beiden Stellen weist darauf hin. **Wer den
Abstract oder den Schlussabsatz ändert, muss die Sternform mitziehen.**

Denkbar wäre stattdessen ein Patch an `remove_any_latex_command` (nicht-gierige
Muster, `\cite` komplett verwerfen) — sinnvoll nur als Beitrag stromaufwärts,
damit die vendorierte Kopie byteweise dem Release entspricht.

## 3. Zusätzliche Properties und passender `\objective`-Text — erledigt

Die drei bibliografischen Properties sind Sternformen und setzen keinen Text.
Sie stehen gebündelt direkt nach `\begin{document}` — nicht in der Präambel,
denn `inggrid.cls` lädt SciKGTeX per `\AtEndPreamble`, die Befehle existieren
dort also noch nicht.

| Property | Wert | Quelle |
|---|---|---|
| `\metatitle*` | A FAIR Comic about Research Data Infrastructure, Part 1: From Charlemagne to ing.grid | `language_files/en/en.tex:2-3`, Wortlaut wie in `CITATION.cff` auf `main` |
| `\metaauthor*` | Alfred Neuwald / Tobias Hamann / Évariste Demandt (drei Aufrufe) | `metadata/authors.tex:63-89` |
| `\researchfield*` | Science and Technology Studies | ORKG-Taxonomie, `R373` |

Landen im XMP als `orkg:hasTitle`, drei `orkg:hasAuthor` und
`orkg:hasResearchField`. Alle drei sind reine Textliterale — SciKGTeX löst sie
nicht gegen die ORKG auf, deshalb ist die exakte Schreibweise des Labels
wichtig, damit die Zuordnung beim Import gelingt.

**Zur Bestätigung durch die Autoren:** Das Forschungsfeld ist eine inhaltliche
Entscheidung. `R373 Science and Technology Studies` deckt die ethnografische
Beobachtung wissenschaftlicher Praxis ab, auf die sich der Artikel mit Latour
ausdrücklich beruft. Ebenfalls in der Taxonomie vorhanden und vertretbar:
`R296 Journalism Studies` (Comics-Journalismus als Genre), `R278 Information
Science` (Forschungsdatenmanagement), `R288 Communication Sciences`. Es geht
nur genau eins, `set_researchfield` überschreibt. Gesucht über
<https://orkg.org/api/resources?q=...&include=ResearchField>; „Research Data
Management", „Scholarly Communication" und „Comics" liefern dort nichts.

`\objective` trägt jetzt den letzten Satz der Introduction: *„By combining
ethnographic observation with the multimodal representational capacities of
comics, we explore comics journalism as a method for documenting situated
research practices within the administrative office of the German National
Research Data Infrastructure for Engineering Sciences (NFDI4ING)."* Der Satz
benennt das Vorhaben, während der bisherige Wert noch der alte
`\background`-Text war. Er enthält weder `\cite` noch `\textit` und steht
deshalb als ganz normale Inline-Annotation im Text — keine Dopplung, der
Metadatenwert ist nachweislich der Satz aus dem Artikel. Die beiden ersten
Abstract-Sätze sind damit unannotierte Prosa; am Satzbild ändert sich nichts.

Verworfen: der Alternativkandidat *„We hope that readers interested in research
data infrastructure will be profitably entertained by the result."* aus der
Discussion — benennt eine Hoffnung, kein Ziel.

---

## Nebenbefund

Der Lauf erzeugt zusätzlich `main.xmp_metadata.xml` neben dem PDF. Ist ein
Build-Artefakt und steht auf diesem Branch in der `.gitignore`.
