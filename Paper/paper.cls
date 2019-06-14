\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{paper}[2019/04/19 Simon Koenig Paper-Class]

\LoadClass[a4paper, 9pt, twocolumn]{extarticle}
\RequirePackage[utf8]{inputenc}
\RequirePackage{babel}
\RequirePackage[top=2.6cm, bottom=3cm, inner=2.5cm, outer=2.5cm, heightrounded, twocolumn]{geometry}
\RequirePackage{xcolor}
\RequirePackage{titling}
\RequirePackage[pdftex]{hyperref}
\RequirePackage{booktabs}
\RequirePackage{array}

\RequirePackage{multicol}
\RequirePackage{wrapfig}
\RequirePackage{mathtools}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{latexsym}
\RequirePackage{amsfonts}
\RequirePackage{makecell}
\RequirePackage{setspace}
\RequirePackage{listings}

\RequirePackage[noindentafter]{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage[framemethod=TikZ]{mdframed}
\usetikzlibrary{arrows,intersections,patterns,calc}
\RequirePackage{xfrac}
\RequirePackage{diagbox}
\RequirePackage[resetstyle, thmset=empty]{phfthm}
\RequirePackage{pgfplots}
\usepgfplotslibrary{fillbetween}





%Schriftfamilien
\RequirePackage{lmodern}%rm und sf
\RequirePackage{ascii}%tt
%\RequirePackage{newtxmath}%math
\RequirePackage[T1]{fontenc}


%\setlength{\parindent}{3pt}

%Variablen, die durch Optionen bearbeitet werden können
\newcommand{\prtname}{Kapitel}
\newcommand{\satzname}{Satz}
\renewcommand{\theoremautorefname}{Satz}
\newcommand{\corname}{Korollar}
\newcommand{\classpagefooter}{\small Seite \texttt{\thepage}\thinspace von\thinspace\texttt{\pageref{LastPage}}}


%%OPTIONEN

%%COLORS
\DeclareOption{english}{
  \renewcommand{\satzname}{Theorem}
  \renewcommand{\corname}{Corollary}
  \renewcommand{\classpagefooter}{\small Page \texttt{\thepage}\thinspace of\thinspace\texttt{\pageref{LastPage}}}
}


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax


%DEFINITIONEN
\mathcode`\*="8000% Sterne durch Malpunkte ersetzen
{\catcode`\*\active\gdef*{\cdot}}



%Version
\newcommand{\version}{}

%Spacing
\setlength{\columnsep}{3\parindent}
\renewcommand{\baselinestretch}{1.3}

%TITEL
\renewcommand{\maketitle}{
	\twocolumn[\begin{center}

    \vspace*{3em}
    {\setstretch{1}\huge\@title\par}

    {\rule{0.618\textwidth}{0.2pt}}
    \vspace{0.2em}

    {\@author\\\@date\ \version}

    {\rule{0.21\textwidth}{0.2pt}}
  \end{center}
  \vspace*{4em}]
}


\raggedbottom




\newcommand{\envheader}{}

\newtheoremstyle{thmstyle}% ⟨name ⟩ 
{0em}% ⟨Space above ⟩1 
{0.7em}% ⟨Space below ⟩1
{}% ⟨Body font ⟩
{0pt}% ⟨Indent amount ⟩2
{\large\bfseries}% ⟨Theorem head font⟩
{:}% ⟨Punctuation after theorem head ⟩
{.5em}% ⟨Space after theorem head ⟩3
{\envheader\ \thesatz}% ⟨Theorem head spec (can be left empty, meaning ‘normal’)⟩


%\theoremstyle{thmstyle}
\newtheorem{theorem}{\satzname}
\newtheorem{beispiel}{Beispiel}
\newtheorem{lemma}{Lemma}
\newtheorem{korollar}{\corname}
\newtheorem{definition}{Definition}

%SECTIONING UND LAYOUT

%SECTION
\titleformat{\section}
{\Large\bfseries}%Format
{{\LARGE\thesection}}%Label
{1em}%Sep
{}%Before
{}%After
\titlespacing*{\section}{0pt}{\baselineskip}{0.4em}

% %SUBSECTION
\titleformat{\subsection}
{\large\bfseries}%Format
{\Large\thesubsection}%Label
{1em}%Sep
{}%Before
{}%After
\titlespacing*{\subsection}{0pt}{\baselineskip}{0.3em}

% %SUBSUBSECTION
\titleformat{\subsubsection}
{\bfseries}%Format
{\large\thesubsubsection}%Label
{1em}%Sep
{}%Before
{}%After
\titlespacing*{\subsubsection}{0pt}{\baselineskip}{0.3em}

%PARAGRAPH
\titleformat{\paragraph}[runin]
{\bfseries}
{}
{}
{}
{}
\titlespacing*{\paragraph}{0pt}{0pt}{\parindent}







%PAGE HEADER AND FOOTER
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\fancypagestyle{regular}{
  \lhead{}
  \chead{}
  \rhead{}
  \rfoot{}
  \cfoot{\bfseries\sffamily\thepage\,/\,\pageref{LastPage}}
}
\pagestyle{regular}






\makeatletter
\newcommand{\leqnomode}{\tagsleft@true}
\newcommand{\reqnomode}{\tagsleft@false}
\makeatother

