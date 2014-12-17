%==============================================================================
% Universidade Federal de Goisás - UFG
% Campus Catalão - CaC
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

% Permitir assentos para português do Brasil
\RequirePackage[latin1]{inputenc}

% Separação silábica correta para português do Brasil
\RequirePackage[brazil]{babel}

% Permite hifenização de palavras com acentos e cedilhas
\RequirePackage[T1]{fontenc}

% Pdf com links e bookmarks
\RequirePackage{hyperref}

% Paginas com as citações na bibl
\RequirePackage[brazilian,hyperpageref]{backref}

% Pacote para citações e referências nas normas da ABNT
\RequirePackage[alf,bibjustif,abnt-last-names=abnt,abnt-etal-text=it,abnt-repeated-title-omit=yes]{abntex2cite}

% Pacote para criação da lista de siglas e abreviaturas
\RequirePackage{nomencl}

% Pacote para definição de novos corpos flutuantes
\RequirePackage{float}

% Pacote para definição dos captions
\RequirePackage{caption}

% Pacote para a definição dos ambientes matemáticos
\RequirePackage{amsthm}

% Pacote para referenciar a última página do documento
\RequirePackage{lastpage}

% Pacote para escrever texto sem separação silábica
\RequirePackage{hyphenat}

% Pacote para incluir páginas de PDF
\RequirePackage{pdfpages}

% Mapear caracteres especiais no PDF
\RequirePackage{cmap}

% Usa a fonte Latin Modern
\RequirePackage{lmodern}

% Cria o indice
\RequirePackage{makeidx}

% Indenta o primeiro parágrafo de cada seção.
\RequirePackage{indentfirst}

% Controle das cores
\RequirePackage{color}

% Inclusão de gráficos
\RequirePackage{graphicx}

%\RequirePackage{tocloft}

% Pacote para alterar o estilo dos Capítulos
%\RequirePackage[Sonny]{fncychap}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}

%==============================================================================
% Definição e redefinição de comandos usados na classe
%==============================================================================

\RequirePackage{calc,soul,fourier}

