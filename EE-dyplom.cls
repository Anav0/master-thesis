% ---------------------------------------------
% Licencja szablonu: CC-BY 4.0
% https://creativecommons.org/licenses/by/4.0/
% Autor: Łukasz Makowski <lukasz.makowski@ee.pw.edu.pl>
% https://github.com/SP5LMA/EE-dyplom
% ---------------------------------------------
% Szablon prac dyplomowych na Wydziale Elektrycznym PW,
% zgodny z Zarządzeniami JM Rektora PW:
% 24/2016, 43/2016, 57/2016.
% Większość opcji ustawiona zgodnie z zaleceniami.
% Główne różnice - dla poprawy czytelności pracy:
%   * stopień pisma 12 pt (zamiast 11 pt)
%   * zwiększone światło międzywierszowe (1.46557 zamiast 1.15)
%   * wyróżniające się nagłówki rozdziałów
%   * kolorowe, klikalne odnośniki
% Możesz edytować ten plik, jeśli Cię to nie przeraża ;)
% ---------------------------------------------
% Dziękuję innym Autorom, na których szablonach mogłem się wzorować:
% prof. dr hab. inż. Jacek Starzyński, Wydział Elektryczny, PW
% Artur M. Brodzki i Piotr Woźniak, Wydział EiTI, PW
% ---------------------------------------------

% ---------------------------------------------
% Wymagane: druk dwustronny (twoside, openright) na A4
% Zalecane: stopień pisma 11 pt
% ---------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{EE-dyplom}[2020/12/24 Praca dyplomowa na Wydziale Elektrycznym PW]

%\LoadClass[a4paper,11pt,twoside,openright]{report}
% Alternatywnie: 12 pt
\LoadClass[a4paper,12pt,oneside,openright]{book}
%--------------------------------------
% Zdefiniowanie parametru klasy
%--------------------------------------
% \RequirePackage{kvoptions}
% \SetupKeyvalOptions{family=EE-dyplom.cls, prefix=ee}
% \ProcessKeyvalOptions*
% ---------------------------------------------
% Wykaz symboli i skrótów
% Pakiet musi być wczytany przed mathspec
% ---------------------------------------------
\RequirePackage[acronym,symbols,nopostdot]{glossaries}
\setglossarysection{section}
\makeglossaries
\loadglsentries{glossary}
\newcommand{\acronymstitle}{Wykaz skrótów i symboli}

% ---------------------------------------------
% Krój pisma w XeLaTeX
% Zalecane: krój bezszeryfowy (sfdefault)
% Symbole matematyczne
% Specyfikacja kroju pisma
% Lista krojów pisma (aka "czcionek") w Overleaf:
% https://www.overleaf.com/learn/latex/Questions/Which%20OTF%20or%20TTF%20fonts%20are%20supported%20via%20fontspec%3F
% ---------------------------------------------
\RequirePackage{algorithm}
%\RequirePackage{algorithmic}
\RequirePackage{algpseudocode}
\RequirePackage{amsfonts}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{esint}
%\RequirePackage[version=4]{mhchem}
\RequirePackage{mathspec} % wczytuje również fontspec
%\setmainfont{Latin Modern Roman}
%\setromanfont{Latin Modern Roman}
%\setsansfont{Latin Modern Sans}
%\setmonofont{Latin Modern Mono}
%\setmathrm{Latin Modern Math}
%\setmathfont(Digits,Latin)[Scale=MatchLowercase]{Latin Modern Math}
\renewcommand{\familydefault}{\rmdefault}

% ---------------------------------------------
% Podstawowa konfiguracja XeLaTeX
% ---------------------------------------------
\RequirePackage{xltxtra}

% ---------------------------------------------
% Lokalizacja XeLaTeX % PL-EN
% Musi być wczytana na początku
% ---------------------------------------------
\RequirePackage{polyglossia}
\setdefaultlanguage{polish}
%\setotherlanguage{polish}
%\setotherlanguage{english}

