\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{skript}[2019/04/19 Simon Koenig Skript-Class]

\LoadClass[a4paper, oneside]{report}
\RequirePackage[utf8]{inputenc}
\RequirePackage{babel}
\RequirePackage[top=3cm, bottom=3cm, outer=3cm, inner=3cm, heightrounded]{geometry}
\RequirePackage{xcolor}
\RequirePackage{titling}
\RequirePackage[pdftex]{hyperref}
\RequirePackage{booktabs}
\RequirePackage{array}

\RequirePackage{multicol}
\RequirePackage{wrapfig}
\RequirePackage[fleqn]{mathtools}
\RequirePackage{amssymb}
\RequirePackage{latexsym}
\RequirePackage{amsfonts}
\RequirePackage{makecell}

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


%Font Families
\RequirePackage{lmodern}
\RequirePackage{libertine}
\RequirePackage[libertine]{newtxmath}
\RequirePackage{courier}
\RequirePackage[T1]{fontenc}
\renewcommand{\familydefault}{\sfdefault}


%no indent for new pars
\setlength{\parindent}{0pt}

%width of accent lines under the heading and surrounding the boxes for definitions etc
\newlength{\accentbarwidth}
\setlength{\accentbarwidth}{0.8pt}

%accent color
\definecolor{accent}{rgb}{0.45,0.45,0.45}
%predefined accent colors
\DeclareOption{green}{\definecolor{accent}{rgb}{0,0.65,0.37}}
\DeclareOption{red}{\definecolor{accent}{rgb}{0.75,0.22,0.22}}
\DeclareOption{orange}{\definecolor{accent}{rgb}{1, 0.6, 0}}
\DeclareOption{blue}{\definecolor{accent}{rgb}{0, 0.2, 0.6}}
\DeclareOption{purple}{\definecolor{accent}{rgb}{0.65,0,0.37}}



%misc variables for language support
\newcommand{\prtname}{Kapitel}
\newcommand{\satzname}{Satz}
\newcommand{\corname}{Korollar}
\newcommand{\classpagefooter}{\small Seite \texttt{\thepage}\thinspace von\thinspace\texttt{\pageref{LastPage}}}

%language support
\DeclareOption{english}{
  \renewcommand{\prtname}{Part}
  \renewcommand{\satzname}{Theorem}
  \renewcommand{\corname}{Corollary}
  \renewcommand{\classpagefooter}{\small Page \texttt{\thepage}\thinspace of\thinspace\texttt{\pageref{LastPage}}}
}


\DeclareOption{print}{}%TODO


%change to serif fonts with class option
\DeclareOption{serif}{\renewcommand{\familydefault}{\rmdefault}}

%% END OPTIONS
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax





%misc
\mathcode`\*="8000%replace every * with \cdot
{\catcode`\*\active\gdef*{\cdot}}



%redefine green because the original is ugly.
\definecolor{green}{rgb}{0.2,0.8,0.2}

%can be used
\newcommand{\version}{0}