% Configurações do pacote backref
% Usado sem a opção hyperpageref de backref
\renewcommand{\backrefpagesname}{Citado na(s) página(s):~}
% Texto padrão antes do número das páginas
\renewcommand{\backref}{}
% Define os textos da citação
\renewcommand*{\backrefalt}[4]{
	\ifcase #1 %
		Nenhuma citação no texto.%
	\or
		Citado na página #2.%
	\else
		Citado #1 vezes nas páginas #2.%
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

% Comando para definição do departamento
\newcommand{\departamento}[1]{
  \gdef\@departamento{#1}
}

% Camando para definição do curso e sua modalidade
\newcommand{\curso}[3]{
  \gdef\@tipodocurso{#1}
  \gdef\@curso{#2}
  \gdef\@graucurso{#3}
}

% Comando para definição do nome e sobrenome do author
\renewcommand\autor[3][Nome para Referencia]{
  \global\def\@authname{#2}
  \global\def\@authsurn{#3}
  \def\ABNTautordata{#2 #3}
  \renewcommand{\imprimirautor}{#2 #3}
  \def\ABNTautorreferencia{#1}
  \def\ABNTautordatabib{#3, #2}
  \global\def\@author{#2 #3}
}

% Redefinição do comando de orientador
\renewcommand{\orientador}[3][\orientadorname:]{
   \renewcommand{\imprimirorientadorRotulo}{#1}
   \def\ABNTorientadordatabib{#3, #2}
   \renewcommand{\imprimirorientador}{#2 #3}
}

% Ficha catalográfica
%\newcommand{\fichacatalografica}[1]{
%  \gdef\@fichacatalografica{#1}
%}

% Comando com o nome completo do curso
\providecommand{\@cursocompleto}{Curso de {\@tipodocurso} em {\@curso}}

% Definição do comando de área de concentração
\newcommand{\area}[1]{
  \global\def\@area{#1}
}

% Redefinição do comando de data do ABNTex
\renewcommand{\data}[3]{
  \date{#1}{#2}{#3}
}

% Redefinição do comando \date do Latex
\renewcommand{\date}[3]{
  \gdef\@day{#1}
  \gdef\@month{#2}
  \gdef\@year{#3}
}

% Define a data
\date{\number\day}{\monthname}{\number\year}

% Comando para definição dos membros da banca
\newcount\@membrobancaconta\@membrobancaconta0
\newcommand\membrobanca[2]{
  \global\@namedef{NomeMembroBanca:\expandafter\the\@membrobancaconta}{#1}
  \global\@namedef{LocalMembroBanca:\expandafter\the\@membrobancaconta}{#2}
  \global\advance\@membrobancaconta by 1
}

% Comando para definição das palavras chaves
\newcount\@palavraconta\@palavraconta0
\newcommand\palavrachave[1]{
  \global\@namedef{Palavra:\expandafter\the\@palavraconta}{#1}
  \global\advance\@palavraconta by 1
}

% Comando para definição da dedicatória
\newcommand{\textodedicatoria}[1]{
  \gdef\@dedicatoria{#1}
}

% Comando para definição dos agradecimentos
\newcommand{\textoagradecimentos}[1]{
  \gdef\@agradecimentos{#1}
}

% Comando para definição da epígafe
\newcommand{\textoepigrafe}[1]{
  \gdef\@epigrafe{#1}
}

% Comando para inserir simbolos na lista de símbolos
\newcommand{\simbolo}[2]{
  \addcontentsline{los}{simbolo}{\ensuremath{#1} --- #2}
}

% Comando para definição do resumo e palavras chaves
\newcommand{\textoresumo}[1]{
  \gdef\@resumo{#1}
}

% Opção para exibir a lista de figuras
\newcommand{\incluilistadefiguras}{
  \gdef\@incluilistadefiguras{true}
}

% Opção para exibir a lista de tabelas
\newcommand{\incluilistadetabelas}{
  \gdef\@incluilistadetabelas{true}
}

% Opção para exibir a lista de siglas
\newcommand{\incluilistadesiglas}{
  \gdef\@incluilistadesiglas{true}
}

% Opção para exibir a lista de símbolos
\newcommand{\incluilistadesimbolos}{
  \gdef\@incluilistadesimbolos{true}
}

% Opção para exibir a lista de quadros
\newcommand{\incluilistadequadros}{
  \gdef\@incluilistadequadros{true}
}

% Opção para exibir a lista de algoritmos
\newcommand{\incluilistadealgoritmos}{
  \gdef\@incluilistadealgoritmos{true}
}

% Opção para exibir a lista de códigos
\newcommand{\incluilistadecodigos}{
  \gdef\@incluilistadecodigos{true}
}


% Comando para criação de abreviaturas e siglas
\newcommand{\sigla}[2]{\nomenclature{#1}{#2}}

% Comando para criar a lista de palavras chaves
\newcommand{\palavraschaves}
{% O caractere % no fim de cada linha é necessário para que o comando não imprima espaços desnecessários
\newcount\@palavracontatemp% Contador temporário
\newtoks\@palavratoks% Registrador de tokens para concatenar as palavras
\@palavratoks={}% Inicialmente nenhuma palavra
\ifnum\@palavraconta>0% Verifica se foi definida pelo menos uma palavra chave
 \@palavracontatemp=0% Inicializa o contador temporário para a primeira palavra
 \@palavratoks=\expandafter{\csname Palavra:\the\@palavracontatemp \endcsname}% Insere a primeira palavra no registrador
 \@palavracontatemp=1% Inicializa o contador temporário para a segunda palavra
 \@whilenum \@palavracontatemp<\@palavraconta \do {% Enquanto o contador não atingir a última palavra
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
% Configurações diversas
%==============================================================================

% Configuração do pacote nomencl
% Comando necessário para a criação da lista de abreviaturas
\makenomenclature
% Separa as abreviaturas de suas definições com um hífen
\renewcommand{\nomlabel}[1]{#1 ---}
% Traduz o título da lista de abreviaturas
\renewcommand{\nomname}{Lista de abreviaturas e siglas}

%alteração da fonte dos capítulos, seções e subseções
\renewcommand{\ABNTEXchapterfont}{\bfseries}

% Subsubsubseção
\newcommand{\subsubsubsection}[1]{\paragraph{#1}}

% Comentário a ser inserido na folha de rosto
\preambulo{Monografia apresentada ao {\@cursocompleto} da {\imprimirinstituicao}, como requisito parcial para a obtenção do Grau de {\@graucurso} em {\@curso}.}

% Recuo dos parágrafos
\setlength{\parindent}{1.3cm}% Controle do espaçamento
\setlength{\parskip}{0.2cm}  % tente também \onelineskip

% Níveis de subseções
\setcounter{tocdepth}{4}
\setcounter{secnumdepth}{4}


%==============================================================================
% Definição dos ambientes matemáticos
%==============================================================================

\theoremstyle{definition}
\newtheorem{teorema}{Teorema}
\newtheorem{proposicao}{Proposição}
\newtheorem{lema}{Lema}
\newtheorem{corolario}{Corolário}
\newtheorem{exemplo}{Exemplo}
\newtheorem{observacao}{Observação}
\newtheorem{definicao}{Definição}
\newenvironment{demonstracao}{\begin{proof}[Demonstração]}{\end{proof}}

%==============================================================================
% Capa
%==============================================================================

% Criação da Capa (Baseada na capa do ABNTex)
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

% Criação da folha de rosto (baseada na folha de rosto do ABNTex)
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
   		Área: \\
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
% Folha de Aprovação
%==============================================================================

% Definição da folha de aprovação
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
      Área: \@area
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
% Dedicatória
%==============================================================================

% Criação da dedicatória
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

% Criação dos agradecimentos
\newcommand{\insereagradecimentos}
{
  \@ifundefined{@agradecimentos}{}{
    \begin{agradecimentos}
      \@agradecimentos
    \end{agradecimentos}
  }
}

%==============================================================================
% Epígrafe
%==============================================================================

% Criação da epígafe
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
% Lista de Símbolos
%==============================================================================

% Apresentação dos símbolos na lista de símbolos
\newcommand\l@simbolo[2]{\par #1}

% Criação da lista de símbolos
\newcommand{\inserelistadesimbolos}
{
  \@ifundefined{@incluilistadesimbolos}{}{
		%\if@openright\cleardoublepage\else\clearpage\fi
    \phantomsection
    %\pdfbookmark{Lista de Símbolos}{ufgcaclistadesimbolos}
     \pretextualchapter{Lista de símbolos}
     {\setlength{\parindent}{0cm}
       \@starttoc{los}
     }
     \cleardoublepage
  }
}

%==============================================================================
% Criação dos Ambientes Flutuantes para Quadros, Algoritmos e Cógidos
%==============================================================================

\newcommand{\listquadroname}{Lista de quadros}
\newcommand{\quadroname}{Quadro}
\newcommand{\quadrorefname}{Quadro}

\newcommand{\listalgoritmoname}{Lista de algoritmos}
\newcommand{\algoritmoname}{Algoritmo}
\newcommand{\algoritmorefname}{Algoritmo}

\newcommand{\listcodigoname}{Lista de códigos}
\newcommand{\codigoname}{Código}
\newcommand{\codigorefname}{Código}

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

% Criação do resumo e palavras chaves no documento
\newcommand{\insereresumo}
{
  \@ifundefined{@resumo}{}{
  \if@openright\cleardoublepage\else\clearpage\fi
	\phantomsection
  \begin{resumo}
  {\MakeUppercase{\ABNTautorreferencia}}. {\textit{\imprimirtitulo}.} \@year. \pageref{LastPage} f. Monografia (Graduação) -- \@departamento, \imprimirinstituicao, \imprimirlocal.
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
% Definição de comandos a serem inseridos diretamente no início do documento
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
    \pdfbookmark{Lista de Códigos}{ufgcaclistadecodigos}
    \listofcodigos*
    \cleardoublepage
  }
}

%==============================================================================
% Início do Documento
%==============================================================================

% Comandos a serem inseridos no início do documento
% ---
% compila o indice
% ---

% alterando o aspecto da cor azul
\definecolor{blue}{RGB}{41,5,195}

% informações do PDF
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
	\vspace*{\fill}					% Posição vertical
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

	\hspace{0.5cm} \textsf{Monografia (Graduação) -- \imprimirinstituicao, \@departamento, Curso de \@curso, \@year.}\\

	\hspace{0.5cm}
		\newcounter{taskcounter}

  \newcount\@palavracontatemp% Contador temporário
	\newtoks\@palavratoks% Registrador de tokens para concatenar as palavras
	\@palavratoks={}% Inicialmente nenhuma palavra
	\ifnum\@palavraconta>0% Verifica se foi definida pelo menos uma palavra chave
	\@palavracontatemp=0% Inicializa o contador temporário para a primeira palavra
	\stepcounter{taskcounter}
	\hspace{0.5cm} \textsf{\arabic{taskcounter}.\space \expandafter{\csname Palavra:\the\@palavracontatemp \endcsname}.\space}
	 \@palavracontatemp=1% Inicializa o contador temporário para a segunda palavra
	 \@whilenum \@palavracontatemp<\@palavraconta \do {% Enquanto o contador não atingir a última palavra
	 \stepcounter{taskcounter}
	   \textsf{\arabic{taskcounter}.\space \expandafter{\csname Palavra:\the\@palavracontatemp \endcsname}.\space}
	   \advance\@palavracontatemp by 1% Incrementa o contador
	 }
	\fi%
	\textsf{I. \ABNTorientadordatabib. II. \imprimirinstituicao. \@cursocompleto. III. Título.} \\

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
	\pdfbookmark{Sumário}{ufgcacsumario}
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
