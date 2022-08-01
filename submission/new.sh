#!/bin/bash

echo "\documentclass[english]{submission}

\setcounter{sheetnr}{$1}

\title{Security and Privacy}
\date{\today}
\author{Name 1 (n1), Name 2 (n2), Name 3 (n3)}


\begin{document}
\maketitle

\section{}

\section{}
\begin{enumerate}[(a)]
	\item 
\end{enumerate}

\end{document}
" >> $1.tex

