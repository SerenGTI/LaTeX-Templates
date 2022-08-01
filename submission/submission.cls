\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{submission}[2022/08/01 Simon Koenig submission template]

\LoadClass[a4paper, oneside, 10pt]{article}

\RequirePackage[utf8]{inputenc}
\RequirePackage[a4paper,left=3.2cm,right=3.2cm,top=2cm,bottom=1.5cm,includefoot,includehead,heightrounded]{geometry}

\RequirePackage[hyperref,dvipsnames]{xcolor}
\RequirePackage{amssymb,amstext,amsthm}
\newtheorem{corollary}{Corollary}
%\RequirePackage[lined,algonl]{algorithm2e}
\RequirePackage{hyperref}
\RequirePackage{lastpage}
\RequirePackage{fancyhdr}
\RequirePackage{datetime}
\RequirePackage{mathtools}
\RequirePackage{amsmath}

\RequirePackage{amsthm}
\newtheorem{lemma}{Lemma}

\RequirePackage{titling}
\RequirePackage[noindentafter]{titlesec}
\RequirePackage{xfrac}
\RequirePackage{booktabs}
\RequirePackage{csquotes}
\RequirePackage{listings}
\RequirePackage[shortlabels]{enumitem}
\RequirePackage{multicol}
\RequirePackage{tikz}
\usetikzlibrary{automata,positioning,calc}
\RequirePackage[operators, sets, probability, advantage]{cryptocode}

\RequirePackage{xspace}
\newcommand{\ie}{i.\,e.\xspace}
\newcommand{\eg}{e.\,g.\xspace}

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
\cfoot{\scriptsize Page\thinspace\texttt{\thepage}\thinspace of\thinspace\texttt{\pageref{LastPage}}}


%Titel-Design
\renewcommand{\maketitle}{
\begin{center}
	{\sffamily\Large\bfseries\thetitle\\

  \smallskip \large Assignment \thesheetnr}
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


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax


\setlength{\belowdisplayskip}{0pt} \setlength{\belowdisplayshortskip}{0pt}
\setlength{\abovedisplayskip}{0pt} \setlength{\abovedisplayshortskip}{0pt}

%Ein paar hilfreiche Makros
\newcommand{\N}{\ensuremath\mathbb{N}}
\newcommand{\Z}{\ensuremath\mathbb{Z}}
\newcommand{\Q}{\ensuremath\mathbb{Q}}
\newcommand{\R}{\ensuremath\mathbb{R}}
%\newcommand{\C}{\ensuremath\mathbb{C}}
\renewcommand{\L}{\ensuremath\mathbb{L}}
\renewcommand{\P}{\ensuremath\mathcal{P}}%Potenzmenge
\newcommand{\Pot}{\ensuremath\operatorname{Pot}}%Potenzmenge
% \newcommand{\set}[2]{\ensuremath \left\{ #1 \,\middle|\, #2 \right\}}%Menge
% \newcommand{\simpleset}[1]{\ensuremath \left\{ #1 \right\}}%aufzählende Menge
\renewcommand{\vector}[1]{\renewcommand{\arraystretch}{1}\ensuremath\begin{pmatrix} #1 \end{pmatrix}}%Vektor
\newcommand{\IV}{\ensuremath\stackrel{\mathclap{\text{\tiny{(IV)}}}}{=}}
\renewcommand{\emptyset}{\ensuremath\varnothing}%Leere Menge mit schönerem Symbol
\newcommand{\diff}{\ \operatorname{d}\!}%Differentialquotienten d
\newcommand{\intd}{\diff}% Infinitesimale beim Integral
\newcommand{\ematrix}[2]{\renewcommand{\arraystretch}{1}\ensuremath\left(\begin{array}{@{}#1@{}}#2\end{array}\right)}





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



