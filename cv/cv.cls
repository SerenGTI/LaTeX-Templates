\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2022/07/21 Class for CVs]

\LoadClass[a4paper, oneside]{article}

\newif\if@english
% english is default
\@englishtrue


% Language-specific stuff
\DeclareOption{german}{
	\@englishfalse
	\PassOptionsToClass{\CurrentOption}{article}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% optional german
\if@english
	\PassOptionsToClass{english}{babel}
	\makeatletter
	\def\cv@monthsingular{month}
	\def\cv@monthplural{months}
	\def\cv@yearsingular{year}
	\def\cv@yearplural{years}
	\def\cv@andword{and}
	\def\cv@untilword{until}
	\def\cv@sinceword{since}
	\makeatother
\else
	\PassOptionsToClass{ngerman}{babel}
	\PassOptionsToClass{german}{datenumber}
	\makeatletter
	\def\cv@monthsingular{Monat}
	\def\cv@monthplural{Monate}
	\def\cv@yearsingular{Jahr}
	\def\cv@yearplural{Jahre}
	\def\cv@andword{und}
	\def\cv@untilword{bis}
	\def\cv@sinceword{seit}
	\makeatother
\fi


\RequirePackage{babel}
\RequirePackage{datenumber}




% Basic Layout
\RequirePackage[top=2.5cm, left=3.5cm, right=3.5cm, bottom=3cm]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{titling}
\RequirePackage[noindentafter, big]{titlesec}
\RequirePackage{lmodern}

\renewcommand{\headrulewidth}{0pt}
\setlength{\parindent}{0pt}
\renewcommand{\baselinestretch}{1.2}

\pagestyle{fancy}
\cfoot{\normalfont\thepage}
\rhead{\thedate}

\RequirePackage{csquotes}
\RequirePackage{helvet}
\RequirePackage{multicol}
\RequirePackage{paralist}
\RequirePackage{calc}
\RequirePackage{hyperref}
\RequirePackage{enumitem}
\RequirePackage{fontawesome5}



\makeatletter
\def\cv@read@timerange#1{%
  \begingroup
  \edef\@tempa{#1}%
  \expandafter\endgroup
  \expandafter\cv@split@startenddates\@tempa\relax
}
\def\cv@split@startenddates#1-#2\relax{%
	\let\readdate\cv@split@datebegin
	\cv@read@monthyear{#1}
  \ifx\relax#2\relax  % is #2 empty? i.e., no end date given
  	\setdatetoday
  	\def\endMonth{\the\month}
		\def\endYear{\the\year}
		\cv@print@onlystart
  \else
		\let\readdate\cv@read@dateend
  	\cv@read@monthyear{#2}
  	\cv@print@startend
  \fi
}
\def\cv@read@monthyear#1{%
  \begingroup
  \edef\@tempa{#1}%
  \expandafter\endgroup
  \expandafter\readdate\@tempa\relax
}
\def\cv@split@datebegin#1/#2\relax{%
	\def\beginMonth{#1}
	\def\beginYear{#2}
}
\def\cv@read@dateend#1/#2\relax{%
	\def\endMonth{#1}
	\def\endYear{#2}
}
\newcounter{dateone}\newcounter{datetwo}\newcounter{diffyears}\newcounter{diffmonths}
\newcommand{\daydiff}[1]{
	\cv@read@timerange{#1}
}
\newcommand{\cv@print@onlystart}{
	\cv@sinceword{} \setmonthname{\beginMonth}\datemonthname{} \beginYear{} 
}
\newcommand{\cv@print@startend}{
	\setmydatenumber{dateone}{\beginYear}{\beginMonth}{1}%
	\setmydatenumber{datetwo}{\endYear}{\endMonth}{1}%
	\addtocounter{datetwo}{-\thedateone}%
	\ifnum\value{datetwo}=0
		\setmonthname{\beginMonth}\datemonthname{} \beginYear{}
	\else
		\setcounter{diffyears}{\value{datetwo}/365}%
	  \setcounter{diffmonths}{(\value{datetwo}-\value{diffyears}*365)/30}%
	  \ifnum\value{diffyears}=0
	  \else
	    \ifnum\value{diffyears}>1
	        \thediffyears\space \cv@yearplural%
	    \else%
	        \thediffyears\space \cv@yearsingular%
	    \fi%
	  \fi%
	  \ifnum\value{diffmonths}>0 
			\ifnum\value{diffyears}>0
	  		\space \cv@andword{}
	  	\fi
	  \fi
	  \ifnum\value{diffmonths}>1
	  	\thediffmonths\space \cv@monthplural%
	  \else
			\ifnum\value{diffmonths}>0
				\thediffmonths\space \cv@monthsingular%
			\else
			\fi
	  \fi
		, \setmonthname{\beginMonth}\datemonthname{} \beginYear{} \cv@untilword{} \setmonthname{\endMonth}\datemonthname{} \endYear. 
	\fi
}
\makeatother




\newenvironment{cvdesc}{
	\hspace{1mm}
	\vline
	\hspace{0.5cm}
	\begin{minipage}{0.95\textwidth}
}
{
	\end{minipage}
	\vspace{1cm}
}


\newenvironment{cvitem}[3]{
	\cvhead{#1}{#2}{#3}

	\nopagebreak
	\begin{cvdesc}
}{	
	\end{cvdesc}
}

\newcommand{\cvhead}[3]{
	\daydiff{#1}%{#2}{#3}{#4}
	\nopagebreak

	{\large\bfseries #2}
	\nopagebreak

	{#3}
	\vspace{0.5cm}
}





\makeatletter
\def\@maketitle{%
  \newpage
  \null
  {\LARGE \@title: \@author \par}
  {\large\@date}%
  \par
  \vskip 1.5em
}

\newcommand{\fullname}[1]{\def\cv@fullname{#1}}
\newcommand{\address}[1]{\def\cv@address{#1}}
\newcommand{\mail}[1]{\def\cv@mail{#1}}
\newcommand{\phone}[1]{\def\cv@phone{#1}}
\newcommand{\birthday}[1]{\def\cv@birthday{#1}}
\newcommand{\nationality}[1]{\def\cv@nationality{#1}}

\newcommand{\personinfo}{
\begingroup
	\renewcommand{\baselinestretch}{0.7}
	\begin{description}[labelsep=2em, align=left, labelwidth=0.3cm, labelindent=0.2cm, itemsep=1pt]
		\item[\faIcon{user}] \cv@fullname{}
		\item[\faIcon{map-marker-alt}] \cv@address{}
		\item[\faIcon{at}] \texttt{\cv@mail{}}
		\item[\faIcon{phone}] \texttt{\cv@phone{}}
		\item[\faIcon{calendar-day}] \cv@birthday{}
		\item[\faIcon{flag}] \cv@nationality{}
	\end{description}
\endgroup
}
\makeatother


\newcommand{\sign}{
	\nopagebreak%
	\vfill\nopagebreak%
	\noindent%
	\rule{3cm}{0.4pt}
	\nopagebreak

	\noindent%
	\today\\\theauthor
	\vfill%
}


