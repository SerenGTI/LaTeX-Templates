\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{abgabe}[2018/06/30 Simon Koenig Abgabentemplate]

\LoadClass[a4paper, oneside, 10pt]{article}

\RequirePackage[utf8]{inputenc}
\RequirePackage[ngerman]{babel}
\RequirePackage[a4paper,left=3.2cm,right=3.2cm,top=2cm,bottom=1.5cm,includefoot,includehead,heightrounded]{geometry}


\RequirePackage[pdftex,hyperref,dvipsnames]{xcolor}
\RequirePackage{amssymb,amstext,amsthm}
\RequirePackage[lined,algonl]{algorithm2e}
\RequirePackage{hyperref}
\RequirePackage{lastpage}
\RequirePackage{fancyhdr}
\RequirePackage{mathtools}
\RequirePackage{amsmath}
\RequirePackage{titling}
\RequirePackage[noindentafter]{titlesec}
\RequirePackage{xfrac}
\RequirePackage{enumitem}
\RequirePackage{listings}
\RequirePackage{diagbox}
\RequirePackage{multicol}
\RequirePackage{tikz}
\usetikzlibrary{automata,positioning,calc}

%Schriftfamilien
\RequirePackage{lmodern}%rm
\RequirePackage{helvet}%sf
\RequirePackage{ascii}%tt
\RequirePackage{newtxmath}
\RequirePackage[T1]{fontenc}





%Standards einstellen
\mathcode`\*="8000 %Sterne durch Malpunkte ersetzen
{\catcode`\*\active\gdef*{\cdot}}

\setlength{\parindent}{0pt}%Kein Indent mehr



%Header und Footer-Design
\pagestyle{fancy}
\author{}%Fallback Autor leer
\date{\today}%Fallback Datum heute
\lhead{\sffamily\hspace*{10pt}\scriptsize \theauthor}
\rhead{\sffamily\scriptsize \thedate\hspace*{10pt}}
\cfoot{\scriptsize Seite\thinspace\texttt{\thepage}\thinspace von\thinspace\texttt{\pageref{LastPage}}}


%Titel-Design
\renewcommand{\maketitle}{
\begin{center}
	{\sffamily\Large\bfseries\thetitle\\

  \smallskip \large Übungsblatt \thesheetnr}
\end{center}
\vspace*{0.5em}
}

\DeclareOption{noex}{
	\renewcommand{\maketitle}{
		\begin{center}
			{\sffamily\Large\bfseries\thetitle}
		\end{center}
		\vspace*{1em}
	}
}

%Exercise- und Blattcounter
\newcounter{sheetnr}
\newcounter{exnum}


