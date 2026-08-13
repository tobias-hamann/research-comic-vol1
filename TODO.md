# TODO: SciKGTeX

Stand dieses Branches: `\useScikgtex` ist aktiv, vier Annotationen stehen im
Abstract (`\background`, `\researchproblem`, `\method`, `\result`),
`\conclusion` im letzten Absatz der Discussion.

Verifiziert am gebauten `main.pdf`: die fünf Properties landen tatsächlich im
XMP-Block unter `http://orkg.org/property/`, als Contribution
`contribution_ORKG_default`. Build läuft fehlerfrei durch, 58 Seiten.

Offen sind drei Punkte.

---

## 1. Die mitgelieferte SciKGTeX-Version ist veraltet

`scikgtex.sty` im Repo ist **v1.0 vom 21.12.2021**, Upstream
(<https://github.com/Christof93/SciKGTeX>) steht bei **v3.0.0**.

Unsere Kopie definiert in `scikgtex.sty:81-85` nur fünf Properties:

```
researchproblem · result · method · background · conclusion
```

Was in v3 dazugekommen ist und uns hier fehlt:

| Befehl | Art | Bemerkung |
|---|---|---|
| `\metatitle*{..}` | bibliografisch | Sternform, setzt keinen Text |
| `\metaauthor*{..}` | bibliografisch | Sternform |
| `\researchfield*{..}` | bibliografisch | Sternform |
| `\objective{..}` | Contribution | **ersetzt** `\background` |

Zu beachten: v3 kennt `\background` nicht mehr. Bei einem Update muss die
Annotation im Abstract von `\background{..}` auf `\objective{..}` umgestellt
werden.

**Entscheidung nötig:** `scikgtex.sty` und `scikgtex.lua` gegen die
Upstream-Fassung tauschen? Das Paket ist ausdrücklich dafür gedacht, in das
Projekt kopiert zu werden — es sind aber Dateien, die das ing.grid-Template
mitliefert. Ggf. mit der Redaktion abstimmen.

Ohne Update ginge ersatzweise `\addmetaproperty{objective}`, dann landet die
Property allerdings im generischen Namensraum `http://orkg.org/property`
statt bei den offiziellen ORKG-Properties.

## 2. Zitate landen als nackte BibTeX-Keys in den Metadaten

`\cite{bak_comics_2026}` innerhalb einer Annotation wird beim Schreiben ins
XMP zum blanken Key eingedampft. Aktuell steht im PDF:

> `<orkg_property:background>` Comics journalism constitutes a graphic form of
> literary journalism. According to John S. Bak and Christopher Craig
> **bak_comics_2026**, comics journalism and literary journalism share key
> features: …

Betrifft `\background`, `\researchproblem` und `\conclusion`. Kein Fehler, aber
als veröffentlichter Metadatenwert Rauschen.

**Entscheidung nötig:** `\cite`-Aufrufe aus den Annotationsklammern
herausziehen? Das verschiebt sie im Satzbild minimal. Alternativ so lassen.

## 3. Vorschläge für zusätzliche Properties

Erst relevant, wenn Punkt 1 entschieden ist. Die drei bibliografischen
Properties sind Sternformen, setzen also keinen Text und können in die
Präambel — sie stören das Layout nicht. Damit lässt sich auch der Inhalt des
`metadata`-Ordners anbinden.

| Property | Vorschlag | Quelle |
|---|---|---|
| `\metatitle*` | A FAIR Comic about Research Data Infrastructure | `language_files/en/en.tex:2` |
| `\metaauthor*` | Alfred Neuwald, Tobias Hamann, Évariste Demandt | `metadata/authors.tex:63-89` |
| `\researchfield*` | offen — z. B. Research Data Management oder Science Communication | Autorenentscheidung |

Für `\objective` zwei Kandidaten aus dem vorhandenen Text, beide ohne Zitat,
damit der Metadatenwert sauber bleibt:

1. Introduction, letzter Absatz: *„By combining ethnographic observation with
   the multimodal representational capacities of comics, we explore comics
   journalism as a method for documenting situated research practices within
   the administrative office of the German National Research Data
   Infrastructure for Engineering Sciences (NFDI4ING)."*
2. Discussion, erster Absatz, Schlusssatz: *„We hope that readers interested in
   research data infrastructure will be profitably entertained by the result."*

Empfehlung: Kandidat 1 — er benennt das Vorhaben, nicht die Hoffnung.

---

## Nebenbefund

Der Lauf erzeugt zusätzlich `main.xmp_metadata.xml` neben dem PDF. Ist ein
Build-Artefakt und steht auf diesem Branch in der `.gitignore`.
