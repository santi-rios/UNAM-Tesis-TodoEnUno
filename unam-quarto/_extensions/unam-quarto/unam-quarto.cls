%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Creada por Santiago Garcia-Rios
% 
% Clase para Tesis-UNAM en formato Quarto 
%
% v1.0: Versión inicial
% v1.1: Revisada para mejorar eficiencia y comentarios en español
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\newcommand{\classname}{unam-quarto} 
\ProvidesClass{\classname}[2025/01/01 v1.1 https://github.com/santi-rios/]
\providecommand{\baseclass}{book}

% Cargar paquetes esenciales
\RequirePackage{etoolbox}
\RequirePackage{xparse}

% Definir variables booleanas para opciones de la clase unam-quarto
\newbool{nolistspace}
\newbool{chapteroneline}
\newbool{listtoc}
\newbool{toctoc}
\newbool{parskip}
\newbool{hyperrefsupport}
\booltrue{hyperrefsupport}
\newbool{headsepline}
\newbool{consistentlayout}

% Opciones de la clase
\DeclareOption{nohyperref}{\boolfalse{hyperrefsupport}}
\DeclareOption{nolistspacing}{\booltrue{nolistspace}}
\DeclareOption{liststotoc}{\booltrue{listtoc}}
\DeclareOption{chapterinoneline}{\booltrue{chapteroneline}}
\DeclareOption{toctotoc}{\booltrue{toctoc}}
\DeclareOption{parskip}{\booltrue{parskip}}
\DeclareOption{headsepline}{\booltrue{headsepline}}
\DeclareOption{consistentlayout}{\booltrue{consistentlayout}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\baseclass}}

\ProcessOptions\relax
\LoadClass{\baseclass}

% Comandos para espaciado en capítulos
\ProvideDocumentCommand{\abovechapterskip}{}{\vspace*{20pt}}
\ProvideDocumentCommand{\chapterbelowskip}{}{\vspace*{40pt}}
\ProvideDocumentCommand{\chapterinbetweenskip}{}{\vspace*{20pt}}
\ProvideDocumentCommand{\autodot}{}{}
\ProvideDocumentCommand{\mdtChapapp}{}{}
\ProvideDocumentCommand{\chapteralign}{}{\raggedright}
\ProvideDocumentCommand{\chapterfont}{}{\Huge\bfseries}
\ProvideDocumentCommand{\chapterprefixfont}{}{\LARGE\bfseries}

% Definir el estilo de los títulos de capítulos
\DeclareDocumentCommand{\@makechapterhead}{ m }{%
	\abovechapterskip
	{\parindent \z@ \chapteralign \normalfont
		\ifnum \c@secnumdepth >\m@ne
		\if@mainmatter
		\ifbool{chapteroneline}{%
			\chapterfont \mdtChapapp\thechapter\autodot\enspace
		}{%
			\chapterprefixfont \@chapapp\space \thechapter
			\par\nobreak
			\chapterinbetweenskip
		}%
		\fi
		\fi
		\interlinepenalty\@M%
		\chapterfont #1\par\nobreak
		\chapterbelowskip
	}
	\thispagestyle{\chapter@p@gestyle}
}

\def\@makeschapterhead#1{%
	\abovechapterskip
	{\parindent \z@ \chapteralign
		\normalfont
		\interlinepenalty\@M
		\chapterfont  #1\par\nobreak
		\chapterbelowskip
	}
	\thispagestyle{\chapter@p@gestyle}
}