% ---------------------------------------------
% Wymiary strony
% Zalecane:
%   margines wewnętrzny 30 mm,
%   margines zewnętrzny 20 mm,
%   marginesy górny i dolny 20 mm
% ---------------------------------------------
\RequirePackage[a4paper,margin=25mm]
{geometry}
% Do debugowania wymiarów
%\RequirePackage{showframe}

% ---------------------------------------------
% Odstęp międzywierszowy
% Zalecane: interlinia 1,15
% ---------------------------------------------
\RequirePackage{setspace}
%
% Alternatywnie supergęsty tekst: lineskip 12 pt gdy stopień pisma 12 pt
% 52 linie tekstu 12 pt
%\setstretch{0.8333333} % bo LaTeX ma defaultowy współczynnik 1.2
%
% Interlinia 1,15 (0.83333 * 1.15)
% 46 linii tekstu 12 pt
%\setstretch{0.9583}
%
% Alternatywnie interlinia 1.2*stopień pisma (standard w LaTeX)
% 44 linie tekstu 12 pt
%\singlespacing % == \setstretch{1.0}
%
% Alternatywnie superzłoty podział (0.83333 * 1.46557)
% 35 linii tekstu 12 pt
\setstretch{1.2213}
%
% Alternatywnie interlinia 1.5
% 35 linii tekstu 12 pt
%\onehalfspacing % == \setstretch{1.25} 1.25*1.2=1.5
%
% Alternatywnie złoty podział (odstęp 1.618):
% 31 linii tekstu 12 pt
%\setstretch{1.348333}
%
% Alternatywnie podwójna interlinia
% 26 linii tekstu 12 pt
%\doublespacing

% ---------------------------------------------
% Nagłówki i stopki stron
% Wymagane: numery stron w zewnętrznych,
% dolnych narożnikach.
% ---------------------------------------------
\RequirePackage{fancyhdr}
\fancyhf{}
\fancypagestyle{plain}{ %
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
    \fancyfoot[RO,LE]{\thepage}
}
\fancypagestyle{headings}{
\newgeometry{
    inner=2cm,
    outer=2cm,
    vmargin=2cm
    }

    \fancyhf{}
	\renewcommand{\headrulewidth}{1pt}
	\fancyheadoffset{0cm}
    \fancyhead[LE]{\textit{\nouppercase{\leftmark}}}
    \fancyhead[RO]{\textit{\nouppercase{\rightmark}}}
    \fancyfoot[RO,LE]{\thepage}
    \renewcommand{\footrulewidth}{0pt}
    \setlength{\headheight}{16pt}
}
\pagestyle{headings}

% ---------------------------------------------
% Puste strony niech będą naprawdę puste
% ---------------------------------------------
\RequirePackage{emptypage}

% ---------------------------------------------
% Formatowanie akapitów
% Do wyboru: akapit z wcięciem 0,5 cm
% ALBO bez wcięcia z odstępem 4 [?] przed akapitem
% Uwaga: pierwszy akapit rozdziału zawsze jest bez
% wcięcia i jest to prawidłowe, zgodne z zasadami
% typografii.
% ---------------------------------------------
% Rozwiązanie 1:
\setlength{\parindent}{0.5cm}
\setlength{\parskip}{0em}
% Rozwiązanie 2:
%\setlength{\parindent}{0pt}
%\setlength{\parskip}{4mm}

% ---------------------------------------------
% Odwołania do źródeł (bibliografia)
% Do wyboru: styl numeracyjny wg normy PN (?)
% ALBO styl harwardzki
% ---------------------------------------------
\RequirePackage[backend=biber,
        style=ieee,     % styl numeryczny IEEE prawie jak PN
        sorting=nyt,    % sortowanie spisu po nazwiskach
        citestyle=numeric-comp % kompaktowe odnośniki numeryczne typu [21-23]
    ]{biblatex}
\addbibresource{EE-dyplom.bib}
\DeclareNameAlias{default}{family-given} % nazwisko na początku
\newcommand{\bibliografia}{
    \cleardoublepage
    \phantomsection
    \addcontentsline{toc}{chapter}{\refname}
    \printbibliography
}
%
% Alternatywa - styl harwardzki:
%
%\RequirePackage{natbib}
%\bibliographystyle{agsm}
%\newcommand{\bibliografia}{
%        \bibliography{EE-dyplom.bib}
%}

