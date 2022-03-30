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
\RequirePackage{indentfirst}	% tab na pocetku poglavlja

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
\RequirePackage[
	explicit, % Specify section names explicitly in \titleformat with #1
	newparttoc, % Required for writing the part toc entry number in a standard way (overriding default LaTeX behavior) so the titletoc package can style it
]{titlesec} 

\RequirePackage{avant} 
%\RequirePackage{mathptmx} % Use the Adobe Times Roman as the default text font together with math symbols from the Sym­bol, Chancery and Com­puter Modern fonts

%\RequirePackage{tabto} % To use tab for alignment on first page


% pacakages for program flow control 
\RequirePackage{calc}
\RequirePackage{ifthen}
\RequirePackage{etoolbox}
\RequirePackage[figure,table]{totalcount} % To enable extracting the value of the counter "page" 
\RequirePackage{changepage} % To adjust the width of the column for the title part and figures/tables (adjustwidth environment)

%\RequirePackage[]{tocloft} % For dots in TOC. If subfigure package is loaded, the subfigure option needs to be added here to avoid clash: \RequirePackage[subfigure]{tocloft}
%\RequirePackage{enotez} % For endnotes

\RequirePackage{fancyhdr}
\RequirePackage{url}
\RequirePackage{siunitx}	% si jedinice


\RequirePackage[toc]{appendix}
\RequirePackage[toc, numberline, acronym]{glossaries} 

% packages settings
\DeclareGraphicsExtensions{.jpg,.pdf,.png,.mps}
\DeclareGraphicsRule{*}{mps}{*}{} 

\geometry{
	a4paper,
  	margin=25mm,
%	showframe, % Uncomment to show how the type block is set on the page
}