% Comando para capítulos no numerados con entrada en el índice
\ProvideDocumentCommand{\addchap}{ s o m }{%
	\chapter*{#3}%
	\markboth{}{}%
	\IfBooleanTF{#1}{%
	}{%
		\IfNoValueTF{#2}{%
			\addchaptertocentry{#3}%
			\markboth{\MakeMarkcase{#3}}{\MakeMarkcase{#3}}%
		}{%
			\addchaptertocentry{#2}%
			\markboth{\MakeMarkcase{#2}}{\MakeMarkcase{#2}}%
		}%
	}%
}%

% Comando para secciones no numeradas con entrada en el índice
\ProvideDocumentCommand{\addsec}{ s o m }{%
	\section*{#3}%
	\markright{}%
	\IfBooleanTF{#1}{%
	}{%
		\IfNoValueTF{#2}{%
			\addcontentsline{toc}{section}{#3}%
			\markright{\MakeMarkcase{#3}}%%
		}{%
			\addcontentsline{toc}{section}{#2}%
			\markright{\MakeMarkcase{#2}}%
		}%
	}%
}%

%----------------------------------------------------------------------------------------
%	OPCIONES DE LA CLASE
%----------------------------------------------------------------------------------------

\ifbool{parskip}{\RequirePackage{parskip}} % Si se pasa la opción parskip, cargar el paquete parskip

\ifbool{listtoc}{% Si se pasa la opción liststotoc, agregar listas al índice
	\patchcmd{\listoftables}{\@starttoc{lot}}{%
		\addchaptertocentry{\listtablename}\@starttoc{lot}%
	}{}{}%
	\patchcmd{\listoffigures}{\@starttoc{lof}}{%
		\addchaptertocentry{\listfigurename}\@starttoc{lof}%
	}{}{}%
}

\ifbool{toctoc}{% Si se pasa la opción toctotoc, agregar el índice al índice
	\patchcmd{\tableofcontents}{\@starttoc{toc}}{%
		\addchaptertocentry{\contentsname}\@starttoc{toc}}{}{}%
}

% Ajustar mayúsculas en el índice
\patchcmd{\tableofcontents}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\listoffigures}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\listoftables}{\MakeUppercase}{\MakeMarkcase}{}{}

% Reducir espaciado en listas si se pasa la opción nolistspacing
\ifbool{nolistspace}{
	\patchcmd{\listoffigures}{%
		\@starttoc{lof}
	}{%
		\begingroup%
		\singlespace\@starttoc{lof}\endgroup%
	}{}{}%
	\patchcmd{\listoftables}{%
		\@starttoc{lot}
	}{%
		\begingroup%
		\singlespace\@starttoc{lot}\endgroup%
	}{}{}%
	\patchcmd{\tableofcontents}{%
		\@starttoc{toc}
	}{%
		\begingroup%
		\singlespace\@starttoc{toc}\endgroup%
	}{}{}%
}{}

%----------------------------------------------------------------------------------------
%	PAQUETES REQUERIDOS
%----------------------------------------------------------------------------------------

\RequirePackage{babel} % Para soporte de idiomas
\RequirePackage{scrbase} % Para nombres de secciones dependientes del idioma
\RequirePackage{scrhack} % Correcciones para varios paquetes
\RequirePackage{setspace} % Para ajustar el espaciado entre líneas
\RequirePackage{longtable} % Para tablas que abarcan varias páginas
\RequirePackage{graphicx} % Para incluir imágenes
\graphicspath{{Figures/}{./}} % Ruta de las imágenes
\RequirePackage{booktabs} % Para mejores reglas en tablas
\RequirePackage{caption} % Para personalizar los subtítulos
\captionsetup{justification=centerlast,font=small,labelfont=sc,margin=50pt} % Estilo de los subtítulos

%----------------------------------------------------------------------------------------
%	COMANDOS PARA INFORMACIÓN DE LA TESIS
%----------------------------------------------------------------------------------------

\NewDocumentCommand{\thesistitle}{ o m }{%
 \IfValueTF{#1}{\def\shorttitle{#1}}{\def\shorttitle{#2}}%
 \def\@title{#2}%
 \def\ttitle{#2}%
}
\DeclareDocumentCommand{\author}{m}{\newcommand{\authorname}{#1}\renewcommand{\@author}{#1}}
\NewDocumentCommand{\supervisor}{m}{\newcommand{\supname}{#1}}
\NewDocumentCommand{\supervisorfac}{m}{\newcommand{\supfac}{#1}}
\NewDocumentCommand{\examiner}{m}{\newcommand{\examname}{#1}}
\NewDocumentCommand{\examinertwo}{m}{\newcommand{\examnametwo}{#1}}
\NewDocumentCommand{\examinertwofac}{m}{\newcommand{\examfactwo}{#1}}
\NewDocumentCommand{\examinerfac}{m}{\newcommand{\examfac}{#1}}
\NewDocumentCommand{\degree}{m}{\newcommand{\degreename}{#1}}
\NewDocumentCommand{\addresses}{m}{\newcommand{\addressname}{#1}}
\NewDocumentCommand{\university}{m}{\newcommand{\univname}{#1}}
\NewDocumentCommand{\grado}{m}{\newcommand{\gradoname}{#1}}
\NewDocumentCommand{\department}{m}{\newcommand{\deptname}{#1}}
\NewDocumentCommand{\group}{m}{\newcommand{\groupname}{#1}}
\NewDocumentCommand{\faculty}{m}{\newcommand{\facname}{#1}}
\NewDocumentCommand{\subject}{m}{\newcommand{\subjectname}{#1}}
\NewDocumentCommand{\keywords}{m}{\newcommand{\keywordnames}{#1}}
\NewDocumentCommand{\versiontesis}{m}{\newcommand{\versionnumero}{#1}}

% Comando para mover contenido a la siguiente página impar
\newcommand{\checktoopen}{%
	\if@openright\cleardoublepage\else\clearpage\fi
	\ifdef{\phantomsection}{\phantomsection}{}%
}

% Comandos para reglas decorativas
\NewDocumentCommand{\bhrule}{}{\typeout{--------------------}}
\NewDocumentCommand{\tttypeout}{m}{\bhrule\typeout{\space #1}\bhrule}
\newcommand{\HRule}{\rule{.9\linewidth}{.6pt}}
\newcommand{\decoRule}{\rule{.8\textwidth}{.4pt}}

% Comando para agregar entradas al índice
\ProvideDocumentCommand{\addchaptertocentry}{ m }{%
	\addcontentsline{toc}{chapter}{#1}%
}

%----------------------------------------------------------------------------------------
%	COLORES
%----------------------------------------------------------------------------------------

\usepackage[dvipsnames]{xcolor} % Para definir colores personalizados
\colorlet{mdtRed}{red!50!black}

%----------------------------------------------------------------------------------------
%	PENALIZACIONES
%----------------------------------------------------------------------------------------

\doublehyphendemerits=10000 % Evitar guiones consecutivos
\brokenpenalty=10000 % Evitar palabras rotas entre columnas/páginas
\widowpenalty=9999 % Evitar viudas
\clubpenalty=9999 % Evitar huérfanos
\interfootnotelinepenalty=9999 % Evitar saltos en notas al pie

%----------------------------------------------------------------------------------------
%	ENCABEZADOS Y PIES DE PÁGINA
%----------------------------------------------------------------------------------------

\RequirePackage[markcase=used]{scrlayer-scrpage}
\providepairofpagestyles{thesisSimple}{%
	\clearpairofpagestyles%
	\automark[chapter]{chapter}
	\ihead{\headmark}% Encabezado interno
	\ohead[\pagemark]{\pagemark}% Encabezado externo
}
\ifoot{}% Pie de página interno
\ofoot{}% Pie de página externo
\pagestyle{thesisSimple}
\providepairofpagestyles[thesisSimple]{thesis}{%
	\automark*[section]{}%
}
\providepairofpagestyles[thesisSimple]{review}{%
	\ofoot[\shorttitle/\authorname]{\shorttitle/\authorname}
	\ifoot[\today]{\today}
}
\pagestyle{thesis}
\ifbool{headsepline}{\KOMAoption{headsepline}{true}}{}
\PreventPackageFromLoading[\ClassError{\classname}{El paquete `fancyhdr' es
incompatible\MessageBreak con esta clase}{Los estilos de página se definen 
	usando el paquete `scrlayer-scrpage', por favor consulta la\MessageBreak 
documentación de KOMA-script para más detalles.}]{fancyhdr}

% Estilos de página en blanco y de capítulo
\newcommand{\blank@p@gestyle}{empty}
\newcommand{\chapter@p@gestyle}{plain}
\NewDocumentCommand{\blankpagestyle}{ m }{%
	\ClassWarning{\classname}{\string\blankpagestyle\space está
	obsoleto,\MessageBreak usa \string\setblankpagestyle \space en su lugar}\renewcommand{\blank@p@gestyle}{}{#1}
}
\NewDocumentCommand{\setblankpagestyle}{ m }{\renewcommand{\blank@p@gestyle}{#1}}
\NewDocumentCommand{\setchapterpagestyle}{ m }{\renewcommand{\chapter@p@gestyle}{#1}}

\DeclareDocumentCommand\cleardoublepage{}{\clearpage\if@twoside \ifodd\c@page\else
	\hbox{}
	\thispagestyle{\blank@p@gestyle}
	\newpage
	\if@twocolumn\hbox{}\newpage\fi\fi\fi%
}

%----------------------------------------------------------------------------------------
%	ESTILO DE PÁGINA PARA REVISIÓN DIGITAL
%----------------------------------------------------------------------------------------

\providepairofpagestyles{reviewdigital}{%
    \clearpairofpagestyles%
    \automark[chapter]{chapter}
    \ihead{\headmark}% Encabezado interno: título del capítulo
    \ohead[\pagemark]{\pagemark\ de 79}% Encabezado externo: número de página
    \ifoot{\today}% Pie de página interno: fecha actual
    \ofoot{Revisión.V.\versionnumero}% Pie de página externo: versión de revisión
}

% Aplicar el estilo de página para revisión digital
\pagestyle{reviewdigital}

%----------------------------------------------------------------------------------------
%	OTRAS CONFIGURACIONES PARA REVISIÓN DIGITAL
%----------------------------------------------------------------------------------------

% Ajustes adicionales para mejorar la legibilidad en pantalla
% ...

%----------------------------------------------------------------------------------------
%	DISEÑO DE PÁGINAS ESPECIALES
%----------------------------------------------------------------------------------------

% Definiciones para páginas de abreviaturas, resumen, agradecimientos, declaración, etc.
% ...

%----------------------------------------------------------------------------------------
%	ABBREVIATIONS PAGE DESIGN
%----------------------------------------------------------------------------------------

% \newcommand{\abbrevname}{List of Abbreviations}
% \providecaptionname{english,british,american}{\abbrevname}{List of Abbreviations}
% \providecaptionname{ngerman,german,austrian,naustrian}{\abbrevname}{Abk\"urzungsverzeichnis}
% \providecaptionname{spanish}{\abbrevname}{Abreviaturas}
\NewDocumentEnvironment{abbreviations}{ m }{%
	\addtocounter{table}{-1}% Don't count this table as one of the document tables
	\ifbool{nolistspace}{\endgroup}{}
	\printacronyms[heading = chapter, name=Abreviaturas, pages={display=all,seq/use=false}] % Print acronyms
}

%----------------------------------------------------------------------------------------
%	Agradecimientos institucionales
%----------------------------------------------------------------------------------------

% \usepackage{xcolor}
% \colorlet{mdtRed}{red!50!black}
% \newcommand{\acknowledgementname}{agradecimientos}
% \providecaptionname{spanish} {\acknowledgementname}{agradecimientos} % Acknowledgement text for English countries
% \providecaptionname{american,australian,british,canadian,english,newzealand,UKenglish,USenglish} {\acknowledgementname}{Acknowledgements} % Acknowledgement text for English countries

% \ifbool{consistentlayout}{
% 	\DeclareDocumentEnvironment{agradecimientos}{}{%
% 		\tttypeout{\acknowledgementname}
% 		\addchap*{\acknowledgementname}
% 	}
% }
% {
% 	\DeclareDocumentEnvironment{agradecimientos}{}{%
% 		\checktoopen
% 		\tttypeout{\acknowledgementname}
% 		\thispagestyle{plain}
% 		\begin{center}{\huge\textit{\acknowledgementname}\par}\end{center}
% 	}
% 	{
% 		\vfil\vfil\null
% 	}
% }

%----------------------------------------------------------------------------------------
%	SOPORTE PARA HYPERREF
%----------------------------------------------------------------------------------------

\ifbool{hyperrefsupport}{% Si no se ha especificado la opción nohyperref
\AtEndPreamble{\RequirePackage{hyperref}
\hypersetup{pdfpagemode={UseOutlines},
bookmarksopen=true,
bookmarksopenlevel=0,
hypertexnames=false,
pdfstartview={FitV},
unicode,
breaklinks=true,
}

\pdfstringdefDisableCommands{% Evitar saltos de línea en los marcadores
	\let\\\space%
}
	}
}{% Nada
}

%----------------------------------------------------------------------------------------

\endinput
% Fin del archivo de clase