% ---------------------------------------------
% Żeby spis treści zawierał to co trzeba
% ---------------------------------------------
\RequirePackage[nottoc]{tocbibind}

% ---------------------------------------------
% Numeracja tabel i rysunków
% Do wyboru: ciągła w całej pracy
% ALBO kolejna w rozdziałach
% ---------------------------------------------
% Rozwiązanie 1: ciągła w pracy
\RequirePackage{chngcntr}
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}
\counterwithout{equation}{chapter}
% Rozwiązanie 2: kolejna w rozdziałach
% To standard - wystarczy zakomentować powyższe

% ---------------------------------------------
% Tytuły tabel i podpisy rysunków
% Zalecenie: 9 pt, "justowany do lewej strony" (?)
% ---------------------------------------------
% Gdy główny stopień pisma to 11 pt wtedy footnotesize daje 9 pt
%\RequirePackage[format=plain, labelfont=bf, labelsep=period,
%            font=footnotesize, justification=RaggedRight]
%        {caption}
% Alternatywnie: 10 pt gdy główny to 11 pt i 11 pt gdy główny to 12 pt
\RequirePackage[format=plain, labelfont=bf, labelsep=period,
            font=small, justification=justified]
        {caption}
\RequirePackage{subcaption}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ustawienia typografii
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ---------------------------------------------
% Kontrola wdów i sierot
% ---------------------------------------------
\widowpenalty 20000
\clubpenalty 20000
\raggedbottom

% ---------------------------------------------
% Przenoszenie wyrazów do nowej linii
% ---------------------------------------------
\pretolerance 1000
\hyphenpenalty 1000
\tolerance 2000
\emergencystretch .618em
\righthyphenmin 4
\lefthyphenmin 4

% ---------------------------------------------
% Znaki cytowania % PL-EN
% ---------------------------------------------
\RequirePackage{csquotes}
\setquotestyle[guillemets]{polish}
%\setquotestyle{english}

% ---------------------------------------------
% Klikalne linki
% ---------------------------------------------
\RequirePackage{hyperref}
\hypersetup{ % Na bazie https://en.wikibooks.org/wiki/LaTeX/Hyperlinks
%    bookmarks=true,         % show bookmarks bar? FIXME
    unicode=true,           % non-Latin characters in Acrobat’s bookmarks
    pdftoolbar=true,        % show Acrobat’s toolbar?
    pdfmenubar=true,        % show Acrobat’s menu?
    pdffitwindow=false,     % window fit to page when opened
    pdfstartview={FitH},    % fits the width of the page to the window
%    pdfsubject={}, % subject of the document
%    pdfkeywords={}, % list of keywords
    linktoc=all,            % defines which part of an entry in the table
                            %of contents is made into a link (none,section,page,all)
    pdfnewwindow=true,      % links in new PDF window
    colorlinks=true,        % false: boxed links; true: colored links
    linkcolor=EEBlueDark,   % color of internal links (change box color with linkbordercolor)
    citecolor=EEBlueDark,   % color of links to bibliography
    filecolor=EEBlueDark,   % color of file links
    urlcolor=EEBlueDark,    % color of external links
    linkbordercolor={1 0 0}, 	% color of frame around internal links (if colorlinks=false)
    citebordercolor={0 1 0}, 	% color of frame around citations
    urlbordercolor={0 1 1},     % color of frame around URL links
}