%Aufgaben
\newcommand{\exerciseheader}[1]{\section{#1}} % Befehl für Aufgabentitel

% \titleformat{\section}[hang]
% {\sffamily}
% {}
% {0pt}
% {\large\bfseries}
% \titlespacing*{\section}{0pt}{1em}{0.5em}
\titleformat{\section}[hang]
{\Large\raggedright\bfseries\sffamily}
{\llap{\makebox[1.5em][l]{\rmfamily\thesection}}}
{0pt}
{\large}


\titlespacing*{\section}{0pt}{1em}{0.2em}

\newenvironment{ex}[1]{
	\exerciseheader{#1}
}{
	\par
  \vspace*{1.5em}
  \begin{center}
    \includegraphics[width=0.5\textwidth]{ornament.pdf}
  \end{center}
  \vspace{2em}
}
\newenvironment{noornamentex}[1]{
	\exerciseheader{#1}
}{
	\vspace{1em}
}
\newenvironment{nex}[1]{
  \begin{noornamentex}{#1}
}{
  \end{noornamentex}
}


%Teilaufgaben
\newenvironment{subex}{
	\begin{enumerate}[leftmargin=10pt, itemindent=0em, labelsep=10pt, label=\bfseries\alph*), itemsep=0.5pt]
}{
	\end{enumerate}
}



%Optionen
\DeclareOption{print}{\renewenvironment{ex}{
	\begin{noornamentex}
}{
	\end{noornamentex}
}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax


\setlength{\belowdisplayskip}{0pt} \setlength{\belowdisplayshortskip}{0pt}
\setlength{\abovedisplayskip}{0pt} \setlength{\abovedisplayshortskip}{0pt}

%Ein paar hilfreiche Makros
\newcommand{\N}{\ensuremath\mathbb{N}}
\newcommand{\Z}{\ensuremath\mathbb{Z}}
\newcommand{\Q}{\ensuremath\mathbb{Q}}
\newcommand{\R}{\ensuremath\mathbb{R}}
\newcommand{\C}{\ensuremath\mathbb{C}}
\renewcommand{\L}{\ensuremath\mathbb{L}}
\renewcommand{\P}{\ensuremath\mathcal{P}}%Potenzmenge
\newcommand{\Pot}{\ensuremath\operatorname{Pot}}%Potenzmenge
\newcommand{\set}[2]{\ensuremath \left\{ #1 \,\middle|\, #2 \right\}}%Menge
\newcommand{\simpleset}[1]{\ensuremath \left\{ #1 \right\}}%aufzählende Menge
\renewcommand{\vector}[1]{\renewcommand{\arraystretch}{1}\ensuremath\begin{pmatrix} #1 \end{pmatrix}}%Vektor
\newcommand{\IV}{\ensuremath\stackrel{\mathclap{\text{\tiny{(IV)}}}}{=}}
\renewcommand{\emptyset}{\ensuremath\varnothing}%Leere Menge mit schönerem Symbol
\newcommand{\diff}{\ \operatorname{d}\!}%Differentialquotienten d
\newcommand{\intd}{\diff}% Infinitesimale beim Integral





%%Algorithmen
\lstset{literate=
  {á}{{\'a}}1 {é}{{\'e}}1 {í}{{\'i}}1 {ó}{{\'o}}1 {ú}{{\'u}}1
  {Á}{{\'A}}1 {É}{{\'E}}1 {Í}{{\'I}}1 {Ó}{{\'O}}1 {Ú}{{\'U}}1
  {à}{{\`a}}1 {è}{{\`e}}1 {ì}{{\`i}}1 {ò}{{\`o}}1 {ù}{{\`u}}1
  {À}{{\`A}}1 {È}{{\'E}}1 {Ì}{{\`I}}1 {Ò}{{\`O}}1 {Ù}{{\`U}}1
  {ä}{{\"a}}1 {ë}{{\"e}}1 {ï}{{\"i}}1 {ö}{{\"o}}1 {ü}{{\"u}}1
  {Ä}{{\"A}}1 {Ë}{{\"E}}1 {Ï}{{\"I}}1 {Ö}{{\"O}}1 {Ü}{{\"U}}1
  {â}{{\^a}}1 {ê}{{\^e}}1 {î}{{\^i}}1 {ô}{{\^o}}1 {û}{{\^u}}1
  {Â}{{\^A}}1 {Ê}{{\^E}}1 {Î}{{\^I}}1 {Ô}{{\^O}}1 {Û}{{\^U}}1
  {œ}{{\oe}}1 {Œ}{{\OE}}1 {æ}{{\ae}}1 {Æ}{{\AE}}1 {ß}{{\ss}}1
  {ű}{{\H{u}}}1 {Ű}{{\H{U}}}1 {ő}{{\H{o}}}1 {Ő}{{\H{O}}}1
  {ç}{{\c c}}1 {Ç}{{\c C}}1 {ø}{{\o}}1 {å}{{\r a}}1 {Å}{{\r A}}1
  {€}{{\euro}}1 {£}{{\pounds}}1 {«}{{\guillemotleft}}1
  {»}{{\guillemotright}}1 {ñ}{{\~n}}1 {Ñ}{{\~N}}1 {¿}{{?`}}1
}


\definecolor{mygreen}{rgb}{0,0.6,0}
\definecolor{mymauve}{rgb}{0.58,0,0.82}

\lstset{ 
  backgroundcolor=\color{white},
  basicstyle=\footnotesize\ttfamily,
  breakatwhitespace=true,
  breaklines=true,
  captionpos=b,
  deletekeywords={},
  escapeinside={\%*}{*)},
  extendedchars=true,
  frame=lines,
  xleftmargin=10pt,
  keepspaces=true,
  keywordstyle=\bfseries\color{red!60!black},
  commentstyle=\itshape\color{gray!40!black},
  identifierstyle=\color{black},
  stringstyle=\color{green!40!black},      
  language=Java,
  morekeywords={*,...},
  numbers=left,
  numbersep=5pt,
  resetmargins=true,
  numberstyle=\tiny\color{gray!40!black},
  rulecolor=\color{black},
  showspaces=false,
  showstringspaces=false,
  showtabs=false,
  aboveskip=\medskipamount,
  belowskip=-2\medskipamount,
  stepnumber=1,
  tabsize=2,
  title=\lstname,
  emph=[1]{%Klassen o.ä.
	Pin,
	Point,
  },
  emphstyle=[1]{\color{blue!60!black}},
  emph=[2]{ 
    null,
    NaN,
    undefined,
    this,
    true,
    false,
  },
  emphstyle=[2]{\color{orange!70!gray}},
  emph=[3]{
  push,
  pop,
  Mult,
  Sub,
  STORE,
  LOAD,
  sub,
  mult,
  Add,
  od,
  function,
  end,
  var,
  begin,
  to,
  is,
  then
  },
  emphstyle=[3]{\bfseries\color{red!60!black}},
}