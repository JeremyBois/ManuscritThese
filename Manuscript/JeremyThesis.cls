\ProvidesClass{JeremyThesis}[2017/05/03. A modified version of report for french with a lot of utilities%
                             Works with PDFLaTeX and XeTeX]
\NeedsTeXFormat{LaTeX2e}

% ------------------------------------------------------------------------------
% Author : Jérémy Bois
%
% Notes for windows users of XeTeX
%   https://tex.stackexchange.com/questions/325278/xelatex-runs-slow-on-windows-machine
%
% Recommended fonts
%   Serif font      : GandhiSerif
%   Sans Serif font : PT-Sans
%   Math font       : Asana-Math
% ------------------------------------------------------------------------------

\RequirePackage{graphicx}
\RequirePackage{grffile}

% Define macro to avoid overflow from images
% Scale images if necessary, so that they will not overflow the page
% margins by default, and it is still possible to overwrite the defaults
% using explicit options in \includegraphics[width, height, ...]{}
\DeclareOption{fixOverflow}{
  \def\maxwidth{\ifdim\Gin@nat@width>\linewidth\linewidth\else\Gin@nat@width\fi}
  \def\maxheight{\ifdim\Gin@nat@height>\textheight\textheight\else\Gin@nat@height\fi}
  \setkeys{Gin}{width=\maxwidth,height=\maxheight, keepaspectratio}
}

% Look after a configuration file option.these
% Add other to report argument options
\DeclareOption*{\InputIfFileExists{\CurrentOption.these}{}{%
                \PassOptionsToClass{\CurrentOption}{report}}}

% Class structure: execution of options part
\ProcessOptions*\relax

% Class structure: declaration of options part
\LoadClass{report}

% ------------------------------------------------------------------------------
% If then else clause support
% ------------------------------------------------------------------------------
\RequirePackage{etoolbox}


% ------------------------------------------------------------------------------
% PDFLaTeX and XeTeX support
% ------------------------------------------------------------------------------
\RequirePackage{iftex}
% If using PDFLaTeX
\ifPDFTeX
  \RequirePackage[OT1, T1]{fontenc}  % UTF-8 support for PDFLaTeX
  \RequirePackage[utf8]{inputenc}    % must be load before babel and csquotes
\fi
% Else assume XeLaTeX