\sisetup{
	inter-unit-product=\ensuremath{{}\cdot{}},
	per-mode=symbol
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

% opcija za prikaz linkova u pdf-u
\DeclareOption{web}{\gdef\@links{true}}
\DeclareOption{print}{\gdef\@links{false}}

% opcije za dizajn
\DeclareOption{plain}{\gdef\@style{plain}}
\DeclareOption{alter}{\gdef\@style{alter}}
\DeclareOption{fancy}{\gdef\@style{fancy}}

\gdef\@titleStyle{}
\DeclareOption{titleplain}{\gdef\@titleStyle{plain}}
\DeclareOption{titlealter}{\gdef\@titleStyle{alter}}
\DeclareOption{titlefancy}{\gdef\@titleStyle{fancy}}
\DeclareOption{titlefancyfigure}{\gdef\@titleStyle{fancyfigure}}


\ifdefempty{\@titleStyle}{\gdef\@titleStyle{\@style}}{}


% Defaults
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ExecuteOptions{12pt, seminar, hrvatski, web, plain}
\ProcessOptions\relax



%----------------------------------------------------------------------------------------
%	ADDITIONAL PACKAGES
%----------------------------------------------------------------------------------------
\RequirePackage[\@language]{babel}
\RequirePackage[intoc, \@language]{nomencl} 

\RequirePackage[pdftex, unicode=true,
	bookmarksopen={true},
	bookmarksnumbered=true,
	pdffitwindow=true, 
	colorlinks=\@links, 
	linkcolor=blue, 
	filecolor=red,
	citecolor=ocre, 
	urlcolor=blue, 
	linktocpage=true, 
	pdfstartview={FitH},
	pdfpagemode= UseOutlines]{hyperref}



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

\def\@Acknowledgment{}
\newcommand{\Acknowledgment}[1]{\renewcommand{\@Acknowledgment}{#1}}

\def\@CourseHR{} % naziv kolegija
\newcommand{\CourseHR}[1]{\gdef\@CourseHR{#1}}%
\def\@CourseEN{}
\newcommand{\CourseEN}[1]{\gdef\@CourseEN{#1}}%

\def\@AcademicYear{}
\newcommand{\AcademicYear}[1]{\gdef\@AcademicYear{#1}}%

\def\@Assignment{}
\newcommand{\Assignment}[1]{\gdef\@Assignment{#1}}%



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
	\ifdefstring{\@type}{seminar}{SEMINAR}{%
	\ifdefstring{\@type}{zavrsni}{BACHELOR'S THESIS}{%
	\ifdefstring{\@type}{projekt}{PROJECT}{%
	\ifdefstring{\@type}{diplomski}{MASTER'S THESIS}{}}}}%
}%



%----------------------------------------------------------------------------------------
%	CROATINA TERMS
%----------------------------------------------------------------------------------------
\addto\captionscroatian{%
  \def\bibname{Literatura}%
}



%----------------------------------------------------------------------------------------
%	NAMES OF TEOREM, DEFINITION ...
%----------------------------------------------------------------------------------------
\gdef\@Theorem{\ifdefstring{\@language}{croatian}{Teorem}{Theorem}}
\gdef\@Definition{\ifdefstring{\@language}{croatian}{Definicija}{Definition}}
\gdef\@Example{\ifdefstring{\@language}{croatian}{Primjer}{Example}}
\gdef\@Exercise{\ifdefstring{\@language}{croatian}{Zadatak}{Exercise}}
\gdef\@Proof{\ifdefstring{\@language}{croatian}{Dokaz}{Proof}}



%----------------------------------------------------------------------------------------
%	COLOR DEFINITION
%----------------------------------------------------------------------------------------
\definecolor{FSBblue}{RGB}{0,87,154}
\definecolor{FSBorange}{RGB}{255,138,88}
\definecolor{FSBforestgreen}{RGB}{21,122,81}
\definecolor{FSGyellow}{RGB}{255,185,88}
\definecolor{FSGgrey}{RGB}{200,200,200}



%----------------------------------------------------------------------------------------
%	FRONT AND TITLE PAGES
%----------------------------------------------------------------------------------------
\input{Definitions/front_pages.tex}
\input{Definitions/title_pages.tex}



%----------------------------------------------------------------------------------------
%	ENVIROMENTS, THEOREMS, PROOFS, ....
%----------------------------------------------------------------------------------------
\input{Definitions/environments.tex}
\input{Definitions/theorems.tex}



%----------------------------------------------------------------------------------------
%	HEADERS AND FOOTERS
%----------------------------------------------------------------------------------------
\input{Definitions/headers_footers.tex}



%----------------------------------------------------------------------------------------
%	SECTION STYLING
%----------------------------------------------------------------------------------------
\input{Definitions/section_styling.tex}


%----------------------------------------------------------------------------------------
%	POPIS OZNAKA I KRATICA
%----------------------------------------------------------------------------------------
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




%----------------------------------------------------------------------------------------
%	ZAHVALA
%----------------------------------------------------------------------------------------
\newcommand{\AcknowledgmentPage}{
	\newpage
    \thispagestyle{empty}
    \vspace*{\fill}
    \@Acknowledgment
    \begin{flushright}
	\@Author
	\end{flushright}
	\vspace*{\fill}   
}



%----------------------------------------------------------------------------------------
%	CONTENT LIST
%----------------------------------------------------------------------------------------
\newcommand{\Content}{
	%\clearpage
	\ifpdf
		\phantomsection
	\fi
	\addcontentsline{toc}{chapter}{{\numberline{}\contentsname}}
	\tableofcontents
	
	%-- popis slika
	\iftotalfigures	% ako ima koja slika u radu
		\ifpdf
			\phantomsection
		\fi
		\listoffigures
		\addcontentsline{toc}{chapter}{{\numberline{}\listfigurename}}
	\fi

	%-- popis tablica
	\iftotaltables	% ako ima koja tablica u radu
		\ifpdf
			\phantomsection
		\fi
		\listoftables
		\addcontentsline{toc}{chapter}{{\numberline{}\listtablename}}
	\fi
	
	
	%-- popis oznaka
%	\clearpage
	\ifpdf
		\phantomsection
	\fi
	\printnomenclature	

	\ifdefstring{\@language}{croatian}{
		\printglossary[type=\acronymtype, nonumberlist, title={Popis kratica}, toctitle={Popis kratica}]
	}{
		\printglossary[type=\acronymtype, nonumberlist]
	}
	
}


%----------------------------------------------------------------------------------------
%	TITLEPAGE
%----------------------------------------------------------------------------------------
\renewcommand{\titlepage}{
	% ucitavenj naslovnih strana ovisno o tipu rada
	\ifthenelse{\equal{\@type}{seminar}}{
		\TitlePageSeminar
		\pagebreak
		\newgeometry{margin=25mm}
		\ifdefempty{\@Assignment}{}{ \includepdf[pages={1}]{\@Assignment} }
	}{}
	\ifthenelse{\equal{\@type}{zavrsni}
			\OR \equal{\@type}{diplomski}
			\OR \equal{\@type}{projekt}
	}{
		\FrontPageZavrsniDiplomskiProjekt
		\TitlePageZavrsniDiplomskiProjekt
		\pagebreak
		\newgeometry{margin=25mm}
		\AcknowledgmentPage
		\ifdefempty{\@Assignment}{}{ \includepdf[pages={1}]{\@Assignment} }
		\HeaderFototerZavrsniDiplomskiProjekt
	}{}
	\ifthenelse{\equal{\@type}{disertacija}}{
		disertacija	
	}{}
	\ifthenelse{\equal{\@type}{skripta}}{
		\FrontPageSkripta	
		\pagebreak
	}{}
	
	

	\pagenumbering{roman}
	\setcounter{page}{1}	

	% sadrzaj, popis slika, tablica, oznaka...
	\Content

	\pagestyle{fancy} % Enable default headers and footers again
	\@titleStyle
}








%----------------------------------------------------------------------------------------
%	SETTINGS
%----------------------------------------------------------------------------------------
\linespread{1.3}


\newcommand{\LiteratureSettings}{
	\newpage
	\ifpdf
		\phantomsection
	\fi
	\bibliographystyle{unsrt} %abbrv ieeetr unsrt babamspl babplain
	\addcontentsline{toc}{chapter}{{\numberline{}\bibname}}
}


\newcommand{\PageNumberingArabic}{
	\pagebreak
	\pagenumbering{arabic}
	\setcounter{page}{1}	
}


\hypersetup{
	pdftitle={\@TitleHR},
	pdfkeywords={\@KeywordsHR},
	pdfauthor={\@Author}
}




%\makeatletter
%\makeatother



