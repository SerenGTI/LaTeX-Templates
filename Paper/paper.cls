\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{paper}[2019/01/31 Simon Koenig Skript-Class]

\LoadClass[a4paper, twocolumn, 12pt]{article}
\RequirePackage[utf8]{inputenc}
\RequirePackage{babel}
\RequirePackage[top=2.6cm, bottom=3.3cm, inner=3cm, outer=3cm, heightrounded, twocolumn]{geometry}
\RequirePackage{xcolor}
\RequirePackage{titling}
\RequirePackage[pdftex]{hyperref}
\RequirePackage{booktabs}
\RequirePackage{array}

\RequirePackage{multicol}
\RequirePackage{wrapfig}
\RequirePackage{mathtools}
\RequirePackage{amssymb}
\RequirePackage{latexsym}
\RequirePackage{amsfonts}
\RequirePackage{makecell}
\RequirePackage{setspace}

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
%\RequirePackage{roboto}
\RequirePackage{ascii}%tt
\RequirePackage{newtxmath}%math
\RequirePackage[T1]{fontenc}

% \RequirePackage{lmodern}
% \RequirePackage{libertine}
% \RequirePackage[libertine]{newtxmath}
% \RequirePackage{courier}
% \RequirePackage[T1]{fontenc}
% \renewcommand{\familydefault}{\sfdefault}


%\setlength{\parindent}{3pt}


\newlength{\accentbarwidth}
\setlength{\accentbarwidth}{0.8pt}



%Variablen, die durch Optionen bearbeitet werden können
\definecolor{accent}{rgb}{0.45,0.45,0.45}
\newcommand{\prtname}{Kapitel}
\newcommand{\satzname}{Satz}
\newcommand{\corname}{Korollar}
\newcommand{\classpagefooter}{\small Seite \texttt{\thepage}\thinspace von\thinspace\texttt{\pageref{LastPage}}}


%%OPTIONEN

%%COLORS
\DeclareOption{english}{
  \renewcommand{\satzname}{Theorem}
  \renewcommand{\corname}{Corollary}
  \renewcommand{\classpagefooter}{\small Page \texttt{\thepage}\thinspace of\thinspace\texttt{\pageref{LastPage}}}
}

\DeclareOption{print}{}%TODO
%FONTS
\DeclareOption{serif}{\renewcommand{\familydefault}{\rmdefault}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax


%DEFINITIONEN
\mathcode`\*="8000% Sterne durch Malpunkte ersetzen
{\catcode`\*\active\gdef*{\cdot}}



%Version
\newcommand{\version}{0}




\setlength{\columnsep}{2\parindent}
%TITEL
\renewcommand{\maketitle}{
	\thispagestyle{empty}
	%\begin{center}
  \twocolumn[{\raggedright

    {\setstretch{0.7}\Huge\@title\par}

    {\rule{0.618\textwidth}{0.2pt}}
    \vspace{0.2em}

    {\sffamily\@author\ \version}%}
  %\end{center}
  \vspace{2em}
  }]
  
}


\raggedbottom


%SATZ-LAYOUT
\mdfdefinestyle{Frame}{
  skipabove=1.2em,
  roundcorner=3pt,
  innertopmargin=0.2em,
  innerbottommargin=0.2em,
  innerrightmargin=0.2em,
  innerleftmargin=0.2em,
  backgroundcolor=white!95!gray,
}
\mdfdefinestyle{BorderedFrame}{
  style=Frame,
  linecolor=accent,
  outerlinewidth=\accentbarwidth,
}

%DEFINITION-LAYOUT
\mdfdefinestyle{RegularFrame}{
  style=Frame,
  hidealllines=true,
}


%Allgmeine Box
\newenvironment{bnBox}[2]
{
  \begin{mdframed}[style=BorderedFrame, nobreak=true]{
    \large\raggedright\bfseries #1\ {\rmfamily\thechapter}: \large #2}
    \vspace{0.7em} \newline 
}{
  \end{mdframed}\par
}


\newenvironment{nBox}[2]
{
  \begin{mdframed}[style=RegularFrame, nobreak=true]{
    \large\raggedright\bfseries #1\ {\rmfamily}: \large #2}
    \vspace{0.7em} \newline
}{
  \end{mdframed}\par
}





\newenvironment{bBox}[2]
{
  \ifx&#1&
    \ifx&#2&
      %Beide Parameter leer
      \begin{mdframed}[style=BorderedFrame, nobreak=true]{}
    \else
      %#1 leer
      \begin{mdframed}[style=BorderedFrame, nobreak=true]{
      \large\raggedright\bfseries\large #2}
      \vspace{0.7em} \newline
    \fi
  \else
    %Beide nicht leer
    \begin{mdframed}[style=BorderedFrame, nobreak=true]{
    \large\raggedright\bfseries #1: \large #2}
    \vspace{0.7em} \newline
  \fi
}{
  \end{mdframed}\par
}


\newenvironment{eBox}[2]
{
  \ifx&#1&
    \ifx&#2&
      %Beide Parameter leer
      \begin{mdframed}[style=RegularFrame, nobreak=true]{}
    \else
      %#1 leer
      \begin{mdframed}[style=RegularFrame, nobreak=true]{
      \large\raggedright\bfseries\large #2}
      \vspace{0.7em} \newline
    \fi
  \else
    %Beide nicht leer
    \begin{mdframed}[style=RegularFrame, nobreak=true]{
    \large\raggedright\bfseries #1: \large #2}
    \vspace{0.7em} \newline
  \fi
}{
  \end{mdframed}\par
}



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



\newtheorem{theorem}{\satzname}
\newtheorem{beispiel}{Beispiel}
\newtheorem{lemma}{Lemma}
\newtheorem{korollar}{\corname}
\newtheorem{definition}{Definition}

%SECTIONING UND LAYOUT

%SECTION
\titleformat{\section}
{\Large\sffamily}%Format
{\thesection}%Label
{1em}%Sep
{}%Before
{}%After
\titlespacing*{\section}{0pt}{\baselineskip}{0.3em}

% %SUBSECTION
\titleformat{\subsection}
{\large\sffamily}%Format
{\thesubsection}%Label
{1em}%Sep
{}%Before
{}%After
\titlespacing*{\subsection}{0pt}{\baselineskip}{0.3em}

% %SUBSUBSECTION
\titleformat{\subsubsection}
{\normalfont\normalsize\sffamily}%Format
{\thesubsubsection}%Label
{1em}%Sep
{}%Before
{}%After
\titlespacing*{\subsubsection}{0pt}{\baselineskip}{0.3em}

%PARAGRAPH
\titleformat{\paragraph}[runin]
{\itshape\sffamily}
{}
{}
{}
{}
\titlespacing*{\paragraph}{\parindent}{0pt}{\parindent}







%PAGE HEADER AND FOOTER
\pagestyle{fancy}
% \cfoot{\classpagefooter}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
% \lhead{}
% \chead{}
% \rhead{}
% \rfoot{\small\theauthor\ \version}



% \fancyhead{}
% \fancyhead[L]{\ifthenelse{\isodd{\value{page}}}{\leftmark}{\rightmark}}
% \fancyhead[R]{\thepage}
% \renewcommand{\headrulewidth}{0pt}
% \fancyfoot{}


\fancyhead[LE]{\bfseries\sffamily\thepage}
\fancyhead[RE]{}%{\rightmark}%Für Sectionname
\fancyhead[LO]{}
\fancyhead[RO]{\bfseries\sffamily\thepage}
\cfoot{}
\pagestyle{fancy}




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

