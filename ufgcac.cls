%==============================================================================
% Universidade Federal de Gois�s - UFG
% Campus Catal�o - CaC
% Classe para monografias
%==============================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ufgcac}[2013/02/01 Classe para monografia por Humberto Lidio Antonelli]

%==============================================================================
% Utilizando a classe abntex
%==============================================================================
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{abntex2}}
\ProcessOptions
\LoadClass[12pt,openright,twoside,a4paper]{abntex2} % frente e verso

%==============================================================================
% Pacotes requeridos
%==============================================================================

% Permitir assentos para portugu�s do Brasil
\RequirePackage[latin1]{inputenc}

% Separa��o sil�bica correta para portugu�s do Brasil
\RequirePackage[brazil]{babel}

% Permite hifeniza��o de palavras com acentos e cedilhas
\RequirePackage[T1]{fontenc}

% Pdf com links e bookmarks
\RequirePackage{hyperref}

% Paginas com as cita��es na bibl
\RequirePackage[brazilian,hyperpageref]{backref}

% Pacote para cita��es e refer�ncias nas normas da ABNT
\RequirePackage[alf,bibjustif,abnt-last-names=abnt,abnt-etal-text=it,abnt-repeated-title-omit=yes]{abntex2cite}

% Pacote para cria��o da lista de siglas e abreviaturas
\RequirePackage{nomencl}

% Pacote para defini��o de novos corpos flutuantes
\RequirePackage{float}

% Pacote para defini��o dos captions
\RequirePackage{caption}

% Pacote para a defini��o dos ambientes matem�ticos
\RequirePackage{amsthm}

% Pacote para referenciar a �ltima p�gina do documento
\RequirePackage{lastpage}

% Pacote para escrever texto sem separa��o sil�bica
\RequirePackage{hyphenat}

% Pacote para incluir p�ginas de PDF
\RequirePackage{pdfpages}

% Mapear caracteres especiais no PDF
\RequirePackage{cmap}

% Usa a fonte Latin Modern
\RequirePackage{lmodern}

% Cria o indice
\RequirePackage{makeidx}

% Indenta o primeiro par�grafo de cada se��o.
\RequirePackage{indentfirst}

% Controle das cores
\RequirePackage{color}

% Inclus�o de gr�ficos
\RequirePackage{graphicx}

%\RequirePackage{tocloft}

% Pacote para alterar o estilo dos Cap�tulos
%\RequirePackage[Sonny]{fncychap}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}

%==============================================================================
% Defini��o e redefini��o de comandos usados na classe
%==============================================================================

\RequirePackage{calc,soul,fourier}

% Configura��es do pacote backref
% Usado sem a op��o hyperpageref de backref
\renewcommand{\backrefpagesname}{Citado na(s) p�gina(s):~}
% Texto padr�o antes do n�mero das p�ginas
\renewcommand{\backref}{}
% Define os textos da cita��o
\renewcommand*{\backrefalt}[4]{
	\ifcase #1 %
		Nenhuma cita��o no texto.%
	\or
		Citado na p�gina #2.%
	\else
		Citado #1 vezes nas p�ginas #2.%
	\fi}%

