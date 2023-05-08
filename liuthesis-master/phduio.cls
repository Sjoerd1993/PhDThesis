%% Implemented by Martin Helso (martibhe@math.uio.no)


\NeedsTeXFormat{LaTeX2e}


\ProvidesClass{phduio}[2020/02/10 Class for PhD theses at UiO]


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CLASS OPTIONS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Language
\DeclareOption{american} { \def \phduio@thesis{Dissertation} }
\DeclareOption{USenglish}{ \def \phduio@thesis{Dissertation} }
\DeclareOption{english}  { \def \phduio@thesis{Thesis} }
\DeclareOption{UKenglish}{ \def \phduio@thesis{Thesis} }


%% Colophon
\DeclareOption{colophon}  { \def \phduio@colophon{true}  }
\DeclareOption{nocolophon}{ \def \phduio@colophon{false} }


%% Screen mode
\DeclareOption{screen}
{
	\AtBeginDocument
	{
		\@ifpackageloaded{url}
		{\urlstyle{same}}
		{\ClassWarningNoLine{phduio}{Package 'url' missing}}
		\@ifpackageloaded{hyperref}
		{\hypersetup{colorlinks, allcolors = uiolink}}
		{\ClassWarningNoLine{phduio}{Package 'hyperref' missing}}
		\setlrmarginsandblock{24.35mm}{24.35mm}{*}
		\checkandfixthelayout
	}
}


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}


\ExecuteOptions{UKenglish}
\ExecuteOptions{nocolophon}
\ProcessOptions
\relax


\LoadClass[oldfontcommands, extrafontsizes]{memoir}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PACKAGES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% LAYOUT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Paper size
\setstocksize{240mm}{170mm}
\settrimmedsize{240mm}{170mm}{*}
\settrims{0mm}{0mm}
\setlrmarginsandblock{20mm}{28.7mm}{*}
\setulmarginsandblock{25mm}{25mm}{*}
\checkandfixthelayout


%% Custom title page
\newcommand{\uiotitle}
{
	\begin{titlingpage}
		\sffamily
		\renewcommand{\and}{\vskip1mm}
		\newcommand{\AND}{\vskip9mm}
		
		\calccentering{\unitlength}
		\begin{adjustwidth*}{\unitlength}{-\unitlength}
			
			\raggedright
			
			\vspace*{-10mm}
			\hspace*{-7mm}
			\includegraphics[width = 0.6\textwidth]{figures/LiU-primar-svart.png}
			\vskip18mm
			
			\resizebox
			{
				\ifdim \width > \textwidth
				\textwidth
				\else
				\width
				\fi
			}{!}
			{%
				\LARGE
				\theauthor
			}
			
			\vskip1.5\onelineskip
			
			{
				\Huge
				\bfseries
				\boldmath
				\thetitle
				\par
			}
			
			{
				\ifcsempty{\phduio@subtitle}
				{}
				{
					\vskip2mm
					\huge
					\phduio@subtitle
					\par
				}
			}
			
			\vskip-\lastskip
			\vskip16mm
			
			\resizebox{0.6\textwidth}{!}
			{%
				\bfseries
				\phduio@thesis\
				submitted for licentiate degree
			}
			
			\AND
			
			{
				\Large
				\phduio@dept\
				\and
				\phduio@faculty\
				\AND
				\phduio@affiliation\
			}
			
			\vfill
			
			\begin{minipage}[c][26mm]{28mm}
				\hspace*{1.3mm}
				\includegraphics[width = 26mm]{figures/swedness.png}
			\end{minipage}%
			\begin{minipage}[c]{\textwidth - 28mm}
				\hfill
				\LARGE
				\bfseries
				\the\year
			\end{minipage}
			
			\vspace{2mm}
			
		\end{adjustwidth*}
		
		\null
		\clearpage
		
		
	\end{titlingpage}
}