% ------------------------------------------------------------------------------
% French language support
% ------------------------------------------------------------------------------
% Must respect this order
\RequirePackage[autostyle=true, threshold=0]{csquotes}              % Ensure correct quote text even nested one
\renewcommand{\mkblockquote}[4]{%
              \color{SolarizedBrBlack}\openautoquote\itshape#1%
              \closeautoquote\color{ClassicBlack}\normalfont#2#3#4} % Add << and italic to block quotes
\RequirePackage[greek, french]{babel}                               % http://daniel.flipo.free.fr/frenchb/
\RequirePackage[french]{translator}                                 % french as global option
\frenchspacing                                                      % Simple space after paragraph
\frenchbsetup{StandardLists=true}                                   % Turn off French list style



% ------------------------------------------------------------------------------
% Solarized color definition
% ------------------------------------------------------------------------------
\RequirePackage[table]{xcolor}                      % Color support
\definecolor{SolarizedViolet}{HTML}{6c71c4}
\definecolor{SolarizedMagenta}{HTML}{d33682}
\definecolor{SolarizedBlue}{HTML}{268bd2}
\definecolor{SolarizedCyan}{HTML}{2aa198}
\definecolor{SolarizedGreen}{HTML}{859900}
\definecolor{SolarizedRed}{HTML}{dc322f}
\definecolor{BeeYellow}{HTML}{ffcb00}
\definecolor{SolarizedOrange}{HTML}{cb4b16}
\definecolor{SolarizedYellow}{HTML}{b58900}

\definecolor{SolarizedWhite}{HTML}{fdf6e3}
\definecolor{SolarizedBrWhite}{HTML}{eee8d5}
\definecolor{SolarizedBrCyan}{HTML}{93a1a1}
\definecolor{SolarizedBrBlue}{HTML}{839496}
\definecolor{SolarizedBrYellow}{HTML}{657b83}
\definecolor{SolarizedBrGreen}{HTML}{586e75}
\definecolor{SolarizedBlack}{HTML}{073642}
\definecolor{SolarizedBrBlack}{HTML}{002b36}
\definecolor{ClassicBlack}{HTML}{000000}

% Force default as black
\AtBeginDocument{\colorlet{defaultcolor}{.}}

% ------------------------------------------------------------------------------
% Page layout
% ------------------------------------------------------------------------------
%    \hypersetup{}                                       % Add meta-data to pdf

% Add appendix
\RequirePackage[page, toc]{appendix}

% Hyper links and meta data
\RequirePackage{bookmark}                                % load hyperref internally
% Force link to point to the top of a figure
\RequirePackage{caption}
% Add quick command to make correct references
\newcommand{\figref}{Fig.~\ref}  % Figures
\newcommand{\defref}{Déf.~\ref}  % Définitions
\newcommand{\tabref}{Tab.~\ref}  % Tableaux
\newcommand{\algref}{Alg.~\ref}  % Algorithmes

% Change footer and layout based on argument sent to report class
\if@twoside
  % Layout
  \RequirePackage[top=1.5cm,
                  bottom=2.25cm,
                  footskip=1.25cm,
                  width=170mm,         % Same size as in oneside
                  headheight=30pt,
                  a4paper]{geometry}  % a4
\else
  % Layout
  \RequirePackage[top=1.5cm,
                  bottom=2.25cm,
                  footskip=1.25cm,
                  width=170mm,         % Same size as in oneside
                  headheight=30pt,
                  a4paper]{geometry}  % a4
\fi

% Change headers and footers (must be load after geometry to work)
\RequirePackage{fancyhdr}
% Quick way to control where to put and not put heading and footnotes
\newcommand{\footOn}{\pagestyle{fancy}}
\newcommand{\footOff}{\pagestyle{empty}}
% Redefine footer style (must be done after first call of \pagestyle{fancy}
\footOn

\fancyhf{}  % Clean all headers and footers
% Remove header and footer lines
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\if@twoside
  \renewcommand{\chaptermark}[1]{\markboth{ \textit{\chaptername \enspace \large \thechapter}%
                                 \enspace \bullet \enspace%
                                 \textit{#1}}{}}
  \renewcommand{\sectionmark}[1]{\markright{\normalsize \textit{#1}}}
  \fancyfoot[LE, RO]{\thepage}
  \fancyfoot[C]{}
  % Add some space from margin
  \fancyfoot[RE]{\nouppercase{\leftmark}\  \hspace{1em} \ }
  \fancyfoot[LO]{\ \hspace{1em} \ \nouppercase{\rightmark}}
\else
  \renewcommand{\sectionmark}[1]{\markboth{\textit{\chaptername \enspace \large \thechapter}%
                                           \enspace \bullet \enspace%
                                           \textit{#1}}{}}
  \fancyfoot[R]{\thepage}
  \fancyfoot[C]{}
  \fancyfoot[L]{\ \hspace{1em} \ \nouppercase{\leftmark}}
\fi


% Redefine plain page style to remove page number as in empty style
% because plain style is internal to chapter and cannot be changed in any other ways
\fancypagestyle{plain}{%
  % Define style for footer
  \fancyhf{}  % Clean all headers and footers
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
  \fancyfoot[L]{}
  \fancyfoot[R]{}
  \fancyfoot[C]{}
}

% Footer and headers style for bibliography
% \thispagestyle{bibliographyplain}                  % Select this style for one page
% \pagestyle{bibliographyplain}                      % Apply this style for remaining pages
\fancypagestyle{bibliographyPlain}{%
  % Add page number on chapter first page
  % \assignpagestyle{\chapter}{plain}
  % Define style for footer
  \fancyhf{}  % Clean all headers and footers
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
  \if@twoside
    \fancyfoot[LE, RO]{\thepage}
    \fancyfoot[RE, LO]{\bibname}
  \else
    \fancyfoot[R]{\thepage}
    \fancyfoot[L]{\bibname}
  \fi
}

% Footer and headers style for appendices
% \thispagestyle{appendicesplain}                  % Select this style
% \pagestyle{appendicesplain}                      % Apply this style
\fancypagestyle{appendicesPlain}{%
  % Add page number on chapter first page
  % \assignpagestyle{\chapter}{plain}
  % Define style for footer
  \fancyhf{}  % Clean all headers and footers
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
  \if@twoside
    \fancyfoot[LE, RO]{\thepage}
    \fancyfoot[RE, LO]{\appendixname \enspace \large\thechapter}
  \else
    \fancyfoot[R]{\thepage}
    \fancyfoot[L]{\appendixname \enspace \large\thechapter}
  \fi
}


% Adding a footer must be explicitly done by user
\footOff

% Prevent headings and footers to appear on empty pages
\RequirePackage{emptypage}

% New blank page
\newcommand{\blankpage}{%
    \null
    \thispagestyle{empty}%
    \addtocounter{page}{-1}%
    \newpage}

% Add links as hyperlinks (numeric version) and in footnotes (printed version)
\newcommand\fnref[2]{\href{#1}{#2}\footnote{\url{#1}}}

% Redefinition of chapter and other sections
\RequirePackage{titlesec}                                % Redefined titles
\RequirePackage{placeins}                                % Float always where defined
% Chapter number as a roman number
\renewcommand{\thechapter}{\Roman{chapter}}
% Change chapter format
\titleformat{\chapter}[display]                                     % Chapter title in a different paragraph
{\normalfont\scshape\huge}                                          % Small caps for chapter title
{\color{SolarizedBrBlack}
 \filleft \normalfont \scshape \bfseries \chaptertitlename          % Add Chapitre
 \enspace \Huge \color{SolarizedBrYellow}
 \fontsize{2cm}{2cm} \thechapter \normalfont                     % Add Chapter number as a larger font
}
{1ex}                                                               % Add space between chapter and chapter title
{\color{SolarizedBrBlack} \titlerule[2pt] \vspace{1.5ex} \filcenter   % Lighter color for lines
 \color{defaultcolor}                                               % Reset default color
}
[\color{SolarizedBrBlack} \vspace{1.5ex} \titlerule \vspace{4ex}      % Lighter color for lines
 \normalfont \normalsize \color{defaultcolor}                       % Reset default color and font
]
% Change starred chapter format
\titleformat{name=\chapter, numberless}[display]                    % Chapter title in a different paragraph
{\normalfont\scshape\Huge}                                          % Small caps for chapter title
{}
{0ex}                                                               % Add space between chapter and chapter title
{\vspace{-8ex}
 \color{SolarizedBrBlack} \titlerule[2pt] \vspace{1ex} \filcenter   % Lighter color for lines
 \color{defaultcolor}                                               % Reset default color
}
[\vspace{1ex} \normalfont \normalsize \color{defaultcolor}          % Reset default color and font
]
% Rewrite other title and add float barrier to section and subsections
\titleformat*{\section}{\FloatBarrier\normalfont\Large\bfseries}
\titleformat*{\subsection}{\FloatBarrier\normalfont\large\bfseries}
\titleformat*{\subsubsection}{\normalfont\normalsize\bfseries}
\titleformat*{\paragraph}{\normalfont\normalsize\bfseries}
\assignpagestyle{\chapter}{empty}                                   % Clean page number on first page

% Redefinition of layout for items and description list
\RequirePackage[shortlabels]{enumitem}                   % List option with enumerate compatibility

% New description environment using item label width as indentation
% Useful for long label.
\newlength{\xdescwd}
\newenvironment{blockdescription}[1]
  {\settowidth{\xdescwd}{\textbf{#1}}%
   \begin{description}[leftmargin=\dimexpr\xdescwd+.5em\relax,
     labelindent=0pt,labelsep=.5em,
     labelwidth=\xdescwd,align=right]}
  {\end{description}}
% Remove some space between items
\setlist[enumerate]{itemsep=0mm}
\setlist[itemize]{itemsep=0mm}
% Change alignment to start according to indentation
\setlist[description]{labelindent=\parindent, leftmargin=2\parindent}

% Change default behavior for float positionning to avoid bottom figure
\renewcommand{\fps@figure}{htp}
\renewcommand{\fps@table}{htp}

% Change line spacing to 1.4
\newcommand{\thesisspacing}{%
  \setstretch{1.167}%  default
  \ifcase \@ptsize \relax % 10pt
    \setstretch {1.167}%
  \or % 11pt
    \setstretch {1.132}%
  \or % 12pt
    \setstretch {1.158}%
  \fi
}
\RequirePackage{setspace}  % Used to correct spacing inside document
\thesisspacing

% Add more space after label numbering
\renewcommand{\l@figure}{\@dottedtocline{1}{0em}{3em}}
\renewcommand{\l@table}{\@dottedtocline{1}{0em}{3em}}

% Default float placement (Only float is not allowed by default)
% https://tex.stackexchange.com/questions/35125/how-to-use-the-placement-options-t-h-with-figures#35130
\renewcommand*{\fps@table}{!htb}
\renewcommand*{\fps@figure}{!htb}

% Used later in class
\RequirePackage{tikz}



% ------------------------------------------------------------------------------
% Math / Unit support
% ------------------------------------------------------------------------------
% \mathbf not working with xelatex better to use /bm with bm package (sometimes required {{\Gamma}})
\RequirePackage[separate-uncertainty=true,%
                per-mode=symbol,
                mode=math]{siunitx}               % Unit package
\sisetup{output-decimal-marker={,},
         math-micro=\text{µ},text-micro=µ}              % ... and in siunitx: dot with comma

\RequirePackage{amsmath, amssymb, amsthm, mathtools,bm} % Allow adding complex equations
\RequirePackage{nicefrac}                               % for \nicefrac macro
\RequirePackage{letltxmacro}                            % Support for optional argument in redefinition

% Writing a dot print a comma in math mode
\mathchardef\period=\mathcode`.                         % Allows to still write a dot if needed

\ifPDFTeX
  \DeclareMathSymbol{.}{\mathord}{letters}{"3B}         % Decimal separator in math mode ...
\fi

% Sign function
\DeclareMathOperator{\sign}{sign}

% Change the ways square root appears
\let\oldr@@t\r@@t
\def\r@@t#1#2{%
\setbox0=\hbox{$\oldr@@t#1{#2\,}$}\dimen0=\ht0
\advance\dimen0-0.1\ht0
\setbox2=\hbox{\vrule height\ht0 depth -\dimen0}%
{\box0\lower0.59pt\box2}}
\LetLtxMacro{\oldsqrt}{\sqrt}
\renewcommand*{\sqrt}[2][\ ]{\oldsqrt[#1]{#2}}

% Add += command
\newcommand{\pluseq}{\mathrel{+}\mathrel{\mkern-1mu}=}  % Math symbols +=

% Add Definition environment
\newsavebox{\boiteencadrement}
\newenvironment{encadrement}[1][gray!50]
  {\par\addvspace{\dimexpr\topsep+2pt}%
   \def\couleurencadrement{#1}%
   \begin{lrbox}{\boiteencadrement}%
   \begin{minipage}{\dimexpr\linewidth-2\fboxsep-2\fboxrule}%
  }
  {\end{minipage}\end{lrbox}%
   \noindent\begin{tikzpicture}[inner sep=\fboxsep+0.5em,line width=\fboxrule]
   \node[rounded corners,draw,color=black,fill=\couleurencadrement] {\usebox{\boiteencadrement}};
   \end{tikzpicture}%
   \par\addvspace{\topsep}%
  }
\newtheoremstyle{Def}
  {.5cm}                                                           % Space before
  {.5cm}                                                           % Space after
  {\itshape}                                                       % Content style
  {\parindent}                                                     % Title Indentation
  {\bfseries}                                                      % Title style
  {}                                                               % Punctuation after title and before title spacing
  {\newline}                                                       % Space after Title
  {\thmname{#1}\thmnumber{ \textup{#2}}\thmnote{~(\textit{#3})}}   % Title construction
\theoremstyle{Def}
\newcounter{Def}
\newtheorem{preDef}[Def]{Définition}
\newenvironment{Def}{\begin{encadrement}[white]\begin{preDef}}{\end{preDef}\end{encadrement}}

% Quick and easy way to typeset floor and ceil
\DeclarePairedDelimiter\ceil{\lceil}{\rceil}
\DeclarePairedDelimiter\floor{\lfloor}{\rfloor}
% Quick and easy way to typeset abs (|) and norm (||)
\DeclarePairedDelimiter\abs{\lvert}{\rvert}
\DeclarePairedDelimiter\norm{\lVert}{\rVert}

% Sometimes auto scaling is not enought and manual tuning can be done using
% ( \big( \Big( \bigg( \Bigg(

% Swap the definition of \abs* and \norm*, so that \abs and \norm resizes the
% size of the brackets, and the starred version does not.
\let\oldabs\abs
\def\abs{\@ifstar{\oldabs}{\oldabs*}}

\let\oldnorm\norm
\def\norm{\@ifstar{\oldnorm}{\oldnorm*}}


% If using XeLaTeX
\ifXeTeX
  % Add support for common accent in math mode
  \ExplSyntaxOn
  \NewDocumentCommand{\DeclareMathUnicode}{mm}
   {
    \cs_new_protected:cpn { mathutf_#1: } { #2 }
    \char_set_active_eq:Nc #1 { mathutf_#1: }
    \char_set_mathcode:nn { `#1 } { "8000 }
   }
  \cs_generate_variant:Nn \char_set_active_eq:NN { Nc }
  \ExplSyntaxOff

  % More used
  \DeclareMathUnicode{é}{\acute{e}}
  \DeclareMathUnicode{É}{\acute{E}}
  \DeclareMathUnicode{è}{\grave{e}}
  \DeclareMathUnicode{È}{\grave{E}}
  \DeclareMathUnicode{ê}{\hat{e}}
  \DeclareMathUnicode{Ê}{\hat{E}}
\fi

% Change vertical space between equations lines
\setlength{\jot}{10pt}



% ------------------------------------------------------------------------------
% Table support
% ------------------------------------------------------------------------------
% Add table support
\RequirePackage{booktabs}                                  % Easy pro tables
\RequirePackage{multirow}                                  % Multiple row

% New column type to wrap column without losing alignment
\newcolumntype{C}[1]{>{\centering\arraybackslash}m{#1}}    % Centered
\newcolumntype{L}[1]{>{\raggedright\arraybackslash}m{#1}}  % Left aligned
\newcolumntype{R}[1]{>{\raggedleft\arraybackslash}m{#1}}   % Right aligned

% New column entry that Gobbles it's entries
\newsavebox{\mybox}
\newcolumntype{G}{@{}>{\begin{lrbox}{\mybox}}l<{\end{lrbox}}@{}}



% ------------------------------------------------------------------------------
% Notes support
% ------------------------------------------------------------------------------
\RequirePackage{soul}
\RequirePackage{xargs}                                     % Use more than one optional parameter in a new commands
\RequirePackage[colorinlistoftodos,
                prependcaption,
                textsize=tiny]{todonotes}                  % Note support


% Redefine \missingfigure command from todonotes packages
\renewcommand{\missingfigure}[2][]{%
    \setkeys{todonotes}{#1}%
    \addcontentsline{tdo}{todo}{%
        \fcolorbox{\@todonotes@currentbordercolor}%
        {\@todonotes@currentbackgroundcolor}%
        {\textcolor{\@todonotes@currentbackgroundcolor}{o}}%
        \ Figure: #2}%
    \par
    \noindent
    \begin{tikzpicture}
        \draw[fill=\@todonotes@currentfigcolor, draw = SolarizedBrGreen, line width=2pt]
             (-2, -2.5) rectangle +(\@todonotes@currentfigwidth, \@todonotes@currentfigheight);
        \draw (2, -1.5) node[right, text width=\@todonotes@currentfigwidth-4.5cm] {#2};
        \draw[SolarizedRed, fill=white, rounded corners = 5pt, line width=5pt]
             (-1.25,0) -- (1.25,0) -- (0,-2) -- cycle;
        \draw (0, -0.5) node[color=SolarizedBlack]{Figure};
    \end{tikzpicture}\hfill
    }% Ending \missingfigure command

% Define \missingequation command using \missingfigure command
\newcommand{\missingequation}[2][]{%
    \setkeys{todonotes}{#1}%
    \addcontentsline{tdo}{todo}{%
        \fcolorbox{\@todonotes@currentbordercolor}%
        {\@todonotes@currentbackgroundcolor}%
        {\textcolor{\@todonotes@currentbackgroundcolor}{o}}%
        \ Equation: #2}%
    \par
    \par
    \noindent
    \begin{tikzpicture}
        \draw[fill=\@todonotes@currentfigcolor, draw = SolarizedBrGreen, line width=2pt]
             (-2, -2.5) rectangle +(\@todonotes@currentfigwidth, \@todonotes@currentfigheight);
        \draw (2, -1.5) node[right, text width=\@todonotes@currentfigwidth-4.5cm] {#2};
        \draw[SolarizedRed, fill=white, line width=5pt]
             (0,-0.3) circle (1.1cm);
        \draw (0, -0.4) node[color=SolarizedBlack]{Equation};
    \end{tikzpicture}\hfill
    }% Ending \missingequation command


% Define \missingtable command using \missingfigure command
\newcommand{\missingtable}[2][]{%
    \setkeys{todonotes}{#1}%
    \addcontentsline{tdo}{todo}{%
        \fcolorbox{\@todonotes@currentbordercolor}%
        {\@todonotes@currentbackgroundcolor}%
        {\textcolor{\@todonotes@currentbackgroundcolor}{o}}%
        \ Table: #2}%
    \par
    \noindent
    \begin{tikzpicture}
        \draw[fill=\@todonotes@currentfigcolor, draw = SolarizedBrGreen, line width=2pt]
             (-2, -2.5) rectangle +(\@todonotes@currentfigwidth, \@todonotes@currentfigheight);
        \draw (2, -1.5) node[right, text width=\@todonotes@currentfigwidth-4.5cm, color=SolarizedBlack] {#2};
        \draw[SolarizedRed, fill=white, rounded corners = 5pt, line width=5pt]
             (-1, -1.5) rectangle (1, 0);
        \draw (0, -0.5) node[color=SolarizedBlack]{Table};
    \end{tikzpicture}\hfill
    }% Ending \missingtable command

% Note if not sure about that
\newcommandx{\munsure}[2][1=]{
    \todo[linecolor=SolarizedRed,
          backgroundcolor=SolarizedRed!40,
          bordercolor=SolarizedRed,
          #1]{?? \hfill #2 \hfill ??}}
\newcommandx{\iunsure}[2][1=]{
    \todo[linecolor=SolarizedRed,
          backgroundcolor=SolarizedRed!40,
          bordercolor=SolarizedRed,
          inline,
          size=\small,
          #1]{?? \hfill #2 \hfill ??}}

% Note with highlighted text
\newcommandx{\mfix}[3][1=]{
    \texthl{#3}%
    \todo[linecolor=SolarizedOrange,
          backgroundcolor=SolarizedOrange!80,
          bordercolor=SolarizedOrange,
          #1]{{!! \hfill #2 \hfill !!}}}
\newcommandx{\ifix}[2][1=]{
    \todo[linecolor=SolarizedOrange,
          backgroundcolor=SolarizedOrange!80,
          bordercolor=SolarizedOrange,
          inline,
          size=\small,
          #1]{{!! \hfill #2 \hfill !!}}}

% Note for part that need change
\newcommandx{\mtodo}[2][1=]{
    \todo[linecolor=SolarizedGreen,
          backgroundcolor=SolarizedGreen!40,
          bordercolor=SolarizedGreen,
          #1]{#2}}
\newcommandx{\itodo}[2][1=]{
    \todo[linecolor=SolarizedGreen,
          backgroundcolor=SolarizedGreen!40,
          bordercolor=SolarizedGreen,
          inline,
          size=\small,
          #1]{#2}}

% Note for missing figure
\newcommandx{\ftodo}[2][1=]{
    \missingfigure[figcolor=SolarizedViolet!25,
                   backgroundcolor=SolarizedViolet!25,
                   bordercolor=SolarizedViolet,
                   color=SolarizedViolet!25,
                   figheight=2cm,
                   size=\normalsize,
                   #1]{#2}}

% Note for missing equation
\newcommandx{\etodo}[2][1=]{
    \missingequation[figcolor=SolarizedCyan!25,
                     backgroundcolor=SolarizedCyan!25,
                     bordercolor=SolarizedCyan,
                     color=SolarizedCyan!25,
                     figheight=2cm,
                     size=\normalsize,
                     #1]{#2}}
\newcommandx{\emtodo}[2][1=]{
    \todo[linecolor=SolarizedCyan,
          backgroundcolor=SolarizedCyan!25,
          bordercolor=SolarizedCyan,
          #1]{Equation: #2}}

% Note for missing table
\newcommandx{\ttodo}[2][1=]{
    \missingtable[figcolor=SolarizedBlue!25,
                  backgroundcolor=SolarizedBlue!25,
                  bordercolor=SolarizedBlue,
                  color=SolarizedBlue!25,
                  figheight=2cm,
                  size=\normalsize,
                  #1]{#2}}



% ------------------------------------------------------------------------------
% Bibliography support
% ------------------------------------------------------------------------------
%   \parencite{bib_id}     Add parenthesis (Name, year)
%   \cite{bib_id}          Normal
%   \textcite{bib_id}      Inside a sentence

\RequirePackage[backend=biber,
                maxnames=2,             % Maximal number of name in citation
                minnames=1,             % Minimal number of name in citation
                style=authoryear-comp,  % Author only once if multiple + year
                sorting=nyt,            % Sort by name then year then title
                hyperref=true,          % Make citations as clickable links
                backref=true,           % Back reference to citation page in bibliography
                backrefstyle=none,      % Do not compress page list
                idemtracker=true,
                bibencoding=utf8,
                uniquename=false,
                uniquelist=false,
                ]{biblatex}             % Bibliography support


% Remove url for all first
\DeclareFieldFormat*{url}{}
\DeclareFieldFormat*{urldate}{}
% Cannot add url for techreport or electronic but I try and will works someday ...
\DeclareFieldFormat[techreport, electronic]{url}{\mkbibacro{URL}\addcolon\space\url{#1}}
\DeclareFieldFormat[article,
                    periodical]{volume}{\mkbibparens{#1}}     % volume of a journal
\DeclareFieldFormat[article,
                    incollection,
                    inproceedings]{pages}{#1}                 % no p. for articles

% Custom some field
\AtEveryBibitem{%
  \clearfield{note}%
  \clearfield{owner}%
  \clearfield{language}%
  \clearfield{abstract}%
  \ifentrytype{article}{%
    \clearfield{issn}%
  }{}
}

\newcommand\mathplus{+}  % Needed to avoid weird error in biblatex processing



% ------------------------------------------------------------------------------
% Nomenclature
% ------------------------------------------------------------------------------
%   \nomenclature{symbol}{definition}                  % Add new item
%   \nomenclature{symbol}{definition \nomunit{unité}}  % Add new item with unit

\RequirePackage{nomencl}

% Add groups
\renewcommand\nomgroup[1]{%
  \bigskip
  \bigskip
  \bigskip
  \item[\bfseries
  \ifstrequal{#1}{A}{Abréviations}{%
  \ifstrequal{#1}{L}{Lettres latines}{%
  \ifstrequal{#1}{G}{Lettres grecques}{%
  \ifstrequal{#1}{I}{Indices}{}}}}%
]}

% Add units
\newcommand{\nomunit}[1]{\renewcommand{\nomentryend}{\hspace*{\fill}#1}}

% Add symbol on the left in normal font (default)
\def\nomlabel#1{#1\hfil}

% Add command to add acronym to be consistent in all document (math mode)
\newcommand{\abr}[1]{#1}



% ------------------------------------------------------------------------------
% Tools commands
% ------------------------------------------------------------------------------
% Add command to bubble a text with optional argument to keep same size for all
% \circled{1}       % fit argument size
% \circled{1}[10]   % fit optional argument size
\newcommand{\circled}[2][]{%
  \tikz[baseline=(char.base)]{%
    \node[shape = circle, draw, inner sep = 2pt, line width=0.5pt]
    (char) {\phantom{\ifblank{#1}{#2}{#1}}};%
    \node at (char.center) {\makebox[0pt][c]{#2}};}}
\robustify{\circled}


% Add environnement for APPENDICES with class style
% Name differs from original to force user to call it explicitly
\newenvironment{thesisAppendices}{%
    \begin{appendices}
    \pagestyle{appendicesPlain}      % for other pages
    }
    {\end{appendices} \clearpage \pagestyle{fancy}}  % Close appendices environment


% Add command to put BIBLIOGRAPHY with class style
% Name differs from original to force user to call it explicitly
\newcommand{\thesisPrintbibliography}{%
  \pagestyle{bibliographyPlain}
  \phantomsection
  \addcontentsline{toc}{chapter}{\bibname}
  \printbibliography
  \clearpage
  \pagestyle{fancy}
}



% ------------------------------------------------------------------------------
% Expand French support of babel
% ------------------------------------------------------------------------------
\addto\captionsfrench{%
  \renewcommand{\contentsname}{Sommaire}
  \renewcommand{\listfigurename}{Liste des Figures}
  \renewcommand{\listtablename}{Liste des Tableaux}
  \renewcommand{\appendixtocname}{Annexes}
  \renewcommand{\appendixpagename}{Annexes}
  \renewcommand{\appendixname}{Annexe}
}

\DefineBibliographyStrings{french}{%
  bibliography = {Références bibliographiques},
  references = {Références bibliographiques},
}