\definecolor{nicered}{rgb}{0,0,0}
\makeatletter
\newlength\dlf@normtxtw
\setlength\dlf@normtxtw{\textwidth}
\def\myhelvetfont{\def\sfdefault{mdput}}
\newsavebox{\feline@chapter}
\newcommand\feline@chapter@marker[1][4cm]{%
\sbox\feline@chapter{%
\resizebox{!}{#1}{\fboxsep=1pt%
\colorbox{nicered}{\color{white}\bfseries\sffamily\thechapter}%
}}%
\rotatebox{90}{%
\resizebox{%
\heightof{\usebox{\feline@chapter}}+\depthof{\usebox{\feline@chapter}}}%
{!}{\scshape\so\@chapapp}}\quad%
\raisebox{\depthof{\usebox{\feline@chapter}}}{\usebox{\feline@chapter}}%
}
\newcommand\feline@chm[1][4cm]{%
\sbox\feline@chapter{\feline@chapter@marker[#1]}%
\makebox[0pt][l]{% aka \rlap
\makebox[1cm][r]{\usebox\feline@chapter}%
}}
\makechapterstyle{daleif1}{
\renewcommand\chapnamefont{\normalfont\Large\scshape\raggedleft\so}
\renewcommand\chaptitlefont{\normalfont\huge\bfseries\scshape\color{nicered}}
\renewcommand\chapternamenum{}
\renewcommand\printchaptername{}
\renewcommand\printchapternum{\null\hfill\feline@chm[2.5cm]\par}
\renewcommand\afterchapternum{\par\vskip\midchapskip}
\renewcommand\printchaptertitle[1]{\chaptitlefont\raggedleft ##1\par}
}
\makeatother




% Permite comandos com @ no nome
\makeatletter

% Comando para defini��o do departamento
\newcommand{\departamento}[1]{
  \gdef\@departamento{#1}
}

% Camando para defini��o do curso e sua modalidade
\newcommand{\curso}[3]{
  \gdef\@tipodocurso{#1}
  \gdef\@curso{#2}
  \gdef\@graucurso{#3}
}

% Comando para defini��o do nome e sobrenome do author
\renewcommand\autor[3][Nome para Referencia]{
  \global\def\@authname{#2}
  \global\def\@authsurn{#3}
  \def\ABNTautordata{#2 #3}
  \renewcommand{\imprimirautor}{#2 #3}
  \def\ABNTautorreferencia{#1}
  \def\ABNTautordatabib{#3, #2}
  \global\def\@author{#2 #3}
}

% Redefini��o do comando de orientador
\renewcommand{\orientador}[3][\orientadorname:]{
   \renewcommand{\imprimirorientadorRotulo}{#1}
   \def\ABNTorientadordatabib{#3, #2}
   \renewcommand{\imprimirorientador}{#2 #3}
}

% Ficha catalogr�fica
%\newcommand{\fichacatalografica}[1]{
%  \gdef\@fichacatalografica{#1}
%}

% Comando com o nome completo do curso
\providecommand{\@cursocompleto}{Curso de {\@tipodocurso} em {\@curso}}

% Defini��o do comando de �rea de concentra��o
\newcommand{\area}[1]{
  \global\def\@area{#1}
}

% Redefini��o do comando de data do ABNTex
\renewcommand{\data}[3]{
  \date{#1}{#2}{#3}
}

% Redefini��o do comando \date do Latex
\renewcommand{\date}[3]{
  \gdef\@day{#1}
  \gdef\@month{#2}
  \gdef\@year{#3}
}

% Define a data
\date{\number\day}{\monthname}{\number\year}

% Comando para defini��o dos membros da banca
\newcount\@membrobancaconta\@membrobancaconta0
\newcommand\membrobanca[2]{
  \global\@namedef{NomeMembroBanca:\expandafter\the\@membrobancaconta}{#1}
  \global\@namedef{LocalMembroBanca:\expandafter\the\@membrobancaconta}{#2}
  \global\advance\@membrobancaconta by 1
}

% Comando para defini��o das palavras chaves
\newcount\@palavraconta\@palavraconta0
\newcommand\palavrachave[1]{
  \global\@namedef{Palavra:\expandafter\the\@palavraconta}{#1}
  \global\advance\@palavraconta by 1
}

% Comando para defini��o da dedicat�ria
\newcommand{\textodedicatoria}[1]{
  \gdef\@dedicatoria{#1}
}

% Comando para defini��o dos agradecimentos
\newcommand{\textoagradecimentos}[1]{
  \gdef\@agradecimentos{#1}
}

% Comando para defini��o da ep�gafe
\newcommand{\textoepigrafe}[1]{
  \gdef\@epigrafe{#1}
}

% Comando para inserir simbolos na lista de s�mbolos
\newcommand{\simbolo}[2]{
  \addcontentsline{los}{simbolo}{\ensuremath{#1} --- #2}
}

% Comando para defini��o do resumo e palavras chaves
\newcommand{\textoresumo}[1]{
  \gdef\@resumo{#1}
}

% Op��o para exibir a lista de figuras
\newcommand{\incluilistadefiguras}{
  \gdef\@incluilistadefiguras{true}
}

% Op��o para exibir a lista de tabelas
\newcommand{\incluilistadetabelas}{
  \gdef\@incluilistadetabelas{true}
}

% Op��o para exibir a lista de siglas
\newcommand{\incluilistadesiglas}{
  \gdef\@incluilistadesiglas{true}
}

% Op��o para exibir a lista de s�mbolos
\newcommand{\incluilistadesimbolos}{
  \gdef\@incluilistadesimbolos{true}
}

% Op��o para exibir a lista de quadros
\newcommand{\incluilistadequadros}{
  \gdef\@incluilistadequadros{true}
}

% Op��o para exibir a lista de algoritmos
\newcommand{\incluilistadealgoritmos}{
  \gdef\@incluilistadealgoritmos{true}
}

% Op��o para exibir a lista de c�digos
\newcommand{\incluilistadecodigos}{
  \gdef\@incluilistadecodigos{true}
}


% Comando para cria��o de abreviaturas e siglas
\newcommand{\sigla}[2]{\nomenclature{#1}{#2}}

% Comando para criar a lista de palavras chaves
\newcommand{\palavraschaves}
{% O caractere % no fim de cada linha � necess�rio para que o comando n�o imprima espa�os desnecess�rios
\newcount\@palavracontatemp% Contador tempor�rio
\newtoks\@palavratoks% Registrador de tokens para concatenar as palavras
\@palavratoks={}% Inicialmente nenhuma palavra
\ifnum\@palavraconta>0% Verifica se foi definida pelo menos uma palavra chave
 \@palavracontatemp=0% Inicializa o contador tempor�rio para a primeira palavra
 \@palavratoks=\expandafter{\csname Palavra:\the\@palavracontatemp \endcsname}% Insere a primeira palavra no registrador
 \@palavracontatemp=1% Inicializa o contador tempor�rio para a segunda palavra
 \@whilenum \@palavracontatemp<\@palavraconta \do {% Enquanto o contador n�o atingir a �ltima palavra
   \@palavratoks=\expandafter\expandafter\expandafter{% Concatena as palavras
   \expandafter\the\expandafter\@palavratoks%
   \expandafter,\expandafter\space%
   \csname Palavra:\the\@palavracontatemp\endcsname%
   }%
   \advance\@palavracontatemp by 1% Incrementa o contador
 }
\fi%
\the\@palavratoks% Retorna a lista de palavras concatenadas
}



%==============================================================================
% Configura��es diversas
%==============================================================================

% Configura��o do pacote nomencl
% Comando necess�rio para a cria��o da lista de abreviaturas
\makenomenclature
% Separa as abreviaturas de suas defini��es com um h�fen
\renewcommand{\nomlabel}[1]{#1 ---}
% Traduz o t�tulo da lista de abreviaturas
\renewcommand{\nomname}{Lista de abreviaturas e siglas}

%altera��o da fonte dos cap�tulos, se��es e subse��es
\renewcommand{\ABNTEXchapterfont}{\bfseries}

% Subsubsubse��o
\newcommand{\subsubsubsection}[1]{\paragraph{#1}}

% Coment�rio a ser inserido na folha de rosto
\preambulo{Monografia apresentada ao {\@cursocompleto} da {\imprimirinstituicao}, como requisito parcial para a obten��o do Grau de {\@graucurso} em {\@curso}.}

% Recuo dos par�grafos
\setlength{\parindent}{1.3cm}% Controle do espa�amento
\setlength{\parskip}{0.2cm}  % tente tamb�m \onelineskip

% N�veis de subse��es
\setcounter{tocdepth}{4}
\setcounter{secnumdepth}{4}


%==============================================================================
% Defini��o dos ambientes matem�ticos
%==============================================================================

\theoremstyle{definition}
\newtheorem{teorema}{Teorema}
\newtheorem{proposicao}{Proposi��o}
\newtheorem{lema}{Lema}
\newtheorem{corolario}{Corol�rio}
\newtheorem{exemplo}{Exemplo}
\newtheorem{observacao}{Observa��o}
\newtheorem{definicao}{Defini��o}
\newenvironment{demonstracao}{\begin{proof}[Demonstra��o]}{\end{proof}}

%==============================================================================
% Capa
%==============================================================================

% Cria��o da Capa (Baseada na capa do ABNTex)
\renewcommand{\imprimircapa}
{
\pdfbookmark{Capa}{ufgcaccapa}
\begin{capa}%
    \center
    %\vspace*{0.7cm}
    {\large\MakeUppercase{\imprimirinstituicao}\par}
    {\MakeUppercase{\@departamento}\par}
    \@cursocompleto


    \vspace*{\fill}
    {\ABNTEXchapterfont\sc\LARGE\imprimirtitulo}

    \vspace*{4.0cm}

    {\Large\textbf{\imprimirautor}}
    \vspace*{\fill}


    {\MakeUppercase{\imprimirlocal}}
    \par
    {\@year}

    \vspace*{1cm}
\end{capa}


}% fim da \capa

\let\@oldbibliography\bibliography
\renewcommand{\bibliography}[1]
{
  \if@openright\cleardoublepage\else\clearpage\fi
	\phantomsection
  \@oldbibliography{#1}
}

%==============================================================================
% Folha de Rosto
%==============================================================================

% Cria��o da folha de rosto (baseada na folha de rosto do ABNTex)
\renewcommand{\folhaderostocontent}{
  \begin{center}

    \vspace*{1cm}
    {\large\MakeUppercase{\ABNTautordata}}

    \vspace*{\fill}\vspace*{\fill}
    {\ABNTEXchapterfont\sc\Large\imprimirtitulo}
    \vspace*{\fill}

    \abntex@ifnotempty{\imprimirpreambulo}{%
      \hspace{.45\textwidth}
      \begin{minipage}{.5\textwidth}
      	\SingleSpacing
         \imprimirpreambulo
       \end{minipage}%
       \vspace*{\fill}
    }%

    {
    	\imprimirorientadorRotulo: \\
    	\large\imprimirorientador
    }
    \abntex@ifnotempty{\imprimircoorientador}{%
       {
       		\par
       		\imprimircoorientadorRotulo: \\
       		\large\imprimircoorientador
       }%
    }%
    \@ifundefined{@area}{}{
   		\par
   		�rea: \\
   		{\large\@area}
 	}
    \vspace*{\fill}


    {\MakeUppercase{\imprimirlocal}}
    \par
    {\@year}
    \vspace*{1cm}

  \end{center}


}



%==============================================================================
% Ficha Catalografica
%==============================================================================




%==============================================================================
% Folha de Aprova��o
%==============================================================================

% Defini��o da folha de aprova��o
\newcommand{\folhadeaprovacaoUFG}
{
\begin{folhadeaprovacao}
  \begin{center}
    \vspace*{1cm}
    {\large\MakeUppercase{\imprimirautor}}

    \vspace*{\fill}\vspace*{\fill}
    {\ABNTEXchapterfont\sc\Large\imprimirtitulo}
    \vspace*{\fill}

    \hspace{.45\textwidth}
    \begin{minipage}{.5\textwidth}
        Monografia apresentada ao {\@cursocompleto} pela {\imprimirinstituicao}.
    \end{minipage}%
    \vspace*{\fill}
   \end{center}

   \begin{center}
   Trabalho aprovado em {\@day} de {\@month} de {\@year}.
   \end{center}

   \vspace{\stretch{1}}
    \@ifundefined{@area}{}{
      \centering
      \par
      �rea: \@area
    }

	\assinatura{\textbf{\imprimirorientador} \\ \imprimirorientadorRotulo}

	\abntex@ifnotempty{\imprimircoorientador}{
      \assinatura{\textbf{\imprimircoorientador} \\ \imprimircoorientadorRotulo}
    }
    \count1=0
    \@whilenum \count1<\@membrobancaconta \do {
      \assinatura{
        \textbf{ \csname NomeMembroBanca:\the\count1 \endcsname }\\
        \csname LocalMembroBanca:\the\count1 \endcsname
      }
      \advance\count1 by 1
    }

    \vspace*{\fill}
   \begin{center}

    {\imprimirlocal}
    \par
    {\@year}
    \vspace*{1cm}
  \end{center}

\end{folhadeaprovacao}
}% fim da \folhadeaprovacaoufgcac



%==============================================================================
% Dedicat�ria
%==============================================================================

% Cria��o da dedicat�ria
\newcommand{\inserededicatoria}
{
  \@ifundefined{@dedicatoria}{}{
    \begin{dedicatoria}
   \vspace*{\fill}
   \centering
   \noindent
      \textit{\@dedicatoria}
     \vspace*{\fill}
\end{dedicatoria}
  }
}

%==============================================================================
% Agradecimentos
%==============================================================================

% Cria��o dos agradecimentos
\newcommand{\insereagradecimentos}
{
  \@ifundefined{@agradecimentos}{}{
    \begin{agradecimentos}
      \@agradecimentos
    \end{agradecimentos}
  }
}

%==============================================================================
% Ep�grafe
%==============================================================================

% Cria��o da ep�gafe
\newcommand{\insereepigrafe}
{
  \@ifundefined{@epigrafe}{}{
	\begin{epigrafe}
      \vspace*{\fill}
	  \begin{flushright}
		\textit{\@epigrafe}
	 \end{flushright}
    \end{epigrafe}

  }
}

%==============================================================================
% Lista de S�mbolos
%==============================================================================

% Apresenta��o dos s�mbolos na lista de s�mbolos
\newcommand\l@simbolo[2]{\par #1}

% Cria��o da lista de s�mbolos
\newcommand{\inserelistadesimbolos}
{
  \@ifundefined{@incluilistadesimbolos}{}{
		%\if@openright\cleardoublepage\else\clearpage\fi
    \phantomsection
    %\pdfbookmark{Lista de S�mbolos}{ufgcaclistadesimbolos}
     \pretextualchapter{Lista de s�mbolos}
     {\setlength{\parindent}{0cm}
       \@starttoc{los}
     }
     \cleardoublepage
  }
}

%==============================================================================
% Cria��o dos Ambientes Flutuantes para Quadros, Algoritmos e C�gidos
%==============================================================================

\newcommand{\listquadroname}{Lista de quadros}
\newcommand{\quadroname}{Quadro}
\newcommand{\quadrorefname}{Quadro}

\newcommand{\listalgoritmoname}{Lista de algoritmos}
\newcommand{\algoritmoname}{Algoritmo}
\newcommand{\algoritmorefname}{Algoritmo}

\newcommand{\listcodigoname}{Lista de c�digos}
\newcommand{\codigoname}{C�digo}
\newcommand{\codigorefname}{C�digo}

%QUADRO
\newfloat{quadro}{htbp}{qud}[chapter]
\renewcommand{\thequadro}{\thechapter.\@arabic\c@quadro}

\newlistof{listofquadros}{qud}{\listquadroname}
\newlistentry[chapter]{quadro}{qud}{0}
  \cftsetindents{quadro}{0em}{2.3em}


\renewcommand{\cftquadroname}{\quadroname\space}
\renewcommand{\cftquadroaftersnum}{\space--}


%ALGORITMO
\floatstyle{ruled}
\newfloat{algoritmo}{htbp}{alg}[chapter]
\renewcommand{\thealgoritmo}{\thechapter.\@arabic\c@algoritmo}

\newlistof{listofalgoritmos}{alg}{\listalgoritmoname}
\newlistentry[chapter]{algoritmo}{alg}{0}
  \cftsetindents{algoritmo}{0em}{2.3em}

\renewcommand{\cftalgoritmoname}{\algoritmoname\space}
\renewcommand{\cftalgoritmoaftersnum}{\space--}

%\renewcommand\floatc@ruled[2]{%
% \setlength{\as@captionwidth}{\linewidth}%
% \captionfont%
% \as@caption{{\captionlabelfont #1:}}{#2}
% \setlength{\as@captionwidth}{\linewidth}}

%CODIGO
\floatstyle{ruled}
\newfloat{codigo}{htbp}{cod}[chapter]
\renewcommand{\thecodigo}{\thechapter.\@arabic\c@codigo}

\newlistof{listofcodigos}{cod}{\listcodigoname}
\newlistentry[chapter]{codigo}{cod}{0}
  \cftsetindents{codigo}{0em}{2.3em}

\renewcommand{\cftcodigoname}{\codigoname\space}
\renewcommand{\cftcodigoaftersnum}{\space--}

\floatname{quadro}{\quadroname}
\floatname{algoritmo}{\algoritmoname}
\floatname{codigo}{\codigoname}

\ifthenelse{\equal{\ABNTEXisarticle}{true}}{%
  \counterwithout{section}{chapter}
  \counterwithout{quadro}{section}
  \counterwithout{algoritmo}{section}
  \counterwithout{codigo}{section}
}{%else
  \counterwithout{quadro}{chapter}
  \counterwithout{algoritmo}{chapter}
  \counterwithout{codigo}{chapter}
}

\renewcommand{\cfttableaftersnum}{\space--}
\renewcommand{\cftfigureaftersnum}{\space--}

% Comando para configurar os captions no documento
\captionsetup[quadro]{position=top, labelsep=endash, font=footnotesize}
\captionsetup[table]{position=top, labelsep=endash, font=footnotesize}
\captionsetup[figure]{position=top, labelsep=endash, font=footnotesize}
\captionsetup[codigo]{position=top, labelsep=endash}
\captionsetup[algoritmo]{position=top, labelsep=endash}

%==============================================================================
% Resumo
%==============================================================================

% Cria��o do resumo e palavras chaves no documento
\newcommand{\insereresumo}
{
  \@ifundefined{@resumo}{}{
  \if@openright\cleardoublepage\else\clearpage\fi
	\phantomsection
  \begin{resumo}
  {\MakeUppercase{\ABNTautorreferencia}}. {\textit{\imprimirtitulo}.} \@year. \pageref{LastPage} f. Monografia (Gradua��o) -- \@departamento, \imprimirinstituicao, \imprimirlocal.
      %\end{flushleft}
	  \vskip 36pt
    \@resumo

	\vspace{\onelineskip}

	\noindent
    \textbf{Palavras-chaves:}\palavraschaves.
  \end{resumo}
  }
}

%==============================================================================
% Defini��o de comandos a serem inseridos diretamente no in�cio do documento
%==============================================================================

\newcommand{\inserelistadefiguras}
{
  \@ifundefined{@incluilistadefiguras}{}{
    %\if@openright\cleardoublepage\else\clearpage\fi
    \phantomsection
    \pdfbookmark{Lista de Figuras}{ufgcaclistadefiguras}
    \listoffigures*
    \cleardoublepage
  }
}

\newcommand{\inserelistadetabelas}
{
  \@ifundefined{@incluilistadetabelas}{}{
    %\if@openright\cleardoublepage\else\clearpage\fi
    \phantomsection
    \pdfbookmark{Lista de Tabelas}{ufgcaclistadetabelas}
    \listoftables*
    \cleardoublepage
  }
}

\newcommand{\inserelistadesiglas}
{
  \@ifundefined{@incluilistadesiglas}{}{
    %\if@openright\cleardoublepage\else\clearpage\fi
    \phantomsection
    \pdfbookmark{Lista de Siglas}{ufgcaclistadesiglas}
    \printnomenclature
    \cleardoublepage
  }
}

\newcommand{\inserelistadequadros}
{
  \@ifundefined{@incluilistadequadros}{}{
   % \if@openright\cleardoublepage\else\clearpage\fi
    \phantomsection
    \pdfbookmark{Lista de Quadros}{ufgcaclistadequadros}
    \listofquadros*
    \cleardoublepage
  }
}

\newcommand{\inserelistadealgoritmos}
{
  \@ifundefined{@incluilistadealgoritmos}{}{
    %\if@openright\cleardoublepage\else\clearpage\fi
    \phantomsection
    \pdfbookmark{Lista de Algoritmos}{ufgcaclistadealgoritmos}
    \listofalgoritmos*
    \cleardoublepage
  }
}

\newcommand{\inserelistadecodigos}
{
  \@ifundefined{@incluilistadecodigos}{}{
    %\if@openright\cleardoublepage\else\clearpage\fi
    \phantomsection
    \pdfbookmark{Lista de C�digos}{ufgcaclistadecodigos}
    \listofcodigos*
    \cleardoublepage
  }
}

%==============================================================================
% In�cio do Documento
%==============================================================================

% Comandos a serem inseridos no in�cio do documento
% ---
% compila o indice
% ---

% alterando o aspecto da cor azul
\definecolor{blue}{RGB}{41,5,195}

% informa��es do PDF
\hypersetup{
     	%backref=true,
     	%pagebackref=true,
		%bookmarks=true,         		% show bookmarks bar?
		pdftitle={\imprimirtitulo},
		pdfauthor={\imprimirautor},
    	%pdfsubject={\imprimirpreambulo},
		%pdfkeywords={PALAVRAS}{CHAVES}{abnt}{abntex}{abntex2},
	    pdfproducer={LaTeX with abnTeX2}, 	% producer of the document
	    pdfcreator={\imprimirautor},
    	colorlinks=true,       		% false: boxed links; true: colored links
    	linkcolor=blue,          	% color of internal links
    	citecolor=blue,        		% color of links to bibliography
    	filecolor=magenta,      		% color of file links
		urlcolor=blue,
		bookmarksdepth=4
}

\makeindex

\AtBeginDocument{

\chapterstyle{daleif1}

\pretextual

  \imprimircapa

  \imprimirfolhaderosto*

  \begin{fichacatalografica}
	\vspace*{\fill}					% Posi��o vertical
	%\hrule							% Linha horizontal
	\begin{center}
	\fbox{					% Minipage Centralizado
	\begin{minipage}[c]{12.5cm}		% Largura
	\vspace*{0.5cm}

	\textsf{\ABNTautordatabib}

	\hspace{0.5cm} \textsf{\imprimirtitulo  / \imprimirautor. -- \imprimirlocal, \@year.}

	\hspace{0.5cm} \textsf{\pageref{LastPage} f. ; 30 cm.}\\

	\hspace{0.5cm} \textsf{\imprimirorientadorRotulo:~\imprimirorientador.}
	\abntex@ifnotempty{\imprimircoorientador}{

	   \hspace{0.5cm} \textsf{\imprimircoorientadorRotulo:~\imprimircoorientador.}
    } \\

	\hspace{0.5cm} \textsf{Monografia (Gradua��o) -- \imprimirinstituicao, \@departamento, Curso de \@curso, \@year.}\\

	\hspace{0.5cm}
		\newcounter{taskcounter}

  \newcount\@palavracontatemp% Contador tempor�rio
	\newtoks\@palavratoks% Registrador de tokens para concatenar as palavras
	\@palavratoks={}% Inicialmente nenhuma palavra
	\ifnum\@palavraconta>0% Verifica se foi definida pelo menos uma palavra chave
	\@palavracontatemp=0% Inicializa o contador tempor�rio para a primeira palavra
	\stepcounter{taskcounter}
	\hspace{0.5cm} \textsf{\arabic{taskcounter}.\space \expandafter{\csname Palavra:\the\@palavracontatemp \endcsname}.\space}
	 \@palavracontatemp=1% Inicializa o contador tempor�rio para a segunda palavra
	 \@whilenum \@palavracontatemp<\@palavraconta \do {% Enquanto o contador n�o atingir a �ltima palavra
	 \stepcounter{taskcounter}
	   \textsf{\arabic{taskcounter}.\space \expandafter{\csname Palavra:\the\@palavracontatemp \endcsname}.\space}
	   \advance\@palavracontatemp by 1% Incrementa o contador
	 }
	\fi%
	\textsf{I. \ABNTorientadordatabib. II. \imprimirinstituicao. \@cursocompleto. III. T�tulo.} \\

	%\hspace{8.75cm} CDU 02:141:005.7\\
	\vspace*{0.2cm}
	\end{minipage}
	}
	\end{center}
	%\hrule
\end{fichacatalografica}

  %\fichacatalografica

  \folhadeaprovacaoUFG

  \inserededicatoria

  \insereagradecimentos

  \insereepigrafe

  \insereresumo

  \inserelistadefiguras

  \inserelistadetabelas

  \inserelistadequadros

  \inserelistadesiglas

  \inserelistadesimbolos

  \inserelistadealgoritmos

  \inserelistadecodigos

%\cftsetindents{chapter}{0em}{3.9em}
%\cftsetindents{section}{0em}{3.9em}
%\cftsetindents{subsection}{0em}{3.9em}
%\cftsetindents{subsubsection}{0em}{3.9em}
%\cftsetindents{paragraph}{0em}{3.9em}
%\cftsetindents{subparagraph}{0em}{3.9em}
%\cftsetindents{part}{0em}{3.9em}
%\cftsetindents{book}{3em}{3.9em}




  %\if@openright\cleardoublepage\else\clearpage\fi
	\phantomsection
	\pdfbookmark{Sum�rio}{ufgcacsumario}
    \tableofcontents*
    \cleardoublepage


\mainmatter
}

% Comandos no fim do documento
% \AtEndDocument{
% }

\makeatother
% Finaliza comandos com @ no nome

%\mainmatter