%% Book
\renewcommand*{\printbooktitle}[1]{\raggedright\booktitlefont #1}
\renewcommand*{\afterbookskip}{\par}
\renewcommand*{\booktitlefont}{\HUGE\bfseries\boldmath\sffamily}
\renewcommand*{\booknamefont}{\raggedright\Huge\normalfont\sffamily}
\renewcommand*{\booknumfont}{\Huge\normalfont\sffamily}


%% Part
\renewcommand*{\printparttitle}[1]{\raggedright\parttitlefont #1}
\renewcommand*{\afterpartskip}{\par}
\renewcommand*{\parttitlefont}{\HUGE\bfseries\boldmath\sffamily}
\renewcommand*{\partnamefont}{\raggedright\Huge\normalfont\sffamily}
\renewcommand*{\partnumfont}{\Huge\normalfont\sffamily}


%% Chapter
\newcommand{\authorsfont}{}
\newcommand{\metadatafont}{}
\newlength{\afterauthorsskip}
\newlength{\aftermetadataskip}

\makechapterstyle{phduio}
{
	\renewcommand*{\chapnamefont}{\huge\sffamily\bfseries}
	\renewcommand*{\chapnumfont}{\huge\sffamily\bfseries}
	\renewcommand*{\chaptitlefont}
	{\Huge\bfseries\boldmath\sffamily\raggedright}
	\renewcommand*{\authorsfont}{\Large\bfseries\sffamily}
	\renewcommand*{\metadatafont}{\normalfont\normalsize\sffamily}
	
	\setlength{\beforechapskip}{-1.35\baselineskip}
	\setlength{\midchapskip}{10pt}
	\setlength{\afterchapskip}{20pt}
	\setlength{\afterauthorsskip}{6pt}
	\setlength{\aftermetadataskip}{15pt}
	
	\renewcommand*{\afterchaptertitle}
	{
		\vskip\afterchapskip
		\ifboolexpr
		{
			test{ \ifcsempty{phduio@authors} }
			and
			test{ \ifcsempty{phduio@metadata} }
		}
		{}
		{
			\begin{minipage}[t]{\textwidth}
				\authorsfont
				\phduio@authors
				\vskip\afterauthorsskip
				\metadatafont
				\phduio@metadata
				\gdef \phduio@authors{}
				\gdef \phduio@metadata{}
			\end{minipage}
			\vskip\aftermetadataskip
		}
	}
	
	\renewcommand*{\printchapternonum}
	{
		\vphantom{\chapnumfont Chapter}
		\afterchapternum
		\vskip\topskip
	}
}

\chapterstyle{phduio}


%% Lower level sections
\setsecnumdepth{subsubsection}
\setsecheadstyle{\Large\bfseries\boldmath\sffamily\raggedright}
\setsubsecheadstyle{\large\bfseries\boldmath\sffamily\raggedright}
\setsubsubsecheadstyle{\normalsize\bfseries\boldmath\sffamily\raggedright}
\setparaheadstyle{\normalsize\bfseries\boldmath\sffamily\raggedright}
\setsubparaheadstyle{\normalsize\bfseries\boldmath\sffamily\raggedright}


%% Subappendices
\namedsubappendices


%% Abstract
\renewcommand{\abstractnamefont}{\sffamily\bfseries}
\renewcommand{\abstracttextfont}{\normalfont\small\noindent\ignorespaces}


%% Table of contents, list of figures and list of tables
\setrmarg{3em}
\setpnumwidth{2em}
\addtolength{\cftfigurenumwidth}{1em}
\addtolength{\cfttablenumwidth}{1em}
\addtolength{\cftbooknumwidth}{1em}
\addtolength{\cftpartnumwidth}{1em}
\addtolength{\cftchapternumwidth}{1em}
\addtolength{\cftsectionnumwidth}{1em}
\addtolength{\cftsubsectionnumwidth}{1em}
\addtolength{\cftsubsubsectionnumwidth}{1em}
\addtolength{\cftparagraphnumwidth}{1em}
\addtolength{\cftsubparagraphnumwidth}{1em}
\addtolength{\cftsectionindent}{1em}
\addtolength{\cftsubsectionindent}{2em}
\addtolength{\cftsubsubsectionindent}{3em}
\addtolength{\cftparagraphindent}{4em}
\addtolength{\cftsubparagraphindent}{5em}
\renewcommand{\cftchapteraftersnumb}{\bfseries\boldmath}


%% Running header and footer
\makepagestyle{phduio}
\makeheadrule{phduio}{\textwidth}{\normalrulethickness}
\makeevenhead{phduio}{\sffamily\leftmark}{}{}
\makeoddhead {phduio}{}{}{\sffamily\rightmark}
\makeevenfoot{phduio}{\sffamily\thepage}{}{}
\makeoddfoot {phduio}{}{}{\sffamily\thepage}
\makepsmarks{phduio}
{
	\nouppercaseheads
	\createmark{chapter}{left}{shownumber}{}{. \space}
	\createmark{section}{right}{nonumber}{}{}
	\createplainmark{toc}{both}{\contentsname}
	\createplainmark{lof}{both}{\listfigurename}
	\createplainmark{lot}{both}{\listtablename}
	\createplainmark{bib}{both}{\bibname}
	\createplainmark{index}{both}{\indexname}
	\createplainmark{glossary}{both}{\glossaryname}
}
\pagestyle{phduio}

\makepagestyle{chapter}
\makeevenfoot{chapter}{\sffamily\thepage}{}{}
\makeoddfoot {chapter}{}{}{\sffamily\thepage}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% UTILITIES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



\endinput