%title page
\renewcommand{\maketitle}{

  \medskip
	\thispagestyle{empty}
	\begin{center}

	  \vspace*{12em}

	  {\Huge\@title}
	  {\color{accent}\rule{0.7\textwidth}{\accentbarwidth}}

	    \vfill

	  {\tiny\color{darkgray}\rule{0.5\textwidth}{0.5pt}
	  \vspace{0.5em}

	  \normalsize \@author\ \version}
	\end{center}
}
\newcommand{\subtitleformat}[1]{\large\vspace{1.2em}\scshape\color{gray} #1}



%main frame style, only gray background and spacing
\mdfdefinestyle{Frame}{
  skipabove=1.2em,
  roundcorner=3pt,
  innertopmargin=1.5em,
  innerbottommargin=\baselineskip,
  innerrightmargin=1.5em,
  innerleftmargin=1.5em,
  backgroundcolor=white!95!gray,
}
%frame style with border
\mdfdefinestyle{BorderedFrame}{
  style=Frame,
  linecolor=accent,
  outerlinewidth=\accentbarwidth,
}
%
\mdfdefinestyle{RegularFrame}{
  style=Frame,
  hidealllines=true,
}


%useable boxes
%bordered with a number
\newenvironment{bnBox}[2]
{
  \begin{mdframed}[style=BorderedFrame, nobreak=true]{
    \large\raggedright\bfseries #1\ {\rmfamily\thesatz}\stepcounter{satz}: \large #2}
    %\vspace{0.7em}%
    %\newline%
}{
  \end{mdframed}\par
}
%only number
\newenvironment{nBox}[2]
{
  \begin{mdframed}[style=RegularFrame, nobreak=true]{
    \large\raggedright\bfseries #1\ {\rmfamily\thesatz}\stepcounter{satz}: \large #2}
    \vspace{0.7em} \newline
}{
  \end{mdframed}\par
}
%only a border
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
%no special things, only background
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


\newcounter{satz}

\newcommand{\envheader}{}

\newtheoremstyle{thmstyle}
{0em}%Space above
{0.7em}%Space below
{}%Body font
{0pt}%Indent amount
{\large\bfseries}%Theorem head font
{:}%Punctuation after theorem head
{.5em}%Space after theorem head
{\envheader\ \thesatz}%Theorem head spec (can be left empty, meaning ‘normal’)


\phfMakeTheorem[defstar=true,defnostar=true,thmstyle=thmstyle,counter=satz,proofref=false]{theoremBody}{\satzname}
\phfMakeTheorem[defstar=true,defnostar=true,thmstyle=thmstyle,counter=satz,proofref=false]{propositionBody}{Proposition}
\phfMakeTheorem[defstar=true,defnostar=true,thmstyle=thmstyle,counter=satz,proofref=false]{definitionBody}{Definition}
\phfMakeTheorem[defstar=true,defnostar=true,thmstyle=thmstyle,counter=satz,proofref=false]{corBody}{\corname}
\phfMakeTheorem[defstar=true,defnostar=true,thmstyle=thmstyle,counter=satz,proofref=false]{lemmaBody}{Lemma}



\newenvironment{theorem}[1]{
  \begin{mdframed}[style=BorderedFrame, nobreak=true]{}
  \renewcommand{\envheader}{\satzname}
  \begin{theoremBody}{{\large\bfseries #1}

  \vspace*{0.7em}}
}{
  \end{theoremBody}
  \end{mdframed}
}
\newenvironment{satz}[1]{\begin{theorem}{#1}}{\end{theorem}}


\newenvironment{proposition}[1]{
  \begin{mdframed}[style=BorderedFrame, nobreak=true]{}
  \renewcommand{\envheader}{Proposition}
  \begin{propositionBody}{{\large\bfseries #1}

  \vspace*{0.7em}}
}{
  \end{propositionBody}
  \end{mdframed}
}


\newenvironment{lemma}[1]{
  \begin{mdframed}[style=BorderedFrame, nobreak=true]{}
  \renewcommand{\envheader}{Lemma}
  \begin{lemmaBody}{{\large\bfseries #1}

  \vspace*{0.7em}}
}{
  \end{lemmaBody}
  \end{mdframed}
}


\newenvironment{corollary}[1]{
  \begin{mdframed}[style=BorderedFrame, nobreak=true]{}
  \renewcommand{\envheader}{\corname}
  \begin{lemmaBody}{{\large\bfseries #1}

  \vspace*{0.7em}}
}{
  \end{lemmaBody}
  \end{mdframed}
}
\newenvironment{korollar}[1]{\begin{corollary}{#1}}{\end{corollary}}

\newenvironment{definition}[1]{
  \begin{mdframed}[style=RegularFrame, nobreak=true]{}
  \renewcommand{\envheader}{Definition}
  \begin{definitionBody}{{\large\bfseries #1}

  \vspace*{0.7em}}
}{
  \end{definitionBody}
  \end{mdframed}
}


%Sections and layout
\newlength\sectionnumberspace
\setlength\sectionnumberspace{3.7em}

\makeatletter
\@addtoreset{chapter}{part}
\makeatother


\titleformat{\part}[hang]
{
\thispagestyle{empty}
\Huge\centering\scshape\itshape\color{accent}}
{{\rmfamily\fontsize{300}{40}\selectfont{\arabic{part}}}}
{0pt}
{\\ \vfill\Huge\color{darkgray}\normalfont\raggedleft \prtname\ \arabic{part}: }
[{\titlerule[\accentbarwidth]}]
\titlespacing*{\part}{0pt}{16em}{8em}


\titleformat{\chapter}[hang]
{
\Huge\centering\scshape}
{\color{accent}{\rmfamily\bfseries\thechapter}\huge: }
{0pt}
{\huge}
\titlespacing*{\chapter}{0pt}{0pt}{7em}


\titleformat{\section}[hang]
{\LARGE\raggedright\bfseries}
{\llap{\makebox[\sectionnumberspace][l]{\textcolor{accent}{\rmfamily\thesection}}\hfill}}
{0pt}
{\Large}
\titlespacing*{\section}{0pt}{3em}{1.2em}


\titleformat{\subsection}[hang]
{\Large\raggedright\bfseries}
{\llap{\makebox[\sectionnumberspace][l]{\textcolor{accent}{\rmfamily\thesubsection}}\hfill}}
{0em}
{\large}
\titlespacing*{\subsection}{0pt}{1.6em}{1em}


\titleformat{\subsubsection}[hang]
{}
{}
{3pt}
{\large\bfseries}
\titlespacing*{\subsubsection}{0pt}{1em}{0.7em}




\titleformat{\paragraph}[runin]
{}
{}
{3pt}
{\scshape\bfseries}
\titlespacing*{\paragraph}{0pt}{0.5em}{1em}


\newcommand{\beweis}{\paragraph{Beweis:}}
\newcommand{\bemerkung}{\paragraph{Bemerkung:}}
\newcommand{\merkregel}{\paragraph{Merkregel:}}





%page header and footer
\pagestyle{fancy}
\cfoot{\classpagefooter}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0pt}
\rhead{}
\rfoot{\small\theauthor\ \version}
%Plain page layout for chapters
\fancypagestyle{plain}{%
  \fancyhf{}%
  \fancyfoot[C]{\classpagefooter}%
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}


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