% ---------------------------------------------
% For changing margin
% ---------------------------------------------
\newenvironment{changemargin}[2]{%
\begin{list}{}{%
\setlength{\topsep}{0pt}%
\setlength{\leftmargin}{#1}%
\setlength{\rightmargin}{#2}%
\setlength{\listparindent}{\parindent}%
\setlength{\itemindent}{\parindent}%
\setlength{\parsep}{\parskip}%
}%
\item[]}{\end{list}}


% ---------------------------------------------
% Lorem ipsum
% ---------------------------------------------
\RequirePackage{lipsum}

% ---------------------------------------------
% Formatowanie tabel
% ---------------------------------------------
\RequirePackage{multirow}
\RequirePackage{multicol}
\RequirePackage{longtable}
\RequirePackage{colortbl}

% ---------------------------------------------
% Kolory
% ---------------------------------------------
\RequirePackage[usenames,dvipsnames]{xcolor}
\definecolor{mysamplecolor}{rgb}{0.123, 0.456, 0.789}
% Kolor Wydziału Elektrycznego i dwa pokrewne monochromatyczne.
% Kolor podstawowy jest tu określony w przybliżeniu, gdyż
% Zarządzenie definiuje go niejednoznacznie. Dla wskazanego
% Pantone 2716C i 2716U podane wartości CMYK (50, 30, 0, 0)
% są inne niż podaje to Pantone na swej stronie www (38, 26, 0, 0).
\definecolor{EEBlue}{cmyk}{0.50, 0.30, 0, 0}            % #8ba5d3
\definecolor{EEBlueLight}{cmyk}{0.14, 0.04, 0.03, 0}    % #e2ecf8
\definecolor{EEBlueDark}{cmyk}{0.73, 0.55, 0.35, 0.32}  % #45536a
% Uzupełniający dla EEBlue - pomarańczowy
\definecolor{EEOrange}{cmyk}{0.02, 0.41, 0.94, 0}       % #f6a307
% Uzupełniające bliskie dla EEBlue, 10 stopni na kole barw
\definecolor{EETangerine}{RGB}{255, 119, 0}
\definecolor{EEGold}{RGB}{255, 209, 0}
\definecolor{EEAzure}{RGB}{0, 136, 255}
\definecolor{EEUltramarine}{RGB}{0, 46, 255}

% ---------------------------------------------
% Ścieżki do grafik
% ---------------------------------------------
\graphicspath{{gfx/}{rysunki/}}

% ---------------------------------------------
% Listingi programów
% ---------------------------------------------
\RequirePackage{listings}
\lstdefinestyle{EEStyle}{
    backgroundcolor=\color{white},
    commentstyle=\color{EEBlueDark},
    keywordstyle=\bfseries\color{EEUltramarine},
    numberstyle=\tiny\color{EEBlue},
    stringstyle=\color{EETangerine},
    basicstyle=\ttfamily\small,
    breakatwhitespace=false,
    breaklines=true,
    captionpos=b,
    keepspaces=true,
    numbers=left,
    firstnumber=1, % 2
    stepnumber=1,  % 5
    numbersep=5pt,
    showspaces=false,
    showstringspaces=false,
    showtabs=false,
    tabsize=2,
    frame=lB,
    frameround=tttt,
    inputpath=src
}
\lstset{style=EEStyle}
\renewcommand{\lstlistingname}{Algorytm}
\renewcommand{\lstlistlistingname}{Spis algorytmów}
\renewcommand{\ALG@name}{Algorytm}
\renewcommand{\listalgorithmname}{Spis algorytmów}

% ---------------------------------------------
% Tabelki
% ---------------------------------------------
\RequirePackage{tabularx}
\renewcommand{\arraystretch}{1.4}

% ---------------------------------------------
% Wzory
% ---------------------------------------------
\newenvironment{conditions}
{\par\vspace{\abovedisplayskip}\noindent\begin{tabular}{>{$}l{2in}<{$} @{${} \ {}$} l}}
  {\end{tabular}\par\vspace{\belowdisplayskip}}

% ---------------------------------------------
% Ozdobniki ścieżek plików, menu i klawiszy
% ---------------------------------------------
\RequirePackage[os=win]{menukeys}
\renewmenumacro{\menu}[>]{roundedmenus}
\renewmenumacro{\directory}{pathswithfolder}
\renewmenumacro{\keys}{shadowedroundedkeys}


% ---------------------------------------------
% Dodatki
% ---------------------------------------------
\RequirePackage{etoolbox}
\RequirePackage[titletoc]{appendix}
\newcommand{\appendiceslisttitle}{Spis załączników}
\newcommand{\appendixprefix}{Załącznik}
\renewcommand{\appendixname}{\appendixprefix}

% ---------------------------------------------
% Stopnie pisma tytułów
% Zalecenie: wielkości 14 [?], 13 [?], 12 [?]
% odpowiednio dla poziomów I, II i III
% ---------------------------------------------
%\RequirePackage{titlesec}
%\titleformat{\chapter}[display]
%  {\fontsize{18pt}{48pt}\selectfont \bfseries}
% {\chaptertitlename\ \thechapter}{1em}
%  {\fontsize{14pt}{0pt}\selectfont \bfseries}
%\titleformat{\section}[hang]
%  {\fontsize{13pt}{18pt}\selectfont \bfseries}
%  {\thesection}{1em}{}
%\titleformat{\subsection}[hang]
%  {\fontsize{12pt}{15pt}\selectfont \bfseries}
%  {\thesubsection}{1em}{}
% Alternatywne rozwiązanie:
% LaTeX robi to dobrze więc po co zmieniać?

% ---------------------------------------------
% Wyliczenia
% Zalecenie: tylko kropka lub myślnik
% ---------------------------------------------
\RequirePackage{enumitem}
\newlength\docparskip
\setlength{\docparskip}{\parskip}
\setlist[itemize,2]{nosep,
        label=$\bullet$,    % ustawiony krój ma kwadratowe kropki
}
\setlist[itemize,2]{nosep,label=--}
\setlist[itemize,3]{nosep,label=-}
\setlist[itemize,4]{nosep,label=$\cdot$}
%\setlist[description]{font=\normalfont, labelwidth=3em}

% ---------------------------------------------
% Przypisy dolne
% ---------------------------------------------
% Standardowo zgodne z zaleceniami

% ---------------------------------------------
% W celu umieszczenia PDF z "Oświadczeniami"
% ---------------------------------------------
\RequirePackage{tikz}
\RequirePackage{pdfpages}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Here be dragons...
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% STRONA TYTUŁOWA
% Here be dragons...
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\department}[1]{
    \newcommand{\@department}{#1}
}
\newcommand{\instytut}[1]{
    \newcommand{\@instytut}{#1}
}
\newcommand{\kierunek}[1]{
    \newcommand{\@kierunek}{#1}
}
\newcommand{\specjalnosc}[1]{
    \newcommand{\@specjalnosc}{#1}
}
\newcommand{\album}[1]{
    \newcommand{\@album}{#1}
}
\newcommand{\promotor}[1]{
    \newcommand{\@promotor}{#1}
}
\newcommand{\engtitle}[1]{
    \newcommand{\@engtitle}{#1}
}

\newcommand{\worktypelocal}{Praca Magisterska}
\newcommand{\kieruneklocal}{na~kierunku }
\newcommand{\specjalnosclocal}{w~specjalności }
\newcommand{\titlelocal}{\@title }
\newcommand{\albumlocal}{numer~albumu }
\newcommand{\promotorlocal}{Praca wykonana pod kierunkiem }
\newcommand{\citylocal}{OPOLE }

\let\oldmaketitle\maketitle
\renewcommand{\maketitle}{
    \linespread{1.15}
    \thispagestyle{empty}

    \begin{center}
    \includegraphics[scale=0.35]{PWhead.png}
    \vskip 2em
    \LARGE \@department
    \vskip 0.5em
    \fontsize{18pt}{18pt} \selectfont \@instytut
    \vskip 2em
    \LARGE \worktypelocal
    \vskip 2em
    \LARGE \@author \\
    \vskip 2.5em
    \fontsize{19pt}{19pt} \textbf{\titlelocal}
        \vskip 1.5em
	\fontsize{15pt}{15pt} \selectfont \textbf{\@engtitle}
    \vfill
    \begin{flushright}
        \large \promotorlocal\\\@promotor
    \end{flushright}
    \vfill
    \normalsize \citylocal \@date
    \end{center}
\newgeometry{
    inner=2cm,
    outer=2cm,
    vmargin=1cm
    }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% streszczenie, abstract
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\wstep}[1]{
    \newcommand{\@wstep}{#1}
}
\newcommand{\streszczeniepracy}[1]{
    \newcommand{\@streszczeniepracy}{#1}
}
\newcommand{\slowakluczowe}[1]{
    \newcommand{\@slowakluczowe}{#1}
}
\newcommand{\thesisabstract}[1]{
    \newcommand{\@thesisabstract}{#1}
}
\newcommand{\thesiskeywords}[1]{
    \newcommand{\@thesiskeywords}{#1}
}

% Wstęp
\newcommand{\stronawstepu}{
    \cleardoublepage
    \thispagestyle{empty}
    \begin{center}
        \textbf{\large Wstęp}
    \end{center}
    \@wstep
    \cleardoublepage
}

% Symbole definiujące problem
\newcommand{\sRef}{\emph{R}}
\newcommand{\sSubRef}{\emph{r}}
\newcommand{\sSol}{\emph{S}}
\newcommand{\sTermSet}{\emph{s}}
\newcommand{\sTerm}{\emph{t}}
\newcommand{\sPlace}{\emph{p}}
\newcommand{\sGap}{\emph{G}}
\newcommand{\sTermsList}{\emph{Terms}}

% Streszczenie polskie
\newcommand{\stronastreszczenia}{
    \cleardoublepage
    \thispagestyle{empty}
    \begin{center}
        \textbf{\large\@title}

        \textbf{Streszczenie}
    \end{center}
    \@streszczeniepracy

    \vskip 2em
    \noindent\textbf{Słowa kluczowe: }
    \@slowakluczowe
    \cleardoublepage
}

% Abstract angielski
\newcommand{\abstractpage}{
    \cleardoublepage
    \thispagestyle{empty}
    \begin{center}
        \textbf{\large\@engtitle}

        \textbf{Abstract}
    \end{center}
    \@thesisabstract

    \vskip 2em
    \noindent\textbf{Keywords: }
    \@thesiskeywords
    \cleardoublepage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Oświadczenia o autorstwie
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\authorship}{
	\includepdf[pages=-]{gfx/oswiadczenie_autora_pracy.pdf}
    \cleardoublepage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Jedno polecenie - kombajn stron początkowych
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtBeginDocument{\addtocontents{toc}{\protect\thispagestyle{empty}}}
\newcommand{\frontpages}{
    \counterwithout{lstlisting}{chapter} % hack niestety
    \pagestyle{empty}
    \maketitle
    \input{tekst/chapters/abstract.tex}
    \newpage
    \input{tekst/chapters/introduction.tex}
    \newpage
    \tableofcontents
    \cleardoublepage
    \pagestyle{headings}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Lista skrótów i symboli
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\acronymslist}{
%    \cleardoublepage
    \chapter*{\acronymstitle}
    \pagestyle{plain}
    \addcontentsline{toc}{chapter}{\acronymstitle}
    \printglossary[type=\acronymtype,title={}]
%    \printglossary[type=symbols,title={}] % problem z symbolami
    % Alternatywna lista symboli - do użycia tylko w Overleaf
    \input{symbols}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Załączniki i ich lista
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\easyappendix[1]{
    \chapter{#1}
    \addcontentsline{app}{chapter}{\appendixname~\Roman{chapter}\hspace{.5em}~#1}
}

\makeatletter
\newcommand\listofappendices{
    % "Spis treści" załączników (zbędne ale skoro ma być - niech będzie)
    \chapter*{\appendiceslisttitle}\@starttoc{app}
    % Lista załączników niech sobie będzie, skoro musi ale
    % nie zatruwajmy nią spisu treści.
%    \addcontentsline{toc}{chapter}{\appendiceslisttitle}
}
\makeatother

\newcommand\easyappendices{
    \listofappendices
    \renewcommand{\appendixname}{\appendixprefix}
    \begin{appendices}
        \renewcommand{\thechapter}{\Roman{chapter}}
        \input{appendices}
    \end{appendices}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Jedno polecenie - kombajn stron końcowych (bez bibliografii)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\tailpage}{
    % wykaz symboli i skrótów
    % \acronymslist

    % spis rysunków
    \listoffigures

    % spis tabel
    \listoftables

    % lista algorytmów / fragmentów kodu
    \listofalgorithms

    % \easyappendices
}
