\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lebenslauf}[2018/04/14 Simon Koenig Lebenslauf-Klasse]

\LoadClass[a4paper, oneside]{report}
\RequirePackage[top=2.5cm, left=3.5cm, right=3.5cm, bottom=3cm]{geometry}
\RequirePackage[utf8]{inputenc}
\RequirePackage[ngerman]{babel}
\RequirePackage[T1]{fontenc}

\RequirePackage{titling}
\RequirePackage{xcolor}
\RequirePackage{booktabs}
\RequirePackage{array}
\RequirePackage{multicol}
\RequirePackage{latexsym}
\RequirePackage{amsfonts}
\RequirePackage[noindentafter]{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{multicol}
\RequirePackage{longtable}
\RequirePackage{enumitem}
\RequirePackage[framemethod=TikZ]{mdframed}
\RequirePackage[scaled]{helvet}
\RequirePackage{lastpage}
\RequirePackage{enumitem}
\RequirePackage{hyperref}

%OPTIONS

%coloring
\definecolor{accent}{gray}{0.8}
\DeclareOption{green}{\definecolor{accent}{rgb}{0,0.65,0.37}}
\DeclareOption{red}{\definecolor{accent}{rgb}{0.6,0.22,0.22}}
\DeclareOption{orange}{\definecolor{accent}{rgb}{1, 0.6, 0}}
\DeclareOption{blue}{\definecolor{accent}{rgb}{0.1, 0.4, 0.6}}

\renewcommand{\columnseprulecolor}{\color{accent}}

%language
\title{Lebenslauf}
\pagestyle{fancy}
\lhead{Lebenslauf - \theauthor}
\cfoot{\normalfont\thepage}
\rhead{\today}
\newcommand{\personaldata}{Persönliche Daten}

\DeclareOption{german}{
	\title{Lebenslauf}
	\lhead{Lebenslauf - \theauthor}
	\cfoot{Seite \thepage\ von \pageref{LastPage}}
}
\DeclareOption{english}{
	\title{Resume}
	\lhead{Resume - \theauthor}
	\renewcommand{\personaldata}{Personal Data}
	\cfoot{Page \thepage\ of \pageref{LastPage}}
}



\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax




%PAGESTYLE
\renewcommand\familydefault{\sfdefault} %Font to Helvetica
\renewcommand{\headrulewidth}{0pt}


\setdescription{itemsep=2pt,topsep=3pt,parsep=0pt,partopsep=0pt, labelindent=2em, itemindent=1em, labelwidth=0pt, labelsep=4pt, leftmargin=1em}


%TITLE
\newcolumntype{T}{>{\raggedleft}p{0.5\textwidth}}
\newcolumntype{S}{p{0.5\textwidth}}
\renewcommand{\maketitle}{
	\thispagestyle{empty}
	\begin{longtable}{T!{\VRule}S}
		\bfseries\huge \thetitle & \\
		\bfseries\Huge\@author &\\
	\end{longtable}
	%   \hspace*{0.188\textwidth}\begin{minipage}{0.8\textwidth}
	% 	\begingroup
	% 		{\bfseries\huge \thetitle
	%
	% 		\vspace{0.2em}\raggedleft\Huge\@author}
	% 		\vspace{0.5em}
	% 	\endgroup
	% \end{minipage}
}

%SPACING
\titlespacing*{\subsection}{0pt}{1em}{1em}
\titlespacing*{\paragraph}{0pt}{2em}{1em}

\setlength{\columnsep}{2.5em}




%MISC
\newcommand{\sign}{

\vfill\noindent
\today\\\theauthor}
\renewcommand\ttdefault{pcr}




%TIMELINE
\newcolumntype{L}{>{\raggedleft}p{0.18\textwidth}}
\newcolumntype{R}{p{0.80\textwidth}}
\newcommand\VRule{\color{accent}\vrule width 0.8pt}
\newcommand{\header}[1]{\rule{0pt}{5ex}&{\Large\bfseries #1}\vspace{5pt}\\ }
\newenvironment{timeline}{
	\def\arraystretch{1.4}
	\begin{longtable}{L!{\VRule}R}
}{
	\vspace{0pt}
	\end{longtable}
	\vspace{2em}
}
\newcommand{\tl}[2]{#1&#2\\}


%PERSONAL DATA
\newcolumntype{P}{>{\raggedleft}p{0.5\textwidth}}
\newcolumntype{D}{p{0.5\textwidth}}
\newenvironment{personalData}{
	\vspace*{-3em}
	\begin{longtable}{P!{\VRule}D}
	\ &\ \\
	\ &\ \\
}{
	\end{longtable}
}
\newcommand{\pd}[2]{\tl{#1}{#2}}


%SKILL-Environment
\mdfdefinestyle{skill}{
	linewidth=0.8pt,
	linecolor=accent,
	frametitlerule=false,
	rightline=false,
	bottomline=false,
	topline=false,
	leftmargin=0.8pt,
	skipabove=0.5em,
}
\newenvironment{skill}[1]{
	\noindent{\bfseries\large #1}
	\begin{mdframed}[style=skill]
}{
	\end{mdframed}
	\vspace*{0.7em}
}
\newenvironment{subskill}[1]{
	\noindent
	\textbf{#1}
}{
	\vspace{0.5em}
}


%Multicolumn
\newenvironment{multicolruled}{
	\setlength{\columnseprule}{0.5pt}
	\vspace{-1em}
	\begin{multicols}{2}
}{
	\end{multicols}
}
\newenvironment{multicol}{
	\setlength{\columnseprule}{0pt}
	\vspace{-1em}
	\begin{multicols}{2}
}{
	\end{multicols}
}
