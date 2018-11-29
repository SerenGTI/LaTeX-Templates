\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{skript}[2018/07/14 Simon Koenig Skript-Klasse]

\LoadClass[a4paper, oneside]{report}
\RequirePackage[utf8]{inputenc}
\RequirePackage[ngerman]{babel}
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

\RequirePackage[noindentafter]{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage[framemethod=TikZ]{mdframed}
\usetikzlibrary{arrows,intersections,patterns,calc}
\RequirePackage{xfrac}
\RequirePackage{pgfplots}
\usepgfplotslibrary{fillbetween}



\RequirePackage{lmodern}
\RequirePackage{libertine}
\RequirePackage[libertine]{newtxmath}
\RequirePackage{courier}
\RequirePackage[T1]{fontenc}
\renewcommand{\familydefault}{\sfdefault}


\setlength{\parindent}{0pt}


%%OPTIONEN

\definecolor{accent}{rgb}{0.45,0.45,0.45}
%%COLORS
\DeclareOption{green}{\definecolor{accent}{rgb}{0,0.65,0.37}}
\DeclareOption{red}{\definecolor{accent}{rgb}{0.75,0.22,0.22}}
\DeclareOption{orange}{\definecolor{accent}{rgb}{1, 0.6, 0}}
\DeclareOption{blue}{\definecolor{accent}{rgb}{0, 0.2, 0.6}}
\DeclareOption{purple}{\definecolor{accent}{rgb}{0.65,0,0.37}}

\DeclareOption{print}{}%TODO
%FONTS
\DeclareOption{serif}{\renewcommand{\familydefault}{\rmdefault}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax


%DEFINITIONEN
\mathcode`\*="8000% Sterne durch Malpunkte ersetzen
{\catcode`\*\active\gdef*{\cdot}}

%Sonstige Farben
\definecolor{green}{rgb}{0.2,0.8,0.2}

%Version
\newcommand{\version}{0}



%TITEL
\renewcommand{\maketitle}{

  \medskip
	\thispagestyle{empty}
	\begin{center}

	  \vspace*{12em}

	  {\Huge\@title}

	  {\color{accent}\rule{0.7\textwidth}{0.7pt}}

	    \vfill

	  {\tiny\color{darkgray}\rule{0.3\textwidth}{0.5pt}
	  \vspace{0.5em}

	  \normalsize \@author}
	\end{center}
}
\newcommand{\subtitleformat}[1]{\large\vspace{1em}\scshape\color{gray} #1}


%SECTIONING UND LAYOUT
\newlength\sectionnumberspace
\setlength\sectionnumberspace{3.7em}
\newcounter{satz}
\stepcounter{satz}

\makeatletter
\@addtoreset{chapter}{part}
\makeatother

%SATZ
\newenvironment{satz}[1]
{\begin{mdframed}[style=Satzframe, nobreak=true]
{\Large\raggedright\bfseries Satz {\rmfamily\thechapter.\thesatz}\stepcounter{satz}: \large #1}\vspace{1em} \newline
}
{\end{mdframed}\par}

%LEMMA
\newenvironment{lemma}[1]
{\begin{mdframed}[style=Satzframe, nobreak=true]
{\Large\raggedright\bfseries Lemma {\rmfamily\thechapter.\thesatz}\stepcounter{satz}: \large #1}\vspace{1em} \newline
}
{\end{mdframed}\par}

%KOROLLAR
\newenvironment{korollar}[1]
{\begin{mdframed}[style=Satzframe, nobreak=true]
{\Large\raggedright\bfseries Korollar {\rmfamily\thechapter.\thesatz}\stepcounter{satz}: \large #1}\vspace{1em} \newline
}
{\end{mdframed}\par}

%DEFINITIION
\newenvironment{definition}[1]
{\begin{mdframed}[style=Definitionframe, nobreak=true]
{\Large\raggedright\bfseries Definition {\rmfamily\thechapter.\thesatz}\stepcounter{satz}: \large #1}\vspace{1em} \newline
}
{\end{mdframed}\par}


%PART
\titleformat{\part}[hang]
{
\setcounter{satz}{1}
\thispagestyle{empty}
\Huge\centering\scshape\itshape\color{accent}}
{{\rmfamily\fontsize{300}{40}\selectfont{\arabic{part}}}}
{0pt}
{\\ \vfill\Huge\color{darkgray}\normalfont\raggedleft Kapitel \arabic{part}: }
[{\titlerule[0.8pt]}]
\titlespacing*{\part}{0pt}{16em}{8em}

%CHAPTER
\titleformat{\chapter}[hang]
{\setcounter{satz}{1}\Huge\centering\scshape}
{\color{accent}{\rmfamily\bfseries\thechapter}\huge: }
{0pt}
{\huge}
\titlespacing*{\chapter}{0pt}{0pt}{7em}

%SECTION
\titleformat{\section}[hang]
{\LARGE\raggedright\bfseries}
{\llap{\makebox[\sectionnumberspace][l]{\textcolor{accent}{\rmfamily\thesection}}\hfill}}
{0pt}
{\Large}
\titlespacing*{\section}{0pt}{3em}{1.2em}

%SUBSECTION, DEFINITION
\titleformat{\subsection}[hang]
{\Large\raggedright\bfseries}
{\llap{\makebox[\sectionnumberspace][l]{\textcolor{accent}{\rmfamily\thesubsection}}\hfill}}
{0em}
{\large}
\titlespacing*{\subsection}{0pt}{1.6em}{1em}

%SUBSUBSECTION
\titleformat{\subsubsection}[hang]
{}
{}
{3pt}
{\large\bfseries}
\titlespacing*{\subsubsection}{0pt}{1em}{0.7em}

\newcommand{\beweis}{\paragraph{Beweis:}}
\newcommand{\bemerkung}{\paragraph{Bemerkung:}}
\newcommand{\merkregel}{\paragraph{Merkregel:}}

%BEISPIEL, MERKSATZ, PARAGRAPH
\titleformat{\paragraph}[runin]
{}
{}
{3pt}
{\scshape\bfseries}
\titlespacing*{\paragraph}{0pt}{0.5em}{1em}





%%%PAGE HEADER AND FOOTER%%%
\newcommand{\classpagefooter}{\small Seite \texttt{\thepage}\thinspace von\thinspace\texttt{\pageref{LastPage}}}
\pagestyle{fancy}
\cfoot{\classpagefooter}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0pt}
\rhead{}
\rfoot{\small Simon \textsc{König} \version}

\fancypagestyle{plain}{%
  \fancyhf{}%
  \fancyfoot[C]{\classpagefooter}%
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}


%SATZ-LAYOUT
\mdfdefinestyle{Satzframe}{
  skipabove=1.3em,
  roundcorner=3pt,
  innertopmargin=1.7em,
  innerbottommargin=\baselineskip,
  innerrightmargin=2em,
  innerleftmargin=2em,
  backgroundcolor=white!95!gray,
  linecolor=accent,
  outerlinewidth=0.8pt,
}

%DEFINITION-LAYOUT
\mdfdefinestyle{Definitionframe}{
  skipabove=1.3em,
  roundcorner=3pt,
  innertopmargin=1.7em,
  innerbottommargin=\baselineskip,
  innerrightmargin=2em,
  innerleftmargin=2em,
  backgroundcolor=white!95!gray,
  hidealllines=true,
}




%%%COMMANDS%%%
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
\newcommand{\diff}{\ \operatorname{d}\!}%Differentialquotienten d
\newcommand{\intd}{\diff}% Infinitesimale beim Integral

\makeatletter
\newcommand{\leqnomode}{\tagsleft@true}
\newcommand{\reqnomode}{\tagsleft@false}
\makeatother
