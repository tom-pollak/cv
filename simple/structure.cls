\ProvidesClass{structure}[]

\LoadClass[10pt,letterpaper]{article} % Font size and paper type

\usepackage[parfill]{parskip} % Remove paragraph indentation
\usepackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen} % Required for ifthenelse statements
\usepackage{hyperref}
\usepackage{ragged2e}
\usepackage{tabularx} % in the preamble
\usepackage{graphicx}

\pagestyle{empty} % Suppress page numbers

%----------------------------------------------------------------------------------------
%	HEADINGS COMMANDS: Commands for printing name and address
%----------------------------------------------------------------------------------------

\renewcommand\labelitemi{---}

\def\labelitemi{--}
\def \name#1{\def\@name{#1}} % Defines the \name command to set name
\def \@name {} % Sets \@name to empty by default

\def \addressSep {$\diamond$} % Set default address separator to a diamond

% One, two or three address lines can be specified
\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax

% \address command can be used to set the first, second, and third address (last 2 optional)
\def \address #1{
  \@ifundefined{@addresstwo}{
    \def \@addresstwo {#1}
  }{
  \@ifundefined{@addressthree}{
  \def \@addressthree {#1}
  }{
     \def \@addressone {#1}
  }}
}

% \printaddress is used to style an address line (given as input)
\def \printaddress #1{
  #1
}

% \printname is used to print the name as a page header
\def \printname {
    {\namesize\textbf{\@name}}
    \par
    \nameskip
}


%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------

% Defines the rSection environment for the large sections within the CV
\newenvironment{rSection}[1]{ % 1 input argument - section name
  \sectionskip
  \MakeUppercase{\textbf{#1}} % Section title
  \sectionlineskip
  \hrule % Horizontal line
  \begin{list}{}{ % List for each individual item in the section
    \setlength{\leftmargin}{0pt} % Margin within the section
  }
  \item[]
}{
  \end{list}
}

%----------------------------------------------------------------------------------------
%	WORK EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------

\newenvironment{rSubsection}[6]{% 6 input arguments - company name, year(s) employed, job title and location, link, link href
{\noindent\ignorespaces\endlinechar=-1}%
 {\textbf{#1}} \hfill {\small#2} % Bold company name and date on the right
 \ifthenelse{\equal{#3}{}}{}{ % If the third argument is not specified, don't print the job title and location line
  \\[1pt]
  \textsl{\fontsize{9.8}{2cm}\selectfont#3} \hfill \textsl{\small #4} % Italic job title and location
  }
 \ifthenelse{\equal{#5}{}}{}{ % If the third argument is not specified, don't print the job title and location line
  \\
  \ifthenelse{\equal{#6}{}}{
    {\small\link{#5}}
  }{
    {\small\href{#6}{#5}}
  }
  }
  \smallskip
  \begin{list}{$\sbullet[0.6]$}{\leftmargin=1em} % \cdot used for bullets, no indentation
   \itemsep -0.5em \vspace{-0.5em} % Compress items in list together for aesthetics
  }{
  \end{list}
  \vspace{0.2em} % Some space after the list of bullet points
}

% rSubSection requires at least one \item to be used within it
\newenvironment{rSubsectionNoList}[5]{% 5 input arguments - company name, year(s) employed, job title and location, link
{\noindent\ignorespaces\endlinechar=-1}%
 {\textbf{#1}} \hfill {\small#2} % Bold company name and date on the right
 \ifthenelse{\equal{#3}{}}{}{ % If the third argument is not specified, don't print the job title and location line
  \\[1pt]
  \textsl{\fontsize{9.8}{2cm}\selectfont#3} \hfill{\textsl{\small #4}} % Italic job title and location
  }
 \ifthenelse{\equal{#5}{}}{}{ % If the third argument is not specified, don't print the job title and location line
  \\
  {\small\link{#5}}
  }
  }{ \vspace{0.2em} % Some space after the list of bullet points
}

% Project: {name}{date}{link}
% Name is hyperlinked. Use \item for bullets inside.
\newenvironment{rProject}[3]{%
  \noindent\ifthenelse{\equal{#3}{}}%
    {{\textbf{#1}}}%
    {{\textbf{\href{#3}{#1}}}}%
  \hfill {\small#2}%
  \def\item{\\\hspace{1em}$\sbullet[0.6]$~}%
}{%
  \par\vspace{0.3em}%
}

% The below commands define the whitespace after certain things in the document - they can be \smallskip, \medskip or \bigskip
\def\namesize{\LARGE} % Size of the name at the top of the document
\def\addressskip{\smallskip} % The space between the two address (or phone/email) lines
\def\sectionlineskip{\medskip} % The space above the horizontal line for each section
\def\nameskip{\smallskip} % The space after your name at the top
\def\sectionskip{\medskip} % The space after the heading section

\newcommand\sbullet[1][.5]{\mathbin{\vcenter{\hbox{\scalebox{#1}{$\bullet$}}}}}

\newcommand\sdash[1][1]{\mathbin{\vcenter{\hbox{\scalebox{#1}{--}}}}}

\makeatletter
\newcommand*{\link}{\begingroup\@makeother\#\@mylink}
\newcommand*{\@mylink}[1]{\href[pdfnewwindow=true]{#1}{#1}\endgroup}
\makeatother

% \newcommand\printlist {
%   \smallskip
%   \begin{list}{$\sbullet[0.6]$}{\leftmargin=1em} % \cdot used for bullets, no indentation
%    \itemsep -0.5em \vspace{-0.5em} % Compress items in list together for aesthetics
%       #1
%   \end{list}
% }
