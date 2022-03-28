%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FSBtex
% 	LaTeX Class
%
%	Initial class provided by:
%		Juraj Benić (jbenic@fsb.hr)
%
%	Modified by:
%		Juraj Benić (jbenic@fsb.hr)
%		Matija Krznar (mkrznar@fsb.hr)
% 
%	Version:
%		v0.1 initial version
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%----------------------------------------------------------------------------------------
%	CLASS IDENTIFICATION 
%----------------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{FSBtex}[3.3.2022. FSBtex class v0.0]



%----------------------------------------------------------------------------------------
%	PRELIMINARY DECLARATIONS
%----------------------------------------------------------------------------------------
\LoadClass[12pt,a4paper]{report}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}

\RequirePackage{geometry}

% packages for graphicx, floats (gifures, tables ...), color, and drawing
\RequirePackage{graphicx, epstopdf}
\RequirePackage[usenames, svgnames, table]{xcolor}
\RequirePackage{float}
\RequirePackage{pdfpages}
\RequirePackage{booktabs}
\RequirePackage{array} % For table array
\RequirePackage{tabularx}
\RequirePackage{multirow}
\RequirePackage{tikz}

% fonts
\RequirePackage{amsmath, amsfonts, amssymb, amsthm} % For math equations, theorems, symbols, etc
%\RequirePackage{setspace}
%\RequirePackage{enumitem}
%\RequirePackage{titlesec}

\RequirePackage{avant} 

%\RequirePackage{tabto} % To use tab for alignment on first page


% pacakages for program flow control 
\RequirePackage{calc}
\RequirePackage{ifthen}
\RequirePackage{etoolbox}
\RequirePackage{totcount} % To enable extracting the value of the counter "page" 
\RequirePackage{changepage} % To adjust the width of the column for the title part and figures/tables (adjustwidth environment)

%\RequirePackage[]{tocloft} % For dots in TOC. If subfigure package is loaded, the subfigure option needs to be added here to avoid clash: \RequirePackage[subfigure]{tocloft}
%\RequirePackage{enotez} % For endnotes

\RequirePackage[toc]{appendix}
\RequirePackage[toc, numberline, acronym]{glossaries} 

% packages settings
\DeclareGraphicsExtensions{.jpg,.pdf,.png,.mps}
\DeclareGraphicsRule{*}{mps}{*}{} 

\geometry{
	a4paper,
  	margin=25mm,
	showframe, % Uncomment to show how the type block is set on the page
}



%----------------------------------------------------------------------------------------
%	CLASS IDENTIFICATION 
%----------------------------------------------------------------------------------------
\DeclareOption{seminar}{\gdef\@type{seminar}}
\DeclareOption{zavrsni}{\gdef\@type{zavrsni}}
\DeclareOption{projekt}{\gdef\@type{projekt}}
\DeclareOption{diplomski}{\gdef\@type{diplomski}}
\DeclareOption{disertacija}{\gdef\@type{disertacija}}
\DeclareOption{zadatak}{\gdef\@type{zadatak}}
\DeclareOption{skripta}{\gdef\@type{skripta}}

% opcije za jezik
\DeclareOption{hrvatski}{\gdef\@language{croatian}}
\DeclareOption{engleski}{\gdef\@language{english}}

% opcije za dizajn
\DeclareOption{fancy}{\gdef\@style{fancy}}
% dodat opcije za razlicite dizajne

% Defaults
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ExecuteOptions{12pt, seminar, hrvatski}
\ProcessOptions\relax



%----------------------------------------------------------------------------------------
%	ADDITIONAL PACKAGES
%----------------------------------------------------------------------------------------
\RequirePackage[\@language]{babel}
\RequirePackage[intoc, \@language]{nomencl} 



%----------------------------------------------------------------------------------------
%	CLASS COMMANDS
%----------------------------------------------------------------------------------------
\gdef\@fsbHR{Fakultet strojarstva i brodogradnje}% komentar samo da nema praznog mjesta nakon
\gdef\@fsbEN{Faculty of Mechanical Engineering and Naval Architecture}%
\gdef\@unizgHR{Sveučilište u Zagrebu}%
\gdef\@unizgEN{University of Zagreb}%