\newcommand{\N}{\ensuremath\mathbb{N}}
\newcommand{\Z}{\ensuremath\mathbb{Z}}
\newcommand{\Q}{\ensuremath\mathbb{Q}}
\newcommand{\R}{\ensuremath\mathbb{R}}
\newcommand{\C}{\ensuremath\mathbb{C}}
\newcommand{\LM}{\ensuremath\mathbb{L}}%Lösungsmenge
\renewcommand{\P}{\ensuremath\mathcal{P}}%Potenzmenge
\newcommand{\Pot}{\ensuremath\operatorname{Pot}}%Potenzmenge
\renewcommand{\i}{\ensuremath\mathfrak{i}}%imaginäre Einheit
\renewcommand{\Im}{\ensuremath\mathfrak{Im}}%Imaginärer Anteil
\renewcommand{\Re}{\ensuremath\mathfrak{Re}}%Reeller Anteil
\newcommand{\jacobi}{\ensuremath\mathcal J\!}%Jacobimatrix
\newcommand{\grad}{\ensuremath\operatorname{grad}\!}%Gradient
\newcommand{\hess}{\ensuremath\operatorname{Hess}\!}%Hessematrix

\newcommand{\spann}[1]{\ensuremath\operatorname{Span}\! \left(#1\right)}%Spann einer Vektormenge
\renewcommand{\vector}[1]{\renewcommand{\arraystretch}{1}\ensuremath\begin{pmatrix} #1 \end{pmatrix}}%Vektor
\renewcommand{\matrix}[1]{\renewcommand{\arraystretch}{1}\ensuremath\begin{pmatrix} #1 \end{pmatrix}}%Matrix
\newcommand{\ematrix}[2]{\renewcommand{\arraystretch}{1}\ensuremath\left(\begin{array}{@{}#1@{}}#2\end{array}\right)}
\renewcommand{\det}{\ensuremath\operatorname{det}}%Determinante
\newcommand{\detmatrix}[1]{\renewcommand{\arraystretch}{1}\ensuremath\begin{vmatrix} #1 \end{vmatrix}}%Determinante einer Matrix (Striche statt Klammern)
\newcommand{\rank}[1]{\ensuremath\operatorname{rk}\left(#1\right)}%Rang einer Matrix
\renewcommand{\dim}[1]{\ensuremath\operatorname{dim}\left(#1\right)}%Dimension einer Abbildung /Matrix usw
\newcommand{\im}[1]{\ensuremath\operatorname{im}\,#1}
\renewcommand{\ker}[1]{\ensuremath\operatorname{ker}\,#1}%Kern einer Abbildung
\newcommand{\set}[2]{\ensuremath \left\{ #1 \,\middle|\, #2 \right\}}%Menge
\newcommand{\simpleset}[1]{\ensuremath \left\{ #1 \right\}}%aufzählende Menge
\renewcommand{\emptyset}{\ensuremath\varnothing}%Leere Menge mit schönerem Symbol
\newcommand{\diff}{\operatorname{d}\!}%Differentialquotienten d
\newcommand{\intd}{\ \diff}% Infinitesimale beim Integral
\newcommand{\argmax}{\operatorname{argmax}\,}


\lstset{literate=
  {á}{{\'a}}1 {é}{{\'e}}1 {í}{{\'i}}1 {ó}{{\'o}}1 {ú}{{\'u}}1
  {Á}{{\'A}}1 {É}{{\'E}}1 {Í}{{\'I}}1 {Ó}{{\'O}}1 {Ú}{{\'U}}1
  {à}{{\`a}}1 {è}{{\`e}}1 {ì}{{\`i}}1 {ò}{{\`o}}1 {ù}{{\`u}}1
  {À}{{\`A}}1 {È}{{\'E}}1 {Ì}{{\`I}}1 {Ò}{{\`O}}1 {Ù}{{\`U}}1
  {ä}{{\"a}}1 {ë}{{\"e}}1 {ï}{{\"i}}1 {ö}{{\"o}}1 {ü}{{\"u}}1
  {Ä}{{\"A}}1 {Ë}{{\"E}}1 {Ï}{{\"I}}1 {Ö}{{\"O}}1 {Ü}{{\"U}}1
  {â}{{\^a}}1 {ê}{{\^e}}1 {î}{{\^i}}1 {ô}{{\^o}}1 {û}{{\^u}}1
  {Â}{{\^A}}1 {Ê}{{\^E}}1 {Î}{{\^I}}1 {Ô}{{\^O}}1 {Û}{{\^U}}1
  {Ã}{{\~A}}1 {ã}{{\~a}}1 {Õ}{{\~O}}1 {õ}{{\~o}}1
  {œ}{{\oe}}1 {Œ}{{\OE}}1 {æ}{{\ae}}1 {Æ}{{\AE}}1 {ß}{{\ss}}1
  {ű}{{\H{u}}}1 {Ű}{{\H{U}}}1 {ő}{{\H{o}}}1 {Ő}{{\H{O}}}1
  {ç}{{\c c}}1 {Ç}{{\c C}}1 {ø}{{\o}}1 {å}{{\r a}}1 {Å}{{\r A}}1
  {€}{{\euro}}1 {£}{{\pounds}}1 {«}{{\guillemotleft}}1
  {»}{{\guillemotright}}1 {ñ}{{\~n}}1 {Ñ}{{\~N}}1 {¿}{{?`}}1
}