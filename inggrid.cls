%                                                __
%  __                                     __    /\ \
% /\_\    ___      __          __   _ __ /\_\   \_\ \
% \/\ \ /' _ `\  /'_ `\      /'_ `\/\`'__\/\ \  /'_` \
%  \ \ \/\ \/\ \/\ \L\ \  __/\ \L\ \ \ \/ \ \ \/\ \L\ \
%   \ \_\ \_\ \_\ \____ \/\_\ \____ \ \_\  \ \_\ \___,_\
%    \/_/\/_/\/_/\/___L\ \/_/\/___L\ \/_/   \/_/\/__,_ /
%                  /\____/     /\____/
%                  \_/__/      \_/__/
%
%                        journal ing.grid
%
%
%
%
% This is file inggrid.cls
%
% Copyright 2024 Michaela Leštáková, Kevin T. Logan, TU Darmstadt
%
% Contributions by: Lisabeth George, Yali Wu
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   https://www.latex-project.org/lppl.txt
% and version 1.3c or later is part of all distributions of LaTeX
% version 2008 or later.
%
% This work has the LPPL maintenance status `maintained'.
%
% The Current Maintainer of this work is Michaela Leštáková.
%
% This work consists of the files inggrid.cls and final.def. 
%
% This work is a modified version of the jcls.cls file from 
% https://github.com/Journal-of-CLS/JCLS-Template kindly provided 
% and used with permission of Dominik Gerstdorfer.
% 
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{inggrid}[2024/01/31 v0.0.2 LaTeX class for ing.grid]
\typeout{This is inggrid.cls 2024/01/31 v0.0.2}


\LoadClass{article}

\RequirePackage{silence}
%\WarningsOff*
\RequirePackage{amsmath,amssymb}
\RequirePackage{setspace}
\RequirePackage[dvipsnames,svgnames]{xcolor}
\RequirePackage{fancyhdr}
\RequirePackage{academicons}
\RequirePackage{ccicons}
\RequirePackage{etoolbox}
\RequirePackage{xkeyval}
\RequirePackage[english]{babel}

\RequirePackage{datetime2}
\RequirePackage[style=ieee,backend=biber]{biblatex}
%\RequirePackage{svg} %required for svg images
\RequirePackage{xstring}


% font
\RequirePackage{parskip}
\RequirePackage{unicode-math}
\defaultfontfeatures{Scale=MatchLowercase}
\defaultfontfeatures[\rmfamily]{Ligatures=TeX,Scale=1}
\setmainfont{LiberationSerif}[
  Path = ./fonts/liberation/,
  Extension = .ttf,
  UprightFont = *-Regular,
  BoldFont = *-Bold,
  ItalicFont = *-Italic,
  BoldItalicFont = *-BoldItalic]
\setsansfont{LiberationSans}[
  Path = ./fonts/liberation/,
  Extension = .ttf,
  UprightFont = *-Regular,
  BoldFont = *-Bold,
  ItalicFont = *-Italic,
  BoldItalicFont = *-BoldItalic]
\setmonofont{LiberationMono}[
  Path = ./fonts/liberation/,
  Extension = .ttf,
  UprightFont = *-Regular,
  BoldFont = *-Bold,
  ItalicFont = *-Italic,
  BoldItalicFont = *-BoldItalic]
\setmathfont{XITS Math}

\RequirePackage{microtype}
\RequirePackage{upquote}
\RequirePackage{xurl}
\RequirePackage{bookmark}
\RequirePackage[paper=a4paper,
  top=30mm,
  right=17mm,
  left=60mm,
  footskip=17mm,
  marginparsep=7mm,
  marginparwidth=40mm,
  reversemarginpar=true
]{geometry}
\RequirePackage{graphicx}
\graphicspath{{figures/}}
\RequirePackage[Export]{adjustbox}
\RequirePackage{sidenotes}

\RequirePackage{booktabs}
\RequirePackage{longtable}
\setlength\LTleft{0pt}
\setlength\LTright{\fill}

\RequirePackage{listings}
\definecolor{orcid}         {RGB} {166, 206, 57}

\colorlet{primarycolor}     {DarkViolet}
\colorlet{secundarycolor}   {Plum}

\colorlet{graycolor}        {DarkGray}
\colorlet{highlightcolor1}  {IndianRed}
\colorlet{highlightcolor2}  {MediumSeaGreen}
\colorlet{highlightcolor3}  {Teal}
\colorlet{highlightcolor4}  {SteelBlue}

\colorlet{filecolor}        {highlightcolor1}
\colorlet{linkcolor}        {highlightcolor2}
\colorlet{citecolor}        {highlightcolor3}
\colorlet{urlcolor}         {highlightcolor4}

\colorlet{backgroundcolor}  {graycolor!10}

\DeclareRobustCommand\orcidlink[1]{\texorpdfstring{%
    \href{https://orcid.org/#1}{\textcolor{orcid}{\aiOrcid}}}{}}

\RequirePackage{lineno}
\renewcommand{\linenumberfont}{\ttfamily\small\color{primarycolor}}

\lstset{
  basicstyle=\ttfamily,
  commentstyle=\itshape\color{graycolor},
  keywordstyle=\bfseries\color{highlightcolor2},
  numberstyle=\ttfamily\small\color{graycolor},
  stringstyle=\color{highlightcolor3},
  breakatwhitespace=false,
  breaklines=true,
  captionpos=b,
  keepspaces=true,
  numbers=left,
  xleftmargin=12pt,
  numbersep=1em,
  showspaces=false,
  showstringspaces=false,
  showtabs=false,
  tabsize=2
}

\RequirePackage[small,sf,bf,raggedright]{titlesec}
\RequirePackage{selnolig}
\setstretch{1.25}
\RequirePackage{marginfix}
\RequirePackage{marginnote}
\renewcommand*{\marginfont}{\sffamily\footnotesize}
\renewcommand*{\raggedleftmarginnote}{}
\RequirePackage{changepage}
\RequirePackage{ifthen}
\newlength{\overhang}
\setlength{\overhang}{\marginparwidth}
\addtolength{\overhang}{\marginparsep}
\makeatletter
\newenvironment{fullwidth}
{\ifthenelse{\boolean{@twoside}}%
  {\begin{adjustwidth*}{-\overhang}{}}%
  {\begin{adjustwidth}{-\overhang}{}}}%
      {\ifthenelse{\boolean{@twoside}}%
      {\end{adjustwidth*}}%
      {\end{adjustwidth}}%
}
\RequirePackage{tcolorbox}
\newtcolorbox{whitebox}{colback=white,arc=0pt,outer arc=0pt,colframe=white}
\newtcolorbox{graybox}{colback=gray!10,arc=0pt,outer arc=0pt,colframe=gray!10}
\RequirePackage[ragged,bottom,norule,multiple]{footmisc}
\renewcommand{\footnotemargin}{0em}
\renewcommand*{\thefootnote}{\arabic{footnote}}
\renewcommand*\@makefntext[1]%
{\noindent{\@thefnmark}. #1}

\RequirePackage[
  %format=hang,
  justification=raggedright,
  singlelinecheck=off,
  labelfont=bf,
  font={normalfont,sf}]{caption}

\newcommand\setfield[2]{\csdef{@#1#2}}
\newcommand\getfield[2]{\ifcsvoid{@#1#2}{}{\csuse{@#1#2}}}
\newcommand\printfield[3]{%
  \ifcsvoid{@#1#2}{}{\csuse{@#1#2}\unskip#3}%
}
\newcommand\thefield[3]{%
  \ifcsvoid{@#1#2}{}{\csuse{@#1#2}#3}%
}

\newcommand\keywords[1]%
{\setfield{keywords}{}{#1}}
\newcommand\datesubmitted[1]%
{\setfield{datesubmitted}{}{#1}}
\newcommand\datereceived[1]%
{\setfield{datereceived}{}{#1}}
\newcommand\dateaccepted[1]%
{\setfield{dateaccepted}{}{#1}}
\let\date\relax
\newcommand\datepublished[1]%
{\setfield{datepublished}{}{#1}%
  \setfield{date}{}{#1}}
\newcommand\doi[1]%
{\setfield{doi}{}{\href{https://doi.org/#1}{doi.org/#1}}}
\newcommand\shorttitle[1]%
{\setfield{shorttitle}{}{#1}}
\newcommand\subtitle[1]%
{\setfield{subtitle}{}{#1}}
\newcommand\articletype[1]%
{\setfield{articletype}{}{#1}}
\setfield{articletype}{}{Research Article}
\newcommand\articleclass[1]%
{\setfield{articleclass}{}{#1}}
\newcommand\reviewers[1]%
{\setfield{reviewers}{}{#1}}
\newcommand\dataavailability[1]%
{\setfield{dataavailability}{}{#1}}
\newcommand\softwareavailability[1]%
{\setfield{softwareavailability}{}{#1}}
\newcommand\licenses[1]%
{\setfield{licenses}{}{#1}}
\newcommand\corresponding[1]%
{\setfield{corresponding}{}{#1}}
\newcommand\volume[1]%
{\setfield{volume}{}{#1}}
\newcommand\issue[1]%
{\setfield{issue}{}{#1}}
\newcommand\issueyear[1]%
{\setfield{issueyear}{}{#1}}

\newcommand\sideinfos{}
\newcommand\sideinfo[2]{%
  \gappto\sideinfos{%
    \marginpar{\raggedright\sffamily\footnotesize\textbf{#1: } \\ #2 \vskip 1.5ex}%
  }
}
\newcommand\sideinfofield[2]{
  \ifcsvoid{#2}{}{\sideinfo{#1}{\csuse{@#2}}}
}

\newcounter{authors}
\newcounter{affiliations}
\newcounter{reviewers}
\newcounter{counter}
\newcounter{corrcounter}

\def\final{final}
\def\letter{letter}
\def\preprint{preprint}

\define@key{author}{orcid}{\csdef{author@orcid}{#1}}
\define@key{author}{surname}{\csdef{author@surname}{#1}}
\define@key{author}{given-names}{\csdef{author@givennames}{#1}}
\define@key{author}{email}{\csdef{author@email}{#1}}
\define@key{author}{affiliation}{\csdef{author@affiliation}{#1}}
\define@key{author}{equal-contrib}{\csdef{author@equalcontrib}{#1}}
\define@key{author}{cor-id}{\csdef{author@corid}{#1}}
\define@key{author}{corresponding}{\csdef{author@corresponding}{#1}}
\define@key{author}{contribution}{\csdef{author@contribution}{#1}}
\presetkeys{author}{ % Set default values
  email=,
  affiliation=,
  contribution=,
  orcid=,
  corresponding=,
}{}

\define@key{reviewer}{reviewername}{\csdef{reviewer@reviewername}{#1}}
\define@key{reviewer}{reviewersurname}{\csdef{reviewer@reviewersurname}{#1}}
\define@key{reviewer}{reviewerorcid}{\csdef{reviewer@reviewerorcid}{#1}}
\presetkeys{reviewer}{ % Set default values
  reviewerorcid=,
}{}

\newcommand\reviewer[1]{%
  \begingroup
  \global\stepcounter{reviewers}%
  \setkeys{reviewer}{#1}%
  \global\csedef{@reviewerorcid\thereviewers}{\expandafter\reviewer@reviewerorcid}%
  \global\csedef{@reviewersurname\thereviewers}{\expandafter\reviewer@reviewersurname}%
  \global\csedef{@reviewername\thereviewers}{\expandafter\reviewer@reviewername}%
  \endgroup
}

\define@key{affiliation}{id}{\csdef{aff@id}{#1}}
\define@key{affiliation}{group}{\csdef{aff@group}{#1}}
\define@key{affiliation}{department}{\csdef{aff@department}{#1}}
\define@key{affiliation}{organization}{\csdef{aff@organization}{#1}}
\define@key{affiliation}{isni}{\csdef{aff@isni}{#1}}
\define@key{affiliation}{ringgold}{\csdef{aff@ringgold}{#1}}
\define@key{affiliation}{ror}{\csdef{aff@ror}{#1}}
\define@key{affiliation}{pid}{\csdef{aff@pid}{#1}}
\define@key{affiliation}{street-address}{\csdef{aff@streetaddress}{#1}}
\define@key{affiliation}{city}{\csdef{aff@city}{#1}}
\define@key{affiliation}{country}{\csdef{aff@county}{#1}}
\define@key{affiliation}{country-code}{\csdef{aff@countrycode}{#1}}
\presetkeys{affiliation}{ % Set default values
  organization=,
  street-address=,
  country=,
  country-code=,
}{}

\renewcommand\author[1]{%
  \begingroup
  \global\stepcounter{authors}%
  \setkeys{author}{#1}%
  \global\csedef{@orcid\theauthors}{\expandafter\author@orcid}%
  \global\csedef{@corresponding\theauthors}{\expandafter\author@corresponding}%
  \global\csedef{@surname\theauthors}{\expandafter\author@surname}%
  \global\csedef{@givennames\theauthors}{\expandafter\author@givennames}%
  \global\csedef{@email\theauthors}{\expandafter\author@email}%
  \global\csedef{@affiliation\theauthors}{\expandafter\author@affiliation}%
  \global\csedef{@contribution\theauthors}{\expandafter\author@contribution}%
  \endgroup
}

\newcommand\affiliation[1]{%
  \begingroup
  \global\stepcounter{affiliations}%
  \setkeys{affiliation}{#1}
  \global\csedef{@id\theaffiliations}{\expandafter\aff@id}%
  \global\csedef{@department\theaffiliations}{\expandafter\aff@department}%
  \global\csedef{@organization\theaffiliations}{\expandafter\aff@organization}%
  \global\csedef{@streetaddress\theaffiliations}{\expandafter\aff@streetaddress}%
  \global\csedef{@city\theaffiliations}{\expandafter\aff@city}%
  \endgroup
}

\newcommand\printauthor[1]{%
  \printfield{givennames}{#1}{}~\printfield{surname}{#1}{}
  \ifcsvoid{@orcid#1}{\unskip}{\unskip\,\orcidlink{\csuse{@orcid#1}}}
  \unskip\,\textsuperscript{\csuse{@affiliation#1}}%
}

\newcommand\printcorrespondingauthor{
  \setcounter{counter}{0}
  \setcounter{corrcounter}{0}
  \@whilenum\value{counter}<\value{authors}\do
  {\stepcounter{counter}
    \ifcsvoid{@corresponding\thecounter}{\unskip}{
      \IfStrEqCase{\thefield{corresponding}{\thecounter}{}}
      {
        {True}{
        \printfield{givennames}{\thecounter}{} \printfield{surname}{\thecounter}{}\par
        \href{mailto:\thefield{email}{\thecounter}{}}{\printfield{email}{\thecounter}}
        \stepcounter{corrcounter}}
        {true}{
        \printfield{givennames}{\thecounter}{} \printfield{surname}{\thecounter}{}\par
        \href{mailto:\thefield{email}{\thecounter}{}}{\printfield{email}{\thecounter}}
        \stepcounter{corrcounter}}
        {TRUE}{
        \printfield{givennames}{\thecounter}{} \printfield{surname}{\thecounter}{}\par
        \href{mailto:\thefield{email}{\thecounter}{}}{\printfield{email}{\thecounter}}
        \stepcounter{corrcounter}}
        {False}{\unskip}
        {false}{\unskip}
        {FALSE}{\unskip}
      }
    }
  }
  \ifnum \value{corrcounter}=0
    \errmessage{Corresponding author missing.}
  \fi
  \ifnum \value{corrcounter}>1
    \errmessage{Please define precisely 1 corresponding author.}
  \fi
}

\newcommand\printaffiliation[1]{%
\printfield{id}{#1}{.\;}%
  \printfield{department}{#1}{, }%
  \printfield{organization}{#1}{, }%
  \printfield{streetaddress}{#1}{, }%
  \printfield{city}{#1}{.}
}

\newcommand\printcontribution[1]{%
  \ifcsvoid{@contribution#1}
  {}
  {\textbf{\printfield{givennames}{#1}{} \printfield{surname}{#1}{}:} \printfield{contribution}{#1}{}}
}

\newcommand\printauthors{
  \setcounter{counter}{0}
  \@whilenum\value{counter}<\value{authors}\do
  { \ifnum\value{counter}=\numexpr\value{authors}-1
      \stepcounter{counter}\printauthor{\thecounter}\par
    \else
      \stepcounter{counter}\printauthor{\thecounter},
    \fi}
}

\newcommand\printaffiliations{
  \setcounter{counter}{0}
  \@whilenum\value{counter}<\value{affiliations}\do
  {\stepcounter{counter}\printaffiliation{\thecounter}\par}
}

\newcommand\printreviewer[1]{%
  \printfield{reviewername}{#1}{}~\printfield{reviewersurname}{#1}{}
  \ifcsvoid{@reviewerorcid#1}{\unskip}{\unskip\,\orcidlink{\csuse{@reviewerorcid#1}}}
}

\newcommand\printreviewers{
  \setcounter{counter}{0}
  \@whilenum\value{counter}<\value{reviewers}\do
  { \ifnum\value{counter}=\numexpr\value{reviewers}-1
      \stepcounter{counter}\printreviewer{\thecounter}\par
    \else
      \stepcounter{counter}\printreviewer{\thecounter},
    \fi}
}

\newcommand\printcontributions{
  \section{Roles and contributions}
  \setcounter{counter}{0}
  \@whilenum\value{counter}<\value{authors}\do
  {\stepcounter{counter}\printcontribution{\thecounter}\par}
}

\newcommand\printacknowledgements{
  \IfFileExists{acknowledgements.tex}
  {\section{Acknowledgements}
    \input{acknowledgements.tex}}
  {}
}



\fancypagestyle{plain}{%
\fancyhf{}% clear all header and footer fields
\ifx\@articleclass\final
\fancyfoot[L]{\sffamily ing.grid \@volume (\@issue), \@issueyear} % final version takes year from \@issueyear
\fancyfoot[R]{\sffamily \thepage}
\else
  \ifx\@articleclass\letter
  \fancyfoot[L]{\sffamily ing.grid \@volume (\@issue), \@issueyear} % letter takes year from \@issueyear
  \fancyfoot[R]{\sffamily \thepage}
  \else
  \fancyfoot[L]{\sffamily ing.grid \the\year} % preprint sets year to current year
  \fancyfoot[R]{\sffamily \thepage}
  \fi
\fi
\renewcommand{\headrulewidth}{0pt}%
\renewcommand{\footrulewidth}{0pt}%
}

\fancypagestyle{inggrid}{%
  \fancyhf{}% clear all header and footer fields
  \fancyhead[L]{\normalsize\sffamily\MakeUppercase{\@articletype}}
  \fancyhead[R]{\sffamily\printfield{shorttitle}{}{}}
  \ifx\@articleclass\final
  \fancyfoot[L]{\sffamily ing.grid \@volume (\@issue), \@issueyear} % final version takes year from \@issueyear
  \fancyfoot[R]{\sffamily \thepage}
  \else
    \ifx\@articleclass\letter
    \fancyfoot[L]{\sffamily ing.grid \@volume (\@issue), \@issueyear} % letter takes year from \@issueyear
    \fancyfoot[R]{\sffamily \thepage}
    \else
    \fancyfoot[L]{\sffamily ing.grid \the\year} % preprint sets year to current year
  \fancyfoot[R]{\sffamily \thepage}
    \fi
  \fi
  \renewcommand{\headrulewidth}{0pt}%
  \renewcommand{\footrulewidth}{0pt}%
}

\pagestyle{inggrid}

\AtEndPreamble{%
  \makeatletter
  \ifx\@articleclass\letter
    \renewenvironment{abstract}
    {\begin{graybox}
      \sffamily\textbf{Author biography.}}
      {\end{graybox}}
  \else
    \renewenvironment{abstract}
    {\begin{graybox}
      \sffamily\textbf{\abstractname.}}
      {\end{graybox}}
  \fi
  \makeatother
}


\RequirePackage{hyperref}
\hypersetup{
  colorlinks=true,
  filecolor=filecolor,
  linkcolor=linkcolor,
  urlcolor=urlcolor,
  citecolor=citecolor,
}
\RequirePackage{csquotes} %shifted to avoid warning

\IfFileExists{./metadata/authors.tex}
{\input{./metadata/authors.tex}}
{}

\IfFileExists{final.def}
{\input{final.def}
  \input{./metadata/article.tex}}
{\AfterEndEnvironment{abstract}{\linenumbers}}

\newcommand\inggridlinenumbers{
  \ifx\@articleclass\preprint
    \linenumbers
  \fi
}

\newbool{scikgtex}
\setbool{scikgtex}{false}
\newcommand\useScikgtex{
    \setbool{scikgtex}{true}
}

\AtEndPreamble{
  \ifbool{scikgtex}{
    \RequirePackage{scikgtex}
  }{}
}

\newcommand\printreference{
  \addbibresource{references.bib}
}

\AtEndDocument{
  \printacknowledgements
  \printcontributions
  \printbibliography
}