\def\@Author{}
\newcommand{\Author}[1]{\gdef\@Author{#1}}%

\def\@TitleHR{}
\newcommand{\TitleHR}[1]{\gdef\@TitleHR{#1}}%
\def\@TitleEN{}
\newcommand{\TitleEN}[1]{\gdef\@TitleEN{#1}}%

\def\@MentorHR{}
\newcommand{\MentorHR}[1]{\gdef\@MentorHR{#1}}%
\def\@MentorEN{}
\newcommand{\MentorEN}[1]{\gdef\@MentorEN{#1}}%

\def\@CoMentorHR{}
\newcommand{\CoMentorHR}[1]{\gdef\@CoMentorHR{#1}}%
\def\@CoMentorEN{}
\newcommand{\CoMentorEN}[1]{\gdef\@CoMentorEN{#1}}%

\def\@KeywordsHR{}
\newcommand{\KeywordsHR}[1]{\gdef\@KeywordsHR{#1}}%
\def\@KeywordsEN{}
\newcommand{\KeywordsEN}[1]{\gdef\@KeywordsEN{#1}}%

\def\@CourseHR{} % naziv kolegija
\newcommand{\CourseHR}[1]{\gdef\@CourseHR{#1}}%
\def\@CourseEN{}
\newcommand{\CourseEN}[1]{\gdef\@CourseEN{#1}}%

\def\@AcademicYear{}
\newcommand{\AcademicYear}[1]{\gdef\@AcademicYear{#1}}%

%\newcommand{\Logo}{unizg.png}
%\newcommand{\LogoS}{unizg.eps}
%\newcommand{\LogoSen}{unizg_eng.eps}

%\newcommand{\@zadatak}{}
%\newcommand{\zadatak}[1]{\renewcommand{\@zadatak}{#1}}

%\newcommand{\@zahvala}{}
%\newcommand{\zahvala}[1]{\renewcommand{\@zahvala}{#1}}




%----------------------------------------------------------------------------------------
%	TEXT FOR TYPES OF WORK 
%----------------------------------------------------------------------------------------
\gdef\@TypeTextHR{
	\ifdefstring{\@type}{seminar}{SEMINAR}{%
	\ifdefstring{\@type}{zavrsni}{ZAVRŠNI RAD}{%
	\ifdefstring{\@type}{projekt}{PROJEKT}{%
	\ifdefstring{\@type}{diplomski}{DIPLOMSKI RAD}{}}}}%
}%

\gdef\@TypeTextEN{
	\ifdefstring{\@type}{seminar}{SEMINAR}{
	\ifdefstring{\@type}{zavrsni}{BACHELOR'S THESIS}{
	\ifdefstring{\@type}{projekt}{PROJECT}{
	\ifdefstring{\@type}{diplomski}{MASTER'S THESIS}{}}}}
}%



%\newcommand{\LiteraturaPostavke}{
%	\newpage
%	\ifpdf
%		\phantomsection
%	\fi
%	\bibliographystyle{unsrt} %abbrv ieeetr unsrt babamspl babplain
%
%%	\renewcommand\bibname{\ifdefstring{\FSBjezik}{croatian}{Literatura}{Bibliography}}
%	\addcontentsline{toc}{chapter}{{\numberline{}\bibname}}
%}
%
%
%%----------------------------------------------------------------------------------------
%%	NAZVIVI TEOREMA, DEFINICIJA I SL. OVISNO O JEZIKU
%%----------------------------------------------------------------------------------------
%\def\teorem{\ifdefstring{\FSBjezik}{croatian}{Teorem}{Theorem}}
%\def\definicija{\ifdefstring{\FSBjezik}{croatian}{Definicija}{Definition}}
%\def\primjer{\ifdefstring{\FSBjezik}{croatian}{Primjer}{Example}}
%\def\zadatakBox{\ifdefstring{\FSBjezik}{croatian}{Zadatak}{Example}}
%\def\dokaz{\ifdefstring{\FSBjezik}{croatian}{Dokaz}{Proof}}
%
%


%%----------------------------------------------------------------------------------------
%%   LANGUAGE AND FONTS
%%----------------------------------------------------------------------------------------
%\RequirePackage[\FSBjezik]{babel}
%\RequirePackage[utf8]{inputenc}
%
%\RequirePackage{avant} % Use the Avantgarde font for headings
%
%%\usepackage{mathptmx} % Use the Adobe Times Roman as the default text font together with math symbols from the Sym­bol, Chancery and Com­puter Modern fonts
%
%\addto\captionscroatian{%
%  \def\bibname{Literatura}%
%}


%----------------------------------------------------------------------------------------
%	FRONT AND TITLE PAGES
%----------------------------------------------------------------------------------------
\input{Definitions/front_pages.tex}
\input{Definitions/title_pages.tex}






%%----------------------------------------------------------------------------------------
%%	HEADERS AND FOOTERS
%%----------------------------------------------------------------------------------------
%\RequirePackage{fancyhdr} % Required for customizing headers and footers
%
%%header i footer za zavrsni, diplomski i projekt
%\newcommand{\FootHeadDipZavPro}{
%	\fancyhf{}
%	\renewcommand{\headrulewidth}{0.5pt}
%	\renewcommand{\footrulewidth}{0.5pt}
%	
%	% header
%	\fancyhead[R]{
%		\footnotesize \textit{\ifdefstring{\FSBjezik}{croatian}{\TipRada}{\TipRadaEN}}
%	}
%	\fancyhead[L]{\footnotesize \textit{\@author}}
%	
%	% footer
%	\fancyfoot[R]{\footnotesize \textit{\thepage}}
%	\fancyfoot[L]{\footnotesize \textit{\ifdefstring{\FSBjezik}{croatian}{\FSB}{\FSBen}}}
%}
%
%\newcommand{\FootHeadSeminarZadatak}{
%	\pagestyle{fancy}
%	\fancyhf{}
%	\lhead{\includegraphics[scale=.5]{fsb_logo_n.png}}
%	\rhead{Ak. god. \@AKgodina}
%	\renewcommand{\headrulewidth}{0.4pt}
%}
%
%% footer za sve ostalo
%\newcommand{\Foot}{
%	\renewcommand{\footrulewidth}{0pt} % Line at the header invisible
%	\fancyfoot[C]{\rule{2cm}{.3pt}\relax\\\footnotesize\thepage}%
%}
%
%
%% promjena headera i footera za stranicu poglavlja
%\fancypagestyle{plain}{	
%	\ifdefstring{\FSBtype}{zavrsni}{\FootHeadDipZavPro}{
%	\ifdefstring{\FSBtype}{diplomski}{\FootHeadDipZavPro}{
%	\ifdefstring{\FSBtype}{projekt}{\FootHeadDipZavPro}{
%		\fancyhf{} % sve oostale stranice poglavlja
%		\renewcommand{\headrulewidth}{0pt}
%		\Foot	
%	}}}
%}
%
%
%\pagestyle{fancy} % Enable the custom headers and footers
%
%
%\fancyhf{}	% makni stari izgled zaglavlja i podnozja
%\ifdefstring{\FSBtype}{zavrsni}{\FootHeadDipZavPro}{
%\ifdefstring{\FSBtype}{diplomski}{\FootHeadDipZavPro}{
%\ifdefstring{\FSBtype}{projekt}{\FootHeadDipZavPro}{
%	\fancyhead[R]{\footnotesize \leftmark}
%	\Foot
%}}}
%
%
%
%
%% broj stranice na dnu
%%\fancyfoot[C]{\rule{2cm}{.3pt}\relax\\\sffamily\thepage}%
%%\renewcommand{\headrulewidth}{0.5pt}% Line at the header
%
%
%%\renewcommand{\chaptermark}[1]{\markboth{\sffamily\normalsize\bfseries\chaptername\ \thechapter.~#1}{}} % Redefine the styling of the current chapter name in the header
%%\renewcommand{\sectionmark}[1]{\markright{\sffamily\normalsize\thesection~#1}{}} % Redefine the styling of the current section name in the header
%
%
%%\fancyhead[R]{\footnotesize \leftmark}
%%\fancyhead[R]{\fancyplain{}{\footnotesize \hfill{\textsf{\leftmark}}\hspace*{.3cm}
%	%   \textsf{\bfseries\thepage}\\\vspace*{-7pt}\hfill\rule{2cm}{.3pt}}}
%
%%\usepackage{emptypage} % This package removes headers and footers on empty pages between chapters
%
%
%
%%----------------------------------------------------------------------------------------
%%	POPIS OZNAKA I KRATICA
%%----------------------------------------------------------------------------------------
%\makenomenclature
%\makeglossaries
%
%\def\thenomenclature{%
%  \chapter*{\nomname}
%  \if@intoc
%  	%\addcontentsline{toc}{chapter}{\numberline{}\nomname}
%  	\addcontentsline{toc}{chapter}{{\numberline{}\nomname}}
%  \fi%
%  \nompreamble
%  \list{}{%
%    \labelwidth\nom@tempdim
%    \leftmargin\labelwidth
%    \advance\leftmargin\labelsep
%    \itemsep\nomitemsep
%    \let\makelabel\nomlabel}}
%
%
%\renewcommand\nomgroup[1]{%
%  \item[\bfseries
%  \ifstrequal{#1}{C}{\ifdefstring{\FSBjezik}{croatian}{Konstante}{Constants}}{%
%  \ifstrequal{#1}{I}{\ifdefstring{\FSBjezik}{croatian}{Indeksi}{Subscripts}}{%
%  \ifstrequal{#1}{G}{\ifdefstring{\FSBjezik}{croatian}{Grčka slova}{Greek letters}}{%
%  \ifstrequal{#1}{T}{\ifdefstring{\FSBjezik}{croatian}{Akcenti}{Accents}}{}}}}%
%]}
%
%%% dodavanje mjernih jedinica u popis oznaka
%\newcommand{\nomunit}[1]{%
%\renewcommand{\nomentryend}{\hspace*{\fill}#1}}
%
%
%
%%----------------------------------------------------------------------------------------
%%	KORICE ZA SVE TIPOVE RADOVA
%%----------------------------------------------------------------------------------------

%

%
%\newcommand{\KoriceDisertacija}{
%	\newpage
%    \thispagestyle{empty}
%	Prazno za sad
%}
%
%
%
%%----------------------------------------------------------------------------------------
%%	NASLOVNA STRANA (PRVA STRANA RADA)
%%----------------------------------------------------------------------------------------
%\newcommand{\NaslovnaSeminar}{
%	\newgeometry{margin=30mm}
%	\newpage
%    \thispagestyle{empty}
%	\begin{center}
%		\null
%		\ifdefstring{\FSBjezik}{croatian}
%			{\includegraphics[height=3.45cm]{\LogoS}}
%			{\includegraphics[height=3.45cm]{\LogoSen}}
%	\end{center}
%	\begin{center}
%		{\large \ifdefstring{\FSBjezik}{croatian}{\MakeUppercase\FSB}{\MakeUppercase\FSBen}}
%	\end{center}
%	\vfill
%	\begin{center}
%		{\LARGE \textbf{\ifdefstring{\FSBjezik}{croatian}{\TipRada}{\TipRadaEN}}} % tip rada
%		
%		% ako je definiran naslov rada		
%		\ifdefempty{\@title}{}{
%			\vspace*{5mm}
%			\Large \textsc{ \ifdefstring{\FSBjezik}{croatian}{\@title}{\@titleENG}}
%		}
%	\end{center}
%	\vfill		
%	\begin{minipage}[t]{7cm}	% mentori
%		\ifdefempty{\@mentorDva}{
%			\ifdefstring{\FSBjezik}{croatian}{Mentor:}{Supervisor:}
%		}{
%			\ifdefstring{\FSBjezik}{croatian}{Mentori:}{Supervisors:}
%		} \\[6pt]
%  		\@mentor
%  		\ifdefempty{\@mentorDva}{}{
%	  		\newline
%	  		\@mentorDva
%  		}
%	\end{minipage} \hfill 
%	\begin{minipage}[t]{7cm}
%		\begin{flushright} 
%			\hfill Student:\\[6pt]
%			\@author
%		\end{flushright}
%	\end{minipage}
%	\vfill
%	\begin{center}
%	\textsc{Zagreb, \the\year{}\ifdefstring{\FSBjezik}{croatian}{.}{}}
%	\end{center}
%}
%
%%%%%%%%%%%%%%%%%%%
%% naslovna strana zavrsni, diplomski i projekt
%%%%%%%%%%%%%%%%%%%
%\newcommand{\NaslovnaZavrsniDiplomskiProjekt}{
%	\newgeometry{margin=30mm}
%	\newpage
%    \thispagestyle{empty}
%	\begin{center}
%		\null
%		\ifdefstring{\FSBjezik}{croatian}
%			{\large \MakeUppercase{\UNIZG}}
%			{\large \MakeUppercase{\UNIZGen}}
%	\end{center}
%	\begin{center}
%		\large \ifdefstring{\FSBjezik}{croatian}{\MakeUppercase\FSB}{\MakeUppercase\FSBen}
%	\end{center}
%	\vfill
%	\begin{center}
%		{\LARGE \textbf{ \ifdefstring{\FSBjezik}{croatian}{\TipRada}{\TipRadaEN}}} % tip rada
%	\end{center}
%	\vfill
%	\begin{minipage}[t]{7cm}	% mentori
%		\ifdefempty{\@mentorDva}{
%			\ifdefstring{\FSBjezik}{croatian}{Mentor:}{Supervisor:}
%		}{
%			\ifdefstring{\FSBjezik}{croatian}{Mentori:}{Supervisors:}
%		} \\[6pt]
%  		\@mentor
%  		\ifdefempty{\@mentorDva}{}{
%	  		\newline
%	  		\@mentorDva
%  		}
%	\end{minipage} \hfill 
%	\begin{minipage}[t]{7cm}
%		\begin{flushright} 
%			\hfill Student:\\[6pt]
%			\@author
%		\end{flushright}
%	\end{minipage}
%	\vfill
%	\begin{center}
%	\textsc{Zagreb, \the\year{}\ifdefstring{\FSBjezik}{croatian}{.}{}}
%	\end{center}
%}
%
%%%%%%%%%%%%%%%%%%%
%% izgled naslovnih za doktorski rad
%%%%%%%%%%%%%%%%%%%
%\newcommand{\NaslovnaDisertacija}{
%	\newgeometry{margin=30mm}
%	\newpage
%    \thispagestyle{empty}
%	
%	dasfadsf
%}
%
%
%%----------------------------------------------------------------------------------------
%%	ZAHVALA
%%----------------------------------------------------------------------------------------
%\newcommand{\stranicaZahvala}{
%	\newpage
%    \thispagestyle{empty}
%    \vspace*{\fill}
%    \@zahvala
%    \begin{flushright}
%	\@author
%	\end{flushright}
%	\vspace*{\fill}   
%}
%
%%----------------------------------------------------------------------------------------
%%	SADRŽAJ I POPISI SLIKA I TABLICA
%%----------------------------------------------------------------------------------------
%\newcommand{\sadrzaj}{
%	\pagenumbering{roman}
%	\setcounter{page}{1}	
%	%\clearpage
%	\ifpdf
%		\phantomsection
%	\fi
%	\addcontentsline{toc}{chapter}{{\numberline{}\contentsname}}
%	\tableofcontents
%	
%	%-- popis slika
%	\iftotalfigures	% ako ima koja slika u radu
%		\ifpdf
%			\phantomsection
%		\fi
%		\listoffigures
%		\addcontentsline{toc}{chapter}{{\numberline{}\listfigurename}}
%	\fi
%
%	%-- popis tablica
%	\iftotaltables	% ako ima koja tablica u radu
%		\ifpdf
%			\phantomsection
%		\fi
%		\listoftables
%		\addcontentsline{toc}{chapter}{{\numberline{}\listtablename}}
%	\fi
%	
%	
%	%-- popis oznaka
%%	\clearpage
%	\ifpdf
%		\phantomsection
%	\fi
%	\printnomenclature	
%
%	\ifdefstring{\FSBjezik}{croatian}{
%		\printglossary[type=\acronymtype, nonumberlist, title={Popis kratica}, toctitle={Popis kratica}]
%	}{
%		\printglossary[type=\acronymtype, nonumberlist]
%	}
%	
%}
%
%
%%----------------------------------------------------------------------------------------
%%	SVE NASLOVNE STRANE RADA I SADRZAJI
%%----------------------------------------------------------------------------------------
%\newcommand{\NaslovnaStrana}{
%	% ucitavenj naslovnih strana ovisno o tipu rada
%	\ifdefstring{\FSBtype}{seminar}{
%		\NaslovnaSeminar
%		\pagebreak
%		\newgeometry{margin=25mm}
%		\ifdefempty{\@zadatak}{}{ \includepdf[pages={1}]{\@zadatak} }
%	}{}
%	\ifdefstring{\FSBtype}{zavrsni}{
%		\KoriceZavrsniDiplomskiProjekt
%		\NaslovnaZavrsniDiplomskiProjekt
%		\pagebreak
%		\newgeometry{margin=25mm}
%		\stranicaZahvala
%		\includepdf[pages={1}]{\@zadatak}
%	}{}
%	\ifdefstring{\FSBtype}{diplomski}{
%		\KoriceZavrsniDiplomskiProjekt
%		\NaslovnaZavrsniDiplomskiProjekt
%		\pagebreak
%		\newgeometry{margin=25mm}
%		\includepdf[pages={1}]{\@zadatak}
%	}{}
%	\ifdefstring{\FSBtype}{projekt}{	
%		\KoriceZavrsniDiplomskiProjekt
%		\NaslovnaZavrsniDiplomskiProjekt
%		\pagebreak
%		\newgeometry{margin=25mm}
%		\ifdefempty{\@zadatak}{}{ \includepdf[pages={1}]{\@zadatak} }
%	}{}
%	\ifdefstring{\FSBtype}{disertacija}{	
%		\KoriceDisertacija
%		\NaslovnaDisertacija
%	}{}
%	\ifdefstring{\FSBtype}{skripta}{	
%		\KoriceSkripta
%		\pagebreak
%	}{}
%
%	% sadrzaj, popis slika, tablica, oznaka...
%	\sadrzaj
%
%	\pagestyle{fancy} % Enable default headers and footers again
%}
%
%
%%----------------------------------------------------------------------------------------
%%	SAZECI
%%----------------------------------------------------------------------------------------
%\newenvironment{sazetak}{
%	\ifpdf
%		\phantomsection
%	\fi
%	\chapter*{Sažetak}
%	\addcontentsline{toc}{chapter}{\numberline{}Sažetak}
%}{
%\newline
%\textbf{Ključne riječi:} \@kljucnerijeci
%\pagebreak
%}
%
%
%\renewenvironment{abstract}{
%	\ifpdf
%		\phantomsection
%	\fi
%	\chapter*{Abstract}
%	\addcontentsline{toc}{chapter}{\numberline{}Abstract}
%}{
%\newline
%\textbf{Keywords:} \@keywords
%\pagebreak
%}
%
%
%%----------------------------------------------------------------------------------------
%%	ZADATAK ZA SEMINAR
%%----------------------------------------------------------------------------------------
%\newenvironment{SeminarskiZadatak}[1][\unskip]
%{
%	\newpage	
%	\par
%	%\thispagestyle{empty}
%	\addcontentsline{toc}{chapter}{\numberline{}Zadatak #1}
%	\begin{center}
%		\LARGE\bfseries\MakeUppercase{Seminarski zadatak}
%	\end{center}
%	{\large
%	\noindent Kolegij: \hfill \textbf{\@kolegij}\\[5pt]
%	Student: \hfill \textbf{#1}\\[-5mm]}
%	\hrule
%	\vspace{5mm}
%	{\large\noindent\textbf{Zadatak:}\\[-5mm]}
%	
%}{
%%\newline
%\vfill\hrule
%\vspace{3mm}
%{\noindent\large Zadao: \textbf{\@author} \hfill Potpis: \hspace{40mm}}
%\vspace{3mm}\hrule
%\pagebreak
%}
%
%
%%----------------------------------------------------------------------------------------
%%	SECTION STYLING
%%----------------------------------------------------------------------------------------
%\RequirePackage[
%	explicit, % Specify section names explicitly in \titleformat with #1
%	newparttoc, % Required for writing the part toc entry number in a standard way (overriding default LaTeX behavior) so the titletoc package can style it
%]{titlesec} 
%
%
%
%% Command to store the current chapter image to use for all future chapters, can be changed any time in the document and can be empty
%\newcommand{\thechapterimage}{}
%\newcommand{\chapterimage}[1]{\renewcommand{\thechapterimage}{#1}}
%
%% Command to store the current whitespace above the chapter title box for all future chapters, can be changed at any time in the document
%\newcommand{\thechapterspaceabove}{}
%\newcommand{\chapterspaceabove}[1]{\renewcommand{\thechapterspaceabove}{#1}}
%
%% Command to store the current whitespace below the chapter title box for all future chapters, can be changed at any time in the document
%\newcommand{\thechapterspacebelow}{}
%\newcommand{\chapterspacebelow}[1]{\renewcommand{\thechapterspacebelow}{#1}}
%
%
%% Command to output the chapter title with optional background image
%\newcommand{\outputchaptertitle}[2]{
%	\begin{tikzpicture}[remember picture,overlay]
%		% If a chapter image has been specified
%		\expandafter\ifstrequal\expandafter{\thechapterimage}{}{}{
%			% Output the chapter image
%			\node[
%				anchor=north west, % Anchor point on the image
%				inner sep=0pt, % Inner padding
%			] at (current page.north west) {\includegraphics[width=\paperwidth]{\thechapterimage}};
%		}
%		% Box with the chapter title
%		\draw[anchor=west] (current page.north west) node [
%			anchor=north west, % Anchor point of the chapter box
%			xshift=\Gm@lmargin, % Horizontal distance from the left side of the page
%			yshift=-\thechapterspaceabove, % Vertical distance from the top of the page
%			line width=2pt, % Border line thickness
%			rounded corners=10pt, % Rounded corners amount
%			draw=FSBblue, % Border line color
%			fill=black!5, % Box background color
%			fill opacity=0.6, % Background transparency
%			text opacity=1, % Text transparency
%			inner ysep=12.5pt, % Inner vertical padding
%			inner xsep=20pt, % Inner horizontal padding
%			align=flush left, % Text alignment inside box
%			text width=1.2\linewidth, % Box width (wider than page to go off the right side)
%			font=\huge\sffamily\bfseries, % Font styling for chapter title
%		] {\parbox{0.85\linewidth}{\strut\raggedright\expandafter\ifstrequal\expandafter{#1}{}{}{#1. }#2\vspace{-3pt}}}; % Chapter title in a fixed width box for wrapping
%	\end{tikzpicture}
%}
%
%
%\ifdefstring{\FSBdizajn}{fancy}{%	PODESAVANJE NASLOVA ZA SKRIPTU
%	% Numbered chapters
%	\setcounter{secnumdepth}{3}
%	
%	\titleformat
%		{\chapter} % Section type being modified
%		[block] % Shape type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
%		{\outputchaptertitle{\thechapter}{#1}} % Format of the whole section
%		{} % Format of the section label
%		{0cm} % Space between the title and label
%		{} % Code before the label
%		[] % Code after the label
%	
%	% Unnumbered chapters
%	\titleformat
%		{name=\chapter, numberless} % Section type being modified
%		[block] % Shape type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
%		{\outputchaptertitle{}{#1}} % Format of the whole section
%		{} % Format of the section label
%		{0cm} % Space between the title and label
%		{} % Code before the label
%		[] % Code after the label
%		
%	\titlespacing*{\chapter}{0pt}{0pt}{\thechapterspacebelow} % Spacing around section titles, the order is: left, before and after
%	
%	
%	\titleformat
%		{\section} % Section type being modified
%		[block] % Shape type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
%		{\bfseries\sffamily\Large} % Format of the whole section
%		{\llap{\textcolor{FSBblue}{\thesection}\hspace{1em}}#1} % Format of the section label
%		{0cm} % Space between the title and label
%		{} % Code before the label
%		[] % Code after the label
%		
%	\titleformat
%		{name=\section, numberless} % Section type being modified
%		[block] % Shape type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
%		{\bfseries\sffamily\Large} % Format of the whole section
%		{#1} % Format of the section label
%		{0cm} % Space between the title and label
%		{} % Code before the label
%		[] % Code after the label
%	
%	\titlespacing*{\section}{0pt}{12pt}{6pt} % Spacing around section titles, the order is: left, before and after
%	
%	%-------------------------------------------
%	
%	\titleformat
%		{\subsection} % Section type being modified
%		[block] % Shape type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
%		{\bfseries\sffamily\large} % Format of the whole section
%		{\llap{\textcolor{FSBblue}{\thesubsection}\hspace{1em}}#1} % Format of the section label
%		{0cm} % Space between the title and label
%		{} % Code before the label
%		[] % Code after the label
%		
%	\titleformat
%		{name=\subsection, numberless} % Section type being modified
%		[block] % Shape type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
%		{\bfseries\sffamily\large} % Format of the whole section
%		{#1} % Format of the section label
%		{0cm} % Space between the title and label
%		{} % Code before the label
%		[] % Code after the label
%	
%	\titlespacing*{\subsection}{0pt}{12pt}{4pt} % Spacing around section titles, the order is: left, before and after
%	
%	%-------------------------------------------
%	
%	\titleformat
%%		 \subsubsection
%		{\subsubsection} % Section type being modified
%		[block] % Shape type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
%		{\bfseries\sffamily} % Format of the whole section
%		{\llap{\textcolor{FSBblue}{\thesubsection}\hspace{1em}}#1} % Format of the section label
%		{0cm} % Space between the title and label
%		{} % Code before the label
%		[] % Code after the label
%		
%	\titleformat
%		{name=\subsubsection, numberless} % Section type being modified
%		[block] % Shape type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
%		{\bfseries\sffamily} % Format of the whole section
%		{#1} % Format of the section label
%		{0cm} % Space between the title and label
%		{} % Code before the label
%		[] % Code after the label
%	
%	\titlespacing*{\subsubsection}{0pt}{8pt}{4pt} % Spacing around section titles, the order is: left, before and after
%	
%	%-------------------------------------------
%	
%	\titleformat
%		{\paragraph} % Section type being modified
%		[runin] % Shape type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
%		{\bfseries\sffamily} % Format of the whole section
%		{} % Format of the section label
%		{0cm} % Space between the title and label
%		{#1} % Code before the label
%		[] % Code after the label
%	
%	\titlespacing*{\paragraph}{0pt}{0pt}{6pt} % Spacing around section titles, the order is: left, before and after
%
%}{
%\ifdefstring{\FSBtype}{disertacija}{
%	% izgled naslova za disertaciju
%}
%{
%% NASLOVI SEMINARA ZA OSTALE TIPOVE RADA
%	% Numbered chapters
%	\titleformat
%		{\chapter} % Section type being modified
%		[block] % Shape type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
%		%{\Huge\textbf\thechapter{#1}}
%		{\vspace{-30mm}\bfseries\Huge\raggedright} % Format of the whole section
%		{\rlap{\thechapter}} % Format of the section label
%		{0cm} % Space between the title and label
%		{\hspace{.1\linewidth}\begin{minipage}[t]{.8\textwidth} {#1}} % Code before the label
%		[\end{minipage}] % Code after the label
%		
%	% Unnumbered chapters
%	\titleformat
%		{name=\chapter, numberless} % Section type being modified
%		[block] % Shape type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
%		{\vspace{-25mm}\bfseries\Huge\raggedright {#1}} % Format of the whole section
%		{} % Format of the section label
%		{0cm} % Space between the title and label
%		{} % Code before the label
%		[] % Code after the label
%}}
%
%
%
%	
%
%	
%
%%----------------------------------------------------------------------------------------
%%	TEOREMI, DEFINICIJE I SLICNE STVARI
%%----------------------------------------------------------------------------------------
%\definecolor{FSBblue}{RGB}{0,87,154}
%\definecolor{FSBorange}{RGB}{255,138,88}
%\definecolor{FSBforestgreen}{RGB}{21,122,81}
%\definecolor{FSGyellow}{RGB}{255,185,88}
%\definecolor{FSGgrey}{RGB}{200,200,200}
%
%
%\newtheoremstyle{ocrenumbox} % Theorem style name
%	{0pt} % Space above
%	{0pt} % Space below
%	{\normalfont} % Body font
%	{} % Indent amount
%	{} % Theorem head font
%	{} % Punctuation after theorem head
%	{0.25em} % Space after theorem head
%	{\small\sffamily\bfseries\color{FSBblue}\thmname{#1}~\thmnumber{\@ifnotempty{#1}{}\@upn{#2}} % Theorem text (e.g. Theorem 2.1)
%	\thmnote{\the\thm@notefont\sffamily\bfseries\color{black}\itshape~#3.\hspace{0.25em}}} % Optional theorem note
%	
%	
%\newtheoremstyle{FSBorangebox} % Theorem style name
%	{0pt} % Space above
%	{0pt} % Space below
%	{\normalfont} % Body font
%	{} % Indent amount
%	{} % Theorem head font
%	{} % Punctuation after theorem head
%	{0.25em} % Space after theorem head
%	{\small\sffamily\bfseries\color{FSBorange}\thmname{#1}~\thmnumber{\@ifnotempty{#1}{}\@upn{#2}} % Theorem text (e.g. Theorem 2.1)
%	\thmnote{\the\thm@notefont\sffamily\bfseries\color{black}\itshape~#3.\hspace{0.25em}}}	
%		
%
%\newtheoremstyle{blacknumbox} % Theorem style name
%	{0pt} % Space above
%	{0pt} % Space below
%	{\normalfont} % Body font
%	{} % Indent amount
%	{} % Theorem head font
%	{} % Punctuation after theorem head
%	{0.25em} % Space after theorem head
%	{\small\sffamily\bfseries\color{FSBforestgreen}\thmname{#1}~\thmnumber{\@ifnotempty{#1}{}\@upn{#2}} % Theorem text (e.g. Theorem 2.1)
%	\thmnote{\the\thm@notefont\sffamily\bfseries\color{black}\itshape~#3.\hspace{0.25em}}} % Optional theorem note
%
%
%%------------------------------------------------
%
%% Set the theorem style for each type of theorem-like environment by placing it under the theorem style you would like to use for it
%
%% Orange theorem number and optional black title with no padding above and below
%\theoremstyle{ocrenumbox}
%\newtheorem{theoremeT}{\teorem}[chapter] % Theorems, the first argument is the theorem name, the second the theorem title used before the number and the third optional argument is whether to number under chapters (e.g. 2.1) or sections (e.g. 2.1.1)
%\newtheorem{exerciseT}{\zadatakBox}[chapter]
%\newtheorem{exampleT}{\primjer}[chapter]
%
%\theoremstyle{FSBorangebox}
%\newtheorem{proofT}{\dokaz}[chapter]
%
%\theoremstyle{blacknumbox}
%\newtheorem{definitionT}{\definicija}[chapter]
%
%
%
%%----------------------------------------------------------------------------------------
%%	REMARK ENVIRONMENT
%%----------------------------------------------------------------------------------------
%
%\newenvironment{remark}{%
%	\par\small % Reduce font size for remarks
%	\vspace{4pt} % Vertical whitespace
%	\begin{adjustwidth}{35pt}{25pt} % Left and right padding
%		\hspace{-2.5pt}%
%		\begin{tikzpicture}[overlay]
%			\node[draw=FSBblue!60,line width=1pt,circle,fill=FSBblue!25,font=\sffamily\bfseries,inner sep=3pt,outer sep=0pt] at (-15pt,0pt){\textcolor{FSBblue}{!}}; % Orange R in a circle
%		\end{tikzpicture}
%	\advance\baselineskip -1pt% Reduce line spacing
%}{%
%	\end{adjustwidth}
%}
%
%%----------------------------------------------------------------------------------------
%%	COLORED THEOREM BOXES
%%----------------------------------------------------------------------------------------
%
%\RequirePackage[framemethod=TikZ]{mdframed} % Required for creating colored boxes used for theorems, definitions, exercises and corollaries
%
%% Theorem box
%\newmdenv[
%	skipabove=10pt, % Whitespace above box
%	skipbelow=7pt, % Whitespace below box
%	backgroundcolor=black!5, % Background color
%	linecolor=FSBblue, % Border color
%	roundcorner=10pt,
%	linewidth=1pt,
%	leftmargin=10pt, % Outside left margin width
%	rightmargin=10pt % Outside right margin width
%]{tBox}
%
%% Definition box
%\newmdenv[
%	skipabove=10pt, % Whitespace above box
%	skipbelow=7pt, % Whitespace below box
%	backgroundcolor=yellow!10!white, % Background color
%	rightline=false, % Right line visible
%	leftline=true, % Left line visible
%	topline=true, % Top line visible
%	bottomline=false, % Bottom line visible
%	linecolor=FSBforestgreen, % Border color
%	linewidth=1pt, % Border width
%	roundcorner=10pt,
%	leftmargin=5mm, % Outside left margin width
%	rightmargin=5mm % Outside right margin width
%]{dBox}
%
%% Exercise box
%\newmdenv[
%	skipabove=10pt, % Whitespace above box
%	skipbelow=7pt, % Whitespace below box
%	linewidth=0pt, % Line width
%	roundcorner=10pt,
%	backgroundcolor=FSBblue!10, % Background color
%	innerleftmargin=5pt, % Inside left margin width
%	innerrightmargin=5pt, % Inside right margin width
%	innertopmargin=5pt, % Inside top margin height
%	innerbottommargin=5pt, % Inside bottom margin height
%	leftmargin=0cm, % Outside left margin width
%	rightmargin=0cm % Outside right margin width
%]{eBox}
%
%
%
%% Zadatak box
%\newmdenv[
%	skipabove=10pt, % Whitespace above box
%	skipbelow=7pt, % Whitespace below box
%%	rightline=false, % Right line visible
%%	leftline=true, % Left line visible
%%	topline=false, % Top line visible
%%	bottomline=false, % Bottom line visible
%%	linecolor=FSBblue, % Line color
%	linewidth=0pt, % Line width
%	roundcorner=10pt,
%	backgroundcolor=gray!10, % Background color
%	innerleftmargin=5pt, % Inside left margin width
%	innerrightmargin=5pt, % Inside right margin width
%	innertopmargin=5pt, % Inside top margin height
%	innerbottommargin=5pt, % Inside bottom margin height
%	leftmargin=0cm, % Outside left margin width
%	rightmargin=0cm % Outside right margin width
%]{zBox}
%
%
%% proof box
%\newmdenv[
%	skipabove=10pt, % Whitespace above box
%	skipbelow=7pt, % Whitespace below box
%	rightline=false, % Right line visible
%	leftline=true, % Left line visible
%	topline=false, % Top line visible
%	bottomline=false, % Bottom line visible
%	linecolor=FSBorange, % Line color
%	linewidth=4pt, % Line width
%	backgroundcolor=white!10, % Background color
%	innerleftmargin=5pt, % Inside left margin width
%	innerrightmargin=5pt, % Inside right margin width
%	innertopmargin=5pt, % Inside top margin height
%	innerbottommargin=5pt, % Inside bottom margin height
%	leftmargin=10pt, % Outside left margin width
%	rightmargin=10pt % Outside right margin width
%]{pBox}
%
%
%% Definicija novit okolina pomocu prethodno definiranih stilova 
%\newenvironment{theorem}{\begin{tBox}\begin{theoremeT}}{\end{theoremeT}\end{tBox}}
%\newenvironment{definition}{\begin{dBox}\begin{definitionT}}{\end{definitionT}\end{dBox}}
%\newenvironment{exercise}{\begin{zBox}\begin{exerciseT}}{\end{exerciseT}\end{zBox}}
%\newenvironment{example}{\begin{eBox}\begin{exampleT}}{\end{exampleT}\end{eBox}}
%\renewenvironment{proof}{\begin{pBox}\begin{proofT}}{\hfill{\color{FSBorange}\tiny\ensuremath{\blacksquare}}\end{proofT}\end{pBox}}
%
%%----------------------------------------------------------------------------------------
%%	OSTALI KORISNI PAKETI I POSTAVKE
%%----------------------------------------------------------------------------------------
%% postavke
%\linespread{1.3}
%
%% paketi
%\RequirePackage{tikz}
%\RequirePackage{url}
%
%\RequirePackage{siunitx}	% si jedinice
%% postavke si jedinica
%\sisetup{
%  inter-unit-product=\ensuremath{{}\cdot{}},
%  per-mode=symbol
%} 
%
%
%
%\RequirePackage[pdftex,
%	colorlinks=true,
%	linkcolor=blue,
%	filecolor=red,
%	citecolor=blue,
%	pdfsubject={\TipRada},
%	pdfauthor={\@author},
%	pdfstartview=FitV,
%	pdfpagemode=UseOutlines,
%	linktocpage=true,
%	bookmarksnumbered=true]{hyperref}
%
%%\RequirePackage{hyperref}
%
%%\hypersetup{
%%	colorlinks=true, % Whether to color links (a thin box is output around links if this is false)
%%	%hidelinks, % Hide the default boxes around links
%%	urlcolor=ocre, % Color for \url and \href links
%%	linkcolor=black, % Color for \ref/\nameref links
%%	citecolor=ocre, % Color for reference citations like \cite{}
%%	hyperindex=true, % Adds links from the page numbers in the index to the relevant page
%%	linktoc=all, % Link from section names and page numbers in the table of contents
%%}
%
%
%
%\makeatletter
%\makeatother



