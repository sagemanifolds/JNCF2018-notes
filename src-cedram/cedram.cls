\NeedsTeXFormat{LaTeX2e}% LaTeX 2.09 can't be used (nor non-LaTeX)
[1995/06/01]% LaTeX date must be June 1995 or later
\ProvidesClass{cedram}[2018/05/25 v2.7]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Changelog
%% 2018/05/25 OGEO support added, Option IAmAmsart to simplify
%% compatibility with packages that know amsart, but not cedram. Also
%% new dimens in order to be able to have different left and right
%% margins for abstracts.
%% 2018/01/17 added support for monolingual journals (babel is loaded,
%% but not French language, with all its incompatibilities). Added a
%% predefined ques(tion) environment, Added a parameter for proof
%% env. indent.
%% 2017/12/05 added support for strange \pdfcreationdate format
%% 2017/11/25 supplementary material avec \CDRsupplementary
%% 2017/11/07 ajout support fichier cdrdoidates
%% 2017/10/15 ajout AHL, subjclass now 2010 by default, on charge
%% toujours xcolor plutot que color
%% 2017/10/01 test si scories dans \author
%% 2017/08/28 option ALCO
%% 2017/08/22 suppression des references a frenchb 
%% 2017/07/05 modification interne edef -> protected@edef pour
%% securiser le binz aprs test concluant
%% 2017/02/07 Ajout option longabstracts (ne met pas les r{\'e}sum{\'e}s dans
%% un vbox). @maketitle deplace apres le markboth pour traiter le cas
%% de resumes tres longs...
%% 2015/12/10 Hyperref: pdfview change en XYZ par defaut. Fix ancres pages pour
%% avoir un hyperpage qui fonctionne
%% 2015/11/13 ajout option Attached et config associ{\'e}es
%% 2015/06/23 modifications metadonnes : authors enrichi (hascurraddr,
%% hasemail, hasurl), ce qui permet de faire le style AFST, et une
%% petite modif makefnmark pour eviter pb amsart (JTNB)
%% Ajout option NoSaveZebib qui retablit la definition par defaut de thebibliography
%% 2015/03/12 modif test HASCEDRICS sous windows
%% 2014/11/10 ajout option MathTools (pour eviter clash avec frenchb)
%% 2014/05/12 ajout option publishTeX (source TeX en ligne, d{\'e}faut
%% pour JEP), d'o{\`u} deux cl{\'e}s nouvelles pour includearticle: publishTeX et NopublishTeX
%% Option Unicode
%% 2014/04/16 Modif \includearticle pour passer des cl{\'e}s-valeurs en
%% option : doi, intID, option published ; ceci laisse une trace dans
%% le XML
%% ajout JCM ; ajout option epreuves pour JEP
%% 2013/10/25 ajout modifs li{\'e}es au JEP et insertions trucs SMF
%% 2013/09/02 ajout \noaddresscontrib (cas d'un contributeur dont on
%% n'imprime pas l'adresse)
%% 2013/06/25 ajout CML et JEP
%% 2012/12/04 option published : impose \pdfdraftmode=1 ou compiler
%% avec -pdfdraftmode
%% 2012/09/11 ajout subtitle multilingue
%% 2012/09/04 \numexpo
%% 2012/07/04 Ajout PMB
%% 2011/06/20 changements mineurs pour CG. Supprime option psamsfonts (obsolete)
%% 2010/12/20 Ajout{\'e} \ifcdr@sectioninchapters pour sections continues
%% meme avec chapter... RunningSectionInChapter
%% 2010/11/01 : introduit les options 
%%%  NoEqCountersInSection compteurs d'{\'e}quations courent sur tout l'article
%%%  NoFloatCountersInSection compteurs table, figure courent sur tout l'article
%%%  OneCounterForEverything th{\'e}or{\`e}mes, {\'e}quations et soussections partagent le m{\^e}me compteur
%%%  SubsectAsParagraph sous-sections compatibles amsart (=\paragraph)
%%% AmsartStyle NoEqCountersInSection+NoFloatCountersInSection+OneCounterForEverything+SubsectAsParagraph
%% 2010/03/26 : introduit \nobreakauthor
%% 2010/01/27 : option CCIRM
%% 2009/10/16 : passe \idart et \idvol {\`a} tralics
%% 2009/10/16 : option RedoIndex ajout{\'e}e
%% 2009/10/15 : option de journal aussi pour m{\'e}tas head et spec
%% 2009/02/26 2.3.1 : ajout option OpenAccess, d{\'e}but de ce Changelog
%% document{\'e} {\`a} rebours !
%% 2008/12/11 : cedramarticle.dtd existe :
%% r{\^o}le d'un auteur = redacteur-appendice ({\'e}tait redacteur_appendice,
%% pb avec underscore)
%% 2008/10/01 : envoy{\'e} le chargement d'hyperref en fin de
%% classe. Modifi{\'e} deux trois choses pour les sections en cons{\'e}quence...
%% 2008/11/01 : ajout support ACIRM  
%% Modifs pour tralics : Ajouts id titre avertissement resume resp au
%% niveau volume dans la  dtd, et support ici-m{\^e}me
%% inclus \def\cprime cause biblios MR...
%%  corrig{\'e} l'option chapters, les sections sont alors
%% num{\'e}rot{\'e}es relativement aux chapitres. Remplac{\'e} section par
%% \@auxsection pour biblio, etc. (peut {\^e}tre chap.)
%% 2008/07/08 : introduit l'option chapters. 
%% 2008/06/27 : introduit \dateexpose (SEDP). Am{\'e}lior{\'e} support
%% multiplateforme :  fonctionnement complet sous MikTeX.
%% 2008/02/15 : etex.sty
%% Introduit doi dans la DTD donc \DOI ici.
%% introduit passer des choses au sommaire : \SomDefs similaire {\`a}
%% \TralicsDefs , et l'environnement DefSom similaire {\`a}  DefTralics,
%% Chaque cdrsom est d{\'e}sormais dans un groupe (d{\'e}fs restent locales)
%% 2008/02/08 : introduction TSG. ifplatform.sty, introduction
%% multiplateforme.
%% On stocke jtitrecourt en XML.
%% 2007/11/29 v2.2 : MSIA, SEDP. 
%% Introduit DefGlobales (qui marche niveau volume {\`a} la fa{\c c}on de
%% DefTralics pour passer du code {\`a} tous les articles d'un volume)
%% Rendu les attributs de pages en XML robustes avec \XMLaddatt* !
%% Introduit les environnements (alt)disclaimer et (alt)annex pour
%% enrichissements de la notice web (idem (alt)abstract).
%% 2007-07-12 : introduit \nobibliography pour avoir biblio trait{\'e}e
%% par tralics mais no imprim{\'e}e. 
%% Introduit l'environnement DefTralics avec fancyvrb.
%% 2007-03-26 : JEDP, options NoCountersInSection (compteurs pas
%% relatifs {\`a} la section), NoLatin1 (pour CG/mac...)
%% R{\'e}impl{\'e}ment{\'e} compl{\`e}tement sameaddress: robuste jusqu'{\`a} 4 auteurs !
%% introduit \lieusem et argument optionnel IssueInfo
%% introduit un compteur article, gestion des idarts avec Ax/p.1 et
%% l'argument optionnel pour SomLine. 
%% introduit AddToSom : rajoute quelque chose au sommaire imprim{\'e} du volume
%% placeins.sty charg{\'e} et FloatBarrier impos{\'e} avant la biblio
%% everyshi.sty charg{\'e} label TotalPages fournit le nombre de pages
%% d'un volume
%% introduit \cdr@tralics@com (indirection tralics)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Les choses commencent !
% generic utilities
\let\nobreakauthor~
\bgroup
 \catcode`\%=11
 \catcode`\{=11\catcode`\}=11
 \catcode`\[=1\catcode`\]=2
 \global\def\cdr@pc[%]
 \global\def\cdr@com[%\cdrsom@space\cdrsom@space]
 \global\def\cdr@lb[{]
 \global\def\cdr@rb[}]
 \gdef\cdrsom@space[ ]
 \gdef\cdrsom@tab[\cdrsom@space\cdrsom@space\cdrsom@space\cdrsom@space]
\egroup
%% journaux support{\'e}s
%% support pointrait SMF
\newif\ifsmf@skippt \smf@skipptfalse
\def\skippointrait{\global\smf@skippttrue}
\DeclareRobustCommand{\@pointrait}{%
   \unskip
   \ifnum\spacefactor>\@m \hskip1ex\hbox{---}\else
        {\upshape.\hskip 1ex\hbox{---}}\fi}
\DeclareRobustCommand{\MakePointrait}{%
    \ifsmf@skippt\global\smf@skipptfalse \else\nobreak\@pointrait\fi}
  \let\pointrait\MakePointrait
% Pretend to be amsart or not
\newif\ifcdr@iamamsart\cdr@iamamsartfalse
% abstract coupables ou non ?
\newif\if@abstractvbox\@abstractvboxtrue
\newif\ifCDRZeBib\CDRZeBibtrue
\newif\ifcdr@matht@@ls\cdr@matht@@lsfalse
\newif\ifcdr@cdrthmdefs\cdr@cdrthmdefstrue
\newif\ifcdr@eqcountersinsections\cdr@eqcountersinsectionstrue
\newif\ifcdr@flcountersinsections\cdr@flcountersinsectionstrue
\newif\ifcdr@onecountereverything\cdr@onecountereverythingfalse
\newif\ifcdr@subsectaspar\cdr@subsectasparfalse
\newif\ifcdr@countersinsections\cdr@countersinsectionsfalse
\newif\ifcdr@uppercaseheadtitles\cdr@uppercaseheadtitlestrue
\newif\ifcdr@uppercaseheadauthors\cdr@uppercaseheadauthorstrue
\newif\ifcdr@AIF\cdr@AIFfalse
\newif\ifcdr@JEP\cdr@JEPfalse
\newif\ifcdr@epreuves\cdr@epreuvesfalse
\newif\ifcdr@array\cdr@arrayfalse
\newif\ifcdr@couv\cdr@couvfalse
\newif\ifCDRxmlbib\CDRxmlbibtrue
\newif\ifcdr@chapters\cdr@chaptersfalse
\newif\ifcdr@sectioninchapters\cdr@sectioninchapterstrue
\DeclareOption{IAmAmsart}{\cdr@iamamsarttrue}
\DeclareOption{longabstracts}{\@abstractvboxfalse}
\DeclareOption{article}{\cdr@chaptersfalse}
\DeclareOption{chapters}{\cdr@chapterstrue}
\DeclareOption{RunningSectionInChapter}{\cdr@sectioninchaptersfalse}
\newif\ifcdr@attached\cdr@attachedfalse
\def\CDRpublished{false}
\newif\ifcdr@published\cdr@publishedfalse
\newif\ifcdr@publishTeX\cdr@publishTeXfalse
\def\CDRpublishTeX{false}
%% Options revues
\def\cdr@journalacro{JI}
\def\cdr@journalconfig{JI}
\newcommand{\setpublname}[2][Titre abr{\'e}g{\'e} absent]{%
\gdef\shortpublname{#1}\gdef\publname{#2}}
 \DeclareOption{AHL}{\def\cdr@journalconfig{AHL}%
   \setpublname[Annales Henri Lebesgue]{Annales Henri Lebesgue}%
   \let\iftagsleft@\iftrue \PassOptionsToPackage{leqno}{amsmath}%
   \PassOptionsToPackage{pagebackref}{hyperref}%
   \AtEndOfClass{\RequirePackage{pict2e}\def\cdr@includearticleafter{1}}%
   \cdr@uppercaseheadtitlesfalse\cdr@uppercaseheadauthorsfalse}
\DeclareOption{ALCO}{\def\cdr@journalconfig{ALCO}%
  \setpublname{Algebraic Combinatorics}
  \let\iftagsleft@\iftrue \PassOptionsToPackage{leqno}{amsmath}%
  \cdr@eqcountersinsectionsfalse
  \cdr@flcountersinsectionsfalse
  \global\let\ifcdr@cdrthmdefs\iftrue
  \global\cdr@frbabelfalse \global\cdr@matht@@lstrue
}
\DeclareOption{OGEO}{\def\cdr@journalconfig{OGEO}%
  \setpublname{Open Geomechanics}
  \let\iftagsleft@\iffalse \PassOptionsToPackage{reqno}{amsmath}%
  \cdr@eqcountersinsectionsfalse
  \cdr@flcountersinsectionsfalse
  \global\let\ifcdr@cdrthmdefs\iftrue
  \global\cdr@frbabelfalse \global\cdr@matht@@lstrue
   \cdr@iamamsarttrue
}
\DeclareOption{CML}{\def\cdr@journalconfig{CML}%
  \setpublname[Confluentes Math.]{Confluentes Mathematici}%
   \let\iftagsleft@\iftrue \cdr@uppercaseheadauthorsfalse
   \cdr@eqcountersinsectionstrue
   \PassOptionsToPackage{reqno}{amsmath}%
}
\DeclareOption{SLSEDP}{\def\cdr@journalconfig{SLSEDP}%
  \setpublname{S{\'e}minaire Laurent-Schwartz --- EDP et applications}%
  \cdr@arraytrue
  \let\iftagsleft@\iffalse \PassOptionsToPackage{reqno}{amsmath}}
\DeclareOption{PMB}{\def\cdr@journalconfig{PMB}%
  \setpublname{Publications math{\'e}matiques de Besan\c con}%
  \cdr@uppercaseheadtitlesfalse\cdr@uppercaseheadauthorsfalse
  \global\let\ifcdr@cdrthmdefs\iffalse  \global\let\ifcdr@eqcountersinsections\iffalse
  \global\let\ifcdr@flcountersinsections\iffalse
  \let\iftagsleft@\iftrue\PassOptionsToPackage{leqno}{amsmath}}
\DeclareOption{WBLN}{\def\cdr@journalconfig{WBLN}%
  \setpublname[Winter Braids Lecture Notes]{Winter Braids Lecture Notes}%
  \cdr@uppercaseheadtitlesfalse\cdr@uppercaseheadauthorsfalse
  \let\iftagsleft@\iftrue \PassOptionsToPackage{leqno}{amsmath}}
\DeclareOption{CCIRM}{\def\cdr@journalconfig{CCIRM}%
  \setpublname[Cours du C.I.R.M.]{Les cours du C.I.R.M.}%
  \cdr@uppercaseheadtitlesfalse\cdr@uppercaseheadauthorsfalse
  \let\iftagsleft@\iftrue \PassOptionsToPackage{leqno}{amsmath}}
\DeclareOption{ACIRM}{\def\cdr@journalconfig{ACIRM}%
  \setpublname[Actes du C.I.R.M.]{Actes des rencontres du C.I.R.M.}%
  \cdr@uppercaseheadtitlesfalse\cdr@uppercaseheadauthorsfalse
  \let\iftagsleft@\iftrue \PassOptionsToPackage{leqno}{amsmath}}
\DeclareOption{MSIA}{\def\cdr@journalconfig{MSIA}%
  \setpublname{MathematicS In Action}%
  \cdr@uppercaseheadtitlesfalse\cdr@uppercaseheadauthorsfalse
  \let\iftagsleft@\iffalse \PassOptionsToPackage{reqno}{amsmath}}
\DeclareOption{JCM}{\def\cdr@journalconfig{JCM}%
  \setpublname{SMAI Journal of Computational Mathematics}%
  \cdr@uppercaseheadtitlesfalse\cdr@uppercaseheadauthorsfalse
  \let\iftagsleft@\iffalse \PassOptionsToPackage{reqno}{amsmath}}
\DeclareOption{JEDP}{\def\cdr@journalconfig{JEDP}%
  \setpublname{Journ{\'e}es \emph{{\'E}quations aux d{\'e}riv{\'e}es partielles}}%
  \let\iftagsleft@\iffalse \PassOptionsToPackage{reqno}{amsmath}}
\DeclareOption{SEDP}{\def\cdr@journalconfig{SEDP}%
  \cdr@arraytrue
  \setpublname{S{\'e}minaire \emph{{\'E}quations aux d{\'e}riv{\'e}es partielles}}%
  \let\iftagsleft@\iffalse \PassOptionsToPackage{reqno}{amsmath}}
\DeclareOption{SMA}{\def\cdr@journalconfig{SMA}%
   \global\let\ifcdr@cdrthmdefs\iffalse 
   \setpublname[S{\'e}minaire Julia]{S{\'e}minaire de math{\'e}matiques} 
   \let\iftagsleft@\iftrue \PassOptionsToPackage{leqno}{amsmath}%
   \cdr@eqcountersinsectionstrue
   \cdr@flcountersinsectionstrue
 }
\DeclareOption{JEP}{\def\cdr@journalconfig{JEP}%
  \global\let\ifcdr@JEP\iftrue\global\let\ifcdr@cdrthmdefs\iffalse 
  \global\let\ifcdr@publishTeX\iftrue
  \setpublname{Journal de l'{\'E}cole polytechnique --- Math{\'e}matiques}%
  \let\iftagsleft@\iftrue \PassOptionsToPackage{leqno}{amsmath}%
  \cdr@eqcountersinsectionstrue
  \cdr@flcountersinsectionstrue
}
\DeclareOption{SEDP}{\def\cdr@journalconfig{SEDP}%
  \cdr@arraytrue
  \setpublname{S{\'e}minaire \emph{{\'E}quations aux d{\'e}riv{\'e}es partielles}}%
  \let\iftagsleft@\iffalse \PassOptionsToPackage{reqno}{amsmath}}
\DeclareOption{AMBP}{\def\cdr@journalconfig{AMBP}%
  \setpublname{Annales math{\'e}matiques Blaise Pascal}%
  \cdr@uppercaseheadtitlesfalse\cdr@uppercaseheadauthorsfalse
  \cdr@arraytrue
  \let\iftagsleft@\iffalse \PassOptionsToPackage{reqno}{amsmath}}
\DeclareOption{CG}{\def\cdr@journalconfig{CG}%
  \setpublname{Cahiers GUTenberg}%
  \cdr@arraytrue\cdr@uppercaseheadtitlesfalse\cdr@uppercaseheadauthorsfalse
  % on ne fait pas les biblios
  \global\let\ifCDRxmlbib\iffalse
  \let\iftagsleft@\iftrue \PassOptionsToPackage{leqno}{amsmath}}
\DeclareOption{CG0}{\def\cdr@journalconfig{CG0}%
  \setpublname{Cahiers GUTenberg}%
  \cdr@arraytrue\cdr@uppercaseheadtitlesfalse\cdr@uppercaseheadauthorsfalse
  % on ne fait pas les biblios
  \global\let\ifCDRxmlbib\iffalse
  \let\iftagsleft@\iftrue \PassOptionsToPackage{leqno}{amsmath}}
\DeclareOption{CG1}{\def\cdr@journalconfig{CG1}%
  \setpublname{Cahiers GUTenberg}%
  \cdr@arraytrue\cdr@uppercaseheadtitlesfalse\cdr@uppercaseheadauthorsfalse
  % on ne fait pas les biblios
  \global\let\ifCDRxmlbib\iffalse
  \let\iftagsleft@\iftrue \PassOptionsToPackage{leqno}{amsmath}}
\DeclareOption{CG2}{\def\cdr@journalconfig{CG2}%
  \setpublname{Cahiers GUTenberg}%
  \cdr@arraytrue\cdr@uppercaseheadtitlesfalse\cdr@uppercaseheadauthorsfalse
  % on ne fait pas les biblios
  \global\let\ifCDRxmlbib\iffalse
  \let\iftagsleft@\iftrue \PassOptionsToPackage{leqno}{amsmath}}
\DeclareOption{CG3}{\def\cdr@journalconfig{CG3}%
  \setpublname{Cahiers GUTenberg}%
  \cdr@arraytrue\cdr@uppercaseheadtitlesfalse\cdr@uppercaseheadauthorsfalse
  % on ne fait pas les biblios
  \global\let\ifCDRxmlbib\iffalse
  \let\iftagsleft@\iftrue \PassOptionsToPackage{leqno}{amsmath}}
\DeclareOption{TSG}{\def\cdr@journalconfig{TSG}%
  \setpublname[S{\'e}minaire de th{\'e}orie spectrale et g{\'e}om{\'e}trie\\ \textsc{Grenoble}]{S{\'e}minaire de th{\'e}orie spectrale et g{\'e}om{\'e}trie}%
  % \cdr@AIFtrue
  \let\iftagsleft@\iftrue 
  \cdr@uppercaseheadauthorstrue
  \cdr@eqcountersinsectionstrue
  \PassOptionsToPackage{leqno}{amsmath}%
}
\DeclareOption{AIF}{\def\cdr@journalconfig{AIF}%
  \setpublname[Ann. Inst. Fourier, Grenoble]{Annales de l'institut
    Fourier}%
  \cdr@AIFtrue
  \let\iftagsleft@\iftrue \cdr@uppercaseheadauthorsfalse
  \cdr@eqcountersinsectionstrue
  \PassOptionsToPackage{leqno}{amsmath}%
}
\DeclareOption{AST}{\def\cdr@journalconfig{AST}%
  \setpublname[Ast{\'e}risque]{Ast{\'e}risque}%
  \let\iftagsleft@\iftrue \PassOptionsToPackage{leqno}{amsmath}}

\DeclareOption{BSMF}{\def\cdr@journalconfig{BSMF}%
  \setpublname[Bull. Soc. math. France]{Bulletin de la soci{\'e}t{\'e}
    math{\'e}matique de France}%
  \let\iftagsleft@\iftrue \PassOptionsToPackage{leqno}{amsmath}}
\DeclareOption{MSMF}{\def\cdr@journalconfig{MSMF}%
  \setpublname[M{\'e}m. Soc. math. France]{M{\'e}moires de la soci{\'e}t{\'e}
    math{\'e}matique de France}%
  \let\iftagsleft@\iftrue \PassOptionsToPackage{leqno}{amsmath}}
\DeclareOption{AFST}{\def\cdr@journalconfig{AFST}%
  \setpublname[Ann. Fac. Sci. Toulouse Math]{Annales de la facult{\'e} des
    sciences de Toulouse}%
  \let\iftagsleft@\iffalse \PassOptionsToPackage{reqno}{amsmath}%
  \cdr@uppercaseheadtitlesfalse\cdr@uppercaseheadauthorsfalse}
\DeclareOption{JTNB}{\def\cdr@journalconfig{JTNB}%
  \setpublname[J. Th{\'e}or. Nombres Bordeaux]{Journal de Th{\'e}orie des Nombres de Bordeaux}%
  \let\iftagsleft@\iftrue \PassOptionsToPackage{leqno}{amsmath}%
  \cdr@uppercaseheadtitlesfalse\cdr@uppercaseheadauthorsfalse}
% 
%%  Options
\DeclareOption{Attached}{\cdr@attachedtrue}
\DeclareOption{published}{\cdr@publishedtrue\def\CDRpublished{true}}
\DeclareOption{publishTeX}{\cdr@publishTeXtrue\def\CDRpublishTeX{true}}
\DeclareOption{NopublishTeX}{\cdr@publishTeXfalse\def\CDRpublishTeX{false}}
\newif\if@francais\@francaisfalse
\DeclareOption{francais}{\@francaistrue}
\DeclareOption{anglais}{\@francaisfalse}
\DeclareOption{french}{\@francaistrue}
\DeclareOption{english}{\@francaisfalse}
\newif\ifcdr@tonelm\cdr@tonelmtrue
\newif\ifcdr@sommaire\cdr@sommairefalse
\newif\ifcdr@volume\cdr@volumefalse
\newif\ifcdr@special\cdr@specialfalse
\newif\ifcdr@HTML\cdr@HTMLfalse
\newif\ifcdr@pagedegarde\cdr@pagedegardefalse
\newif\ifcdr@tireapart\cdr@tireapartfalse
\newif\ifcdr@XML\cdr@XMLfalse
\newif\ifcdr@SOM\cdr@SOMtrue
%% Hyperref, graphicx et babel charg{\'e}s par d{\'e}faut
\newif\ifcdr@hyperref\cdr@hyperreftrue
\newif\ifcdr@graphicx\cdr@graphicxtrue
\newif\ifcdr@babel\cdr@babeltrue
\newif\ifcdr@frbabel\cdr@frbabeltrue
%% Options page de garde ou tir{\'e} {\`a} part exclusives
%% Page de garde (inutile : screen)
\DeclareOption{pagedegarde}{\cdr@pagedegardetrue\cdr@tireapartfalse}
%% Epreuves (charge JEP-epreuves.sty)
\DeclareOption{epreuves}{\cdr@epreuvestrue\cdr@pagedegardefalse}
%% Tir{\'e} {\`a} part
\DeclareOption{tireapart}{\cdr@pagedegardefalse\cdr@tireaparttrue\cdr@XMLfalse\cdr@SOMfalse}
%% G{\'e}n{\'e}ration XML avec tralics ?
\DeclareOption{XML}{\cdr@XMLtrue}
%% Si moteur de compilation pas pdflatex : pas vraiment finalis{\'e}
\DeclareOption{HTML}{\cdr@HTMLtrue\cdr@pagedegardefalse\cdr@SOMfalse}
%% Recup pour produire les m{\'e}tadonn{\'e}es et page de garde, mais z{\'e}ro
%% texte.
\newif\ifcdr@recup\cdr@recupfalse
\DeclareOption{Recup}{\global\cdr@recuptrue}
%% inutile
\DeclareOption{hyperref}{\cdr@hyperreftrue}
% screen = page de garde + hyperref + g{\'e}n{\'e}ration XML + sommaire
% option pour la production finale
\DeclareOption{screen}{\cdr@pagedegardetrue\cdr@XMLtrue\cdr@SOMtrue\cdr@hyperreftrue}
%% Article en libre acc{\`e}s ?
\newif\ifcdr@OA\cdr@OAfalse
\DeclareOption{OpenAccess}{\cdr@OAtrue}
% NoWriteXVIII : aucun write18 !
\newif\ifcdr@writexviii\cdr@writexviiitrue
\DeclareOption{NoWriteXVIII}{\cdr@SOMfalse\cdr@XMLfalse\cdr@writexviiifalse}
% print pas de page de garde, pas de g{\'e}n{\'e}ration ficher externe
\DeclareOption{print}{\cdr@SOMfalse\cdr@XMLfalse}
\DeclareOption{NoCountersInSection}{\global\let\ifcdr@countersinsections\iffalse}
%% pbs {\'e}ventuels de compatibilit{\'e}
\DeclareOption{NoGraphicx}{\cdr@graphicxfalse}
\DeclareOption{NoHyperref}{\cdr@hyperreffalse}
\DeclareOption{NoBabel}{\cdr@babelfalse}
\DeclareOption{NoBabelFrench}{\cdr@frbabelfalse}
\DeclareOption{MathTools}{\cdr@matht@@lstrue}
\DeclareOption{NoT1LM}{\cdr@tonelmfalse}
\newif\ifcdr@latinone\cdr@latinonetrue
\DeclareOption{NoLatin1}{\cdr@latinonefalse}
\newif\ifcdr@unicode\cdr@unicodefalse
\DeclareOption{Unicode}{\cdr@latinonefalse\cdr@unicodetrue}
\newif\ifcdr@newsom\cdr@newsomtrue
\DeclareOption{Sommaire}{\cdr@sommairetrue\cdr@hyperreffalse\cdr@SOMfalse\cdr@specialtrue\cdr@XMLtrue}
\DeclareOption{Volume}{\cdr@volumetrue\cdr@hyperreffalse\cdr@SOMfalse}
\DeclareOption{Couverture}{\cdr@couvtrue}
\newif\ifcdr@couvT\cdr@couvTfalse
\DeclareOption{CouvTires}{\cdr@couvTtrue}
\newif\ifcdr@redoBibtex\cdr@redoBibtexfalse
\DeclareOption{RedoBibTeX}{\cdr@redoBibtextrue}
\newif\ifcdr@redoIndex\cdr@redoIndexfalse
\DeclareOption{RedoIndex}{\cdr@redoIndextrue}
\DeclareOption{Special}{\cdr@specialtrue}
\DeclareOption{SOM}{\cdr@SOMtrue}
\DeclareOption{NoSOM}{\cdr@SOMfalse}%
\DeclareOption{NoNewSOM}{\cdr@newsomfalse}%
\DeclareOption{NoXMLbib}{\CDRxmlbibfalse}
\DeclareOption{NoSaveZebib}{\CDRZeBibfalse}%
\DeclareOption{NoThmDefs}{\cdr@cdrthmdefsfalse}
\DeclareOption{ThmDefs}{\cdr@cdrthmdefstrue}
%
\global\expandafter\let\csname ver@amsthm.sty\expandafter\endcsname
  \csname ver@\@currname.\@currext\endcsname
\let\@xp=\expandafter
\let\@nx=\noexpand
\def\@oparg#1[#2]{\@ifnextchar[{#1}{#1[#2]}}
\long\def\@ifempty#1{\@xifempty#1@@..\@nil}
\long\def\@xifempty#1#2@#3#4#5\@nil{%
  \ifx#3#4\@xp\@firstoftwo\else\@xp\@secondoftwo\fi}
\long\def\@ifnotempty#1{\@ifempty{#1}{}}
\def\setboxz@h{\setbox\z@\hbox}
\def\@addpunct#1{%
  \relax\ifhmode
    \ifnum\spacefactor>\@m \else#1\fi
  \fi}
\def\nopunct{\spacefactor 1007 }
\def\frenchspacing{\sfcode`\.1006\sfcode`\?1005\sfcode`\!1004%
  \sfcode`\:1003\sfcode`\;1002\sfcode`\,1001 }
\def\@tempa#1#2\@nil{\edef\@classname{#1}}
\expandafter\@tempa\@currnamestack{}{}{}\@nil
\ifx\@classname\@empty \edef\@classname{\@currname}\fi
\def\@True{00}
\def\@False{01}
\newcommand\newswitch[2][False]{%
  \expandafter\@ifdefinable\csname ?@#2\endcsname{%
    \global\expandafter\let\csname ?@#2\expandafter\endcsname
      \csname @#1\endcsname
  }%
}
\newcommand{\setFalse}[1]{%
  \expandafter\let\csname ?@#1\endcsname\@False
}
\newcommand{\setTrue}[1]{%
  \expandafter\let\csname ?@#1\endcsname\@True
}
\newswitch{}
\DeclareRobustCommand{\except}[1]{%
  \if\csname ?@#1\endcsname \expandafter\@gobble
  \else \expandafter\@firstofone
  \fi
}
\DeclareRobustCommand{\for}[1]{%
  \if\csname ?@#1\endcsname \expandafter\@firstofone
  \else \expandafter\@gobble
  \fi
}
\DeclareRobustCommand{\forany}[1]{%
  \csname for@any@01\endcsname#1,?,\@nil
}
\@namedef{for@any@\@False}#1,{%
  \csname for@any@%
    \csname ?@\zap@space#1 \@empty\endcsname
  \endcsname
}
\@namedef{?@?}{x}
\@namedef{for@any@\@True}#1\@nil#2{#2}
\def\for@any@x{\@car\@gobble}
\DeclareOption{a4paper}{\paperheight 297mm\paperwidth 210mm
  \textheight 54.5pc }
\DeclareOption{letterpaper}{\paperheight 11in\paperwidth 8.5in }
\DeclareOption{landscape}{\@tempdima\paperheight
  \paperheight\paperwidth \paperwidth\@tempdima}
\DeclareOption{portrait}{}
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\overfullrule5\p@
  \ClassWarningNoLine{\@classname}{%
    When the draft option is used, the
      \protect\includegraphics\MessageBreak
    command will print blank placeholder boxes\MessageBreak
    for the graphics}%
}
\DeclareOption{final}{\overfullrule\z@ }
\def\dateposted#1{\def\@dateposted{#1}}%
\let\@dateposted\@empty
\def\@setdateposted{%
  \newline Article electronically published on \@dateposted}
\let\OpenAccess\cdr@OAtrue
%% Pas de logo pour certains articles sp{\'e}ciaux
\def\NoLogo{\xdef\article@logo{}}
\def\article@logo{%
  \set@logo{%
    \publname
    \ifx\@empty\currentvolume
    \else \newline\volinfo, \pageinfo
    \fi
    \newline \@PII
    \ifx\@empty\@dateposted \else \@setdateposted\fi
  }%
}
\def\dateexpose#1{\def\@dateexpose{#1}}%
\let\@dateexpose\@empty
\def\numexpo#1{\def\cdr@numexpose{#1}}%
\let\cdr@numexpose\@empty
\def\daterecieved#1{\def\@datereceived{#1}}%
\def\datereceived#1{\def\@datereceived{#1}}%
\let\@datereceived\@empty
\def\daterevised#1{\def\@daterevised{#1}}%
\let\@daterevised\@empty
\def\dateaccepted#1{\def\@dateaccepted{#1}}%
\let\@dateaccepted\@empty
\def\eonly@logo{%
  \set@logo{%
    \publname
    \newline\volinfo, \pageinfo
    \ifx\@empty\@dateposted \else \@setdateposted\fi
    \newline \@PII
  }%
}
\newdimen\logoheight\logoheight0pt
\def\@logofont{\fontsize{6}{7\p@}\selectfont}
\long\def\set@logo#1{%
  \vbox to\headheight{%
    \vskip\logoheight
    \@parboxrestore \@logofont
    \noindent#1\par\vss
  }%
}
\DeclareOption{e-only}{%
  \def\volinfo{Volume \currentvolume}%
  \dateposted{Xxxx XX, XXXX}%
  \def\@setdateposted{\ (\@dateposted)}%
  \AtBeginDocument{\let\article@logo\eonly@logo}%
}
\newif\if@titlepage
\DeclareOption{titlepage}{\@titlepagetrue}
\DeclareOption{notitlepage}{\@titlepagefalse}
\DeclareOption{onecolumn}{\@twocolumnfalse}
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{nomath}{}
\DeclareOption{noamsfonts}{}
\DeclareOption{psamsfonts}{%
%  \PassOptionsToPackage{psamsfonts}{amsfonts}%
  \PassOptionsToPackage{cmex10}{amsmath}}
\newif\iftagsleft@
\DeclareOption{leqno}{%
  \tagsleft@true \PassOptionsToPackage{leqno}{amsmath}}
\DeclareOption{reqno}{%
  \tagsleft@false \PassOptionsToPackage{reqno}{amsmath}}
\newif\ifctagsplit@
\DeclareOption{centertags}{%
  \ctagsplit@true \PassOptionsToPackage{centertags}{amsmath}}
\DeclareOption{tbtags}{%
  \ctagsplit@false \PassOptionsToPackage{tbtags}{amsmath}}
\DeclareOption{fleqn}{}%
\newcommand{\@mainsize}{10}
\newcommand{\@ptsize}{0}
\newcommand{\larger}[1][1]{%
  \count@\@currsizeindex \advance\count@#1\relax
  \ifnum\count@<\z@ \count@\z@ \else\ifnum\count@>12 \count@12 \fi\fi
  \ifcase\count@
    \Tiny\or\Tiny\or\tiny\or\SMALL\or\Small\or\small
    \or\normalsize
    \or\large\or\Large\or\LARGE\or\huge\or\Huge\else\Huge
  \fi
}
\newcommand{\smaller}[1][1]{\larger[-#1]}
\def\@adjustvertspacing{%
  \bigskipamount.7\baselineskip plus.7\baselineskip
  \medskipamount\bigskipamount \divide\medskipamount\tw@
  \smallskipamount\medskipamount \divide\smallskipamount\tw@
  \abovedisplayskip\medskipamount
  \belowdisplayskip \abovedisplayskip
  \abovedisplayshortskip\abovedisplayskip
  \advance\abovedisplayshortskip-1\abovedisplayskip
  \belowdisplayshortskip\abovedisplayshortskip
  \advance\belowdisplayshortskip 1\smallskipamount
  \jot\baselineskip \divide\jot 4 \relax
}
%
\renewcommand\normalsize{\@xsetfontsize\normalsize 6%
  \@adjustvertspacing \let\@listi\@listI}
\DeclareRobustCommand{\Tiny}{\@xsetfontsize\Tiny 1}
\DeclareRobustCommand{\tiny}{\@xsetfontsize\tiny 2}
\DeclareRobustCommand{\SMALL}{\@xsetfontsize\SMALL 3}
\DeclareRobustCommand{\Small}{\@xsetfontsize\Small 4%
  \@adjustvertspacing
  \def\@listi{\topsep\smallskipamount \parsep\z@skip \itemsep\z@skip
    \leftmargin=\leftmargini
    \labelwidth=\leftmargini \advance\labelwidth-\labelsep
  }%
}
\DeclareRobustCommand{\small}{\@xsetfontsize\small 5\@adjustvertspacing}
\def\footnotesize{\Small}
\def\scriptsize{\SMALL}
\DeclareRobustCommand{\large}{\@xsetfontsize\large 7\@adjustvertspacing}
\DeclareRobustCommand{\Large}{\@xsetfontsize\Large 8\@adjustvertspacing}
\DeclareRobustCommand{\LARGE}{\@xsetfontsize\LARGE 9}
\DeclareRobustCommand{\huge}{\@xsetfontsize\huge{10}}
\DeclareRobustCommand{\Huge}{\@xsetfontsize\Huge{11}}
\def\@xsetfontsize#1#2{%
  \chardef\@currsizeindex#2\relax
  \edef\@tempa{\@nx\@setfontsize\@nx#1%
    \@xp\ifcase\@xp\@currsizeindex\@typesizes
      \else{99}{99}\fi}%
  \@tempa
}
\chardef\@currsizeindex=6
%%% Param{\`e}tres de mise en page
\widowpenalty=10000
\clubpenalty=10000
\brokenpenalty=10000
\newdimen\linespacing
\lineskip=1pt \lineskiplimit=1pt
\normallineskip=1pt \normallineskiplimit=1pt
\let\baselinestretch=\@empty
\headheight=8pt \headsep=14pt
\footskip=12pt
\textheight=50.5pc \topskip=10pt
\textwidth=30pc
\columnsep=10pt \columnseprule=0pt
\marginparwidth=90pt
\marginparsep=11pt
\marginparpush=5pt
\AtBeginDocument{\settoheight{\footnotesep}{\footnotesize M$^1$}}
\skip\footins=7pt plus11pt
\skip\@mpfootins=\skip\footins
\fboxsep=3pt \fboxrule=.4pt
\arrayrulewidth=.4pt    \doublerulesep=2pt
\labelsep=5pt           \arraycolsep=\labelsep
\tabcolsep=\labelsep    \tabbingsep=\labelsep
\floatsep=15pt plus 12pt    \dblfloatsep=15pt plus 12pt
\textfloatsep=\floatsep  \dbltextfloatsep=15pt plus 12pt
\intextsep=\floatsep
\@fptop=0pt plus1fil     \@dblfptop=0pt plus1fil
\@fpbot=0pt plus1fil     \@dblfpbot=0pt plus1fil
\@fpsep=8pt plus2fil     \@dblfpsep=8pt plus2fil\relax
\parskip=0pt \relax
\newdimen\normalparindent
\normalparindent=12pt
\parindent=\normalparindent
\partopsep=0pt \relax \parsep=0pt \relax \itemsep=0pt \relax
\@lowpenalty=51         \@medpenalty=151        \@highpenalty=301
\@beginparpenalty=-\@lowpenalty
\@endparpenalty=-\@lowpenalty
\@itempenalty=-\@lowpenalty
%%% Options de tailles des caract{\`e}res
\DeclareOption{10pt}{\def\@mainsize{10}\def\@ptsize{0}%
  \def\@typesizes{%
    \or{5}{6}\or{6}{7}\or{7}{8}\or{8}{10}\or{9}{11}%
    \or{10}{12}% normalsize
    \or{\@xipt}{13}\or{\@xiipt}{14}\or{\@xivpt}{17}%
    \or{\@xviipt}{20}\or{\@xxpt}{24}}%
  \normalsize \linespacing=\baselineskip
}
\DeclareOption{11pt}{\def\@mainsize{11}\def\@ptsize{1}%
  \def\@typesizes{%
    \or{6}{7}\or{7}{8}\or{8}{10}\or{9}{11}\or{10}{12}%
    \or{\@xipt}{13}% normalsize
    \or{\@xiipt}{14}\or{\@xivpt}{17}\or{\@xviipt}{20}%
    \or{\@xxpt}{24}\or{\@xxvpt}{30}}%
  \normalsize \linespacing=\baselineskip
}
\DeclareOption{12pt}{\def\@mainsize{12}\def\@ptsize{2}%
  \def\@typesizes{%
    \or{7}{8}\or{8}{10}\or{9}{11}\or{10}{12}\or{\@xipt}{13}%
    \or{\@xiipt}{14}% normalsize
    \or{\@xivpt}{17}\or{\@xviipt}{20}\or{\@xxpt}{24}%
    \or{\@xxvpt}{30}\or{\@xxvpt}{30}}%
  \normalsize \linespacing=\baselineskip
}
\DeclareOption{8pt}{\def\@mainsize{8}\def\@ptsize{8}%
  \def\@typesizes{%
    \or{5}{6}\or{5}{6}\or{5}{6}\or{6}{7}\or{7}{8}%
    \or{8}{10}% normalsize
    \or{9}{11}\or{10}{12}\or{\@xipt}{13}%
    \or{\@xiipt}{14}\or{\@xivpt}{17}}%
  \normalsize \linespacing=\baselineskip
}
\DeclareOption{9pt}{\def\@mainsize{9}\def\@ptsize{9}%
  \def\@typesizes{%
    \or{5}{6}\or{5}{6}\or{6}{7}\or{7}{8}\or{8}{10}%
    \or{9}{11}% normalsize
    \or{10}{12}\or{\@xipt}{13}\or{\@xiipt}{14}%
    \or{\@xivpt}{17}\or{\@xviipt}{20}}%
  \normalsize \linespacing=\baselineskip
}
%%% Page styles
\def\ps@empty{\let\@mkboth\@gobbletwo
  \let\@oddhead\@empty \let\@evenhead\@empty
  \let\@oddfoot\@empty \let\@evenfoot\@empty
  \global\topskip\normaltopskip}
\def\ps@plain{\ps@empty
  \def\@oddfoot{\normalfont\scriptsize \hfil\thepage\hfil}%
  \let\@evenfoot\@oddfoot}
\newswitch{runhead}
\def\ps@headings{\ps@empty
  \def\@evenhead{%
    \setTrue{runhead}%
    \normalfont\scriptsize
    \rlap{\thepage}\hfil
    \def\thanks{\protect\thanks@warning}%
    \leftmark{}{}\hfil}%
  \def\@oddhead{%
    \setTrue{runhead}%
    \normalfont\scriptsize \hfil
    \def\thanks{\protect\thanks@warning}%
    \rightmark{}{}\hfil \llap{\thepage}}%
  \let\@mkboth\cdr@markboth
}
\let\sectionname\@empty
\let\subsectionname\@empty
\let\subsubsectionname\@empty
\let\paragraphname\@empty
\let\subparagraphname\@empty
\def\leftmark{\expandafter\@firstoftwo\topmark{}{}}
\def\rightmark{\expandafter\@secondoftwo\botmark{}{}}
\def\ps@firstpage{\ps@plain
  \def\@oddfoot{\normalfont\scriptsize \hfil\thepage\hfil
     \global\topskip\normaltopskip}%
  \let\@evenfoot\@oddfoot
  \def\@oddhead{\@serieslogo\hss}%
  \let\@evenhead\@oddhead % in case an article starts on a left-hand page
}
\long\def\@nilgobble#1\@nil{}
\def\cdr@markboth#1#2{%
  \begingroup
    \@temptokena{{#1}{#2}}\xdef\@themark{\the\@temptokena}%
    \mark{\the\@temptokena}%
  \endgroup
  \if@nobreak\ifvmode\nobreak\fi\fi}
\def\ps@myheadings{\ps@headings \let\@mkboth\@gobbletwo}
\newskip\normaltopskip
\normaltopskip=10pt \relax
\let\sectionmark\@gobble
\let\subsectionmark\@gobble
\let\subsubsectionmark\@gobble
\let\paragraphmark\@gobble
%
\DeclareOption{makeidx}{}
\DeclareOption{NoEqCountersInSection}{\global\let\ifcdr@eqcountersinsections\iffalse}
\DeclareOption{NoFloatCountersInSection}{\global\let\ifcdr@flcountersinsections\iffalse}
\DeclareOption{OneCounterForEverything}{\global\let\ifcdr@onecountereverything\iftrue}
\DeclareOption{SubsectAsParagraph}{\global\let\ifcdr@subsectaspar\iftrue}
\DeclareOption{AmsartStyle}{\global\let\ifcdr@eqcountersinsections\iffalse\global\let\ifcdr@flcountersinsections\iffalse\global\let\ifcdr@onecountereverything\iftrue\global\let\ifcdr@subsectaspar\iftrue}
%% Pour charger les options de revues non encore list{\'e}es ci-dessous
\ifx\cdr@journalacro\cdr@journalconfig
\DeclareOption*{\IfFileExists{cedram-\CurrentOption.clo}{%
\let\cdr@journalconfig\CurrentOption}{%
\ClassWarning{Cedram}{Specified option or subpackage
"\CurrentOption" not found}\OptionNotUsed}}\fi
\ExecuteOptions{centertags,a4paper,portrait,%
  10pt,twoside,onecolumn,final}
\ProcessOptions\relax
\ifcdr@iamamsart
 \@xp\xdef\csname ver@amsart.cls\endcsname{}%
\fi
%% faisons un peu de m{\'e}nage en fonction du syst{\`e}me utilis{\'e}...
%% et chargeons au passage etex, vu que nous ne sommes pas tr{\`e}s {\'e}conomes...
\RequirePackage{etex,ifplatform}
\ifshellescape\message{*** Write 18 actif ***^^J}%
\gdef\immediatelywrite@shell#1{\immediate\write18{#1}}\else
\global\cdr@writexviiifalse
\message{*** Write 18 inactif ***^^J}%
\gdef\immediatelywrite@shell#1{\message{*** write18 non exec : ``#1''  ***^^J}}\fi
\newif\ifcdr@hascedrics\cdr@hascedricsfalse
\newif\ifcdr@miktex\cdr@miktexfalse
\def\HASCEDRICS{no}
\def\cdr@YES{yes}
\def\cdr@config{\global\cdr@hascedricsfalse}
%% pdflatex+shell selon web2c : par d{\'e}faut
\ifcdr@published
\def\pdflatex@shell@option{pdflatex -shell-escape -draftmode
  -interaction=nonstopmode -recorder }
\ifx\pdfmatch\undefined\else
 \ifnum\pdfmatch{MiKTeX}{\pdftexbanner}>0\message{***** MikTeX !  ***^^J}%
  \global\cdr@miktextrue
%% A regarder plus tard...
 \ifcdr@unicode
   \AtBeginDocument{\immediate\write18{chcp 65001}}%
 \else
   \AtBeginDocument{\immediate\write18{chcp 1252}}%
 \fi
  \gdef\pdflatex@shell@option{pdflatex --enable-write18 -draftmode
   -recorder  -interaction=nonstopmode }%
\fi
\fi
\else
\def\pdflatex@shell@option{pdflatex -shell-escape
  -interaction=nonstopmode -recorder }
\ifx\pdfmatch\undefined\else
 \ifnum\pdfmatch{MiKTeX}{\pdftexbanner}>0\message{***** MikTeX !  ***^^J}%
  \global\cdr@miktextrue
 \ifcdr@unicode
   \AtBeginDocument{\immediate\write18{chcp 65001}}%
 \else
   \AtBeginDocument{\immediate\write18{chcp 1252}}%
 \fi
  \gdef\pdflatex@shell@option{pdflatex --enable-write18
   -recorder  -interaction=nonstopmode }%
 \fi
\fi
\fi
\ifwindows
%% en fait ifplatform distingue les shell et non les plateformes...
\edef\cdr@lq{}\edef\cdr@rq{}%
\immediatelywrite@shell{if defined  HASCEDRICS (echo  \string\gdef\string\HASCEDRICS
  {\cdr@pc HASCEDRICS\cdr@pc}\string\endinput  >  has_cedrics.aux)  else (echo   \string\gdef\string\HASCEDRICS
  {no}\string\endinput  >  has_cedrics.aux)}%
% \immediatelywrite@shell{echo \string\gdef\string\HASCEDRICS
%   {\cdr@pc HASCEDRICS\cdr@pc}\string\endinput  >  has_cedrics.aux}%
\def\cdr@touch{echo.  > }%
\else
\edef\cdr@lq{'}\edef\cdr@rq{'}%
\immediatelywrite@shell{echo
  '\string\gdef\string\HASCEDRICS{'$HASCEDRICS'}\string\endinput'  >
  has_cedrics.aux}%
\def\cdr@touch{touch }%
\fi
\InputIfFileExists{has_cedrics.aux}%
% %% le fichier existe
{\gdef\cdr@config{%\global\cdr@writexviiitrue
    \ifx\HASCEDRICS\cdr@YES
    \message{*** Has Cedrics : \cdr@YES\space !! ***}%
    \global\cdr@hascedricstrue\else
    \message{*** Has Cedrics : No !! ***}%
    \global\cdr@XMLfalse\fi
    }}
% %% le fichier n'est pas {\'e}crit : soit pas de write 18, soit pas de droits d'{\'e}criture
 {\gdef\cdr@config{\global\cdr@writexviiifalse\global\cdr@XMLfalse}}%
\cdr@config
\ifcdr@XML\message{*** XML activ{\'e} ***}\else
\message{*** XML d{\'e}sactiv{\'e} ***}\fi
\immediatelywrite@shell{\ifwindows del \else rm -f -- \fi has_cedrics.aux}
\ifcdr@matht@@ls
\RequirePackage{mathtools}
\fi
%% PDF Minor version 6
\ifx\pdfminorversion\undefined\else
 \pdfminorversion6\relax
\fi
%% Babel -- option francais de la classe
\let\@abstractlanguage\relax
\let\@altabstractlanguage\relax
\def\thsp{}%
\if@francais
\def\thsp{\,}%
\ifcdr@babel 
\ifcdr@writexviii
\immediatelywrite@shell{\cdr@touch frenchb.cfg}\fi
\RequirePackage[english,french]{babel}
\AtBeginDocument{\frozen@everymath{\check@mathfonts
  \shorthandoff{;:!?}\the\everymath}%
\frozen@everydisplay{\check@mathfonts
  \shorthandoff{;:!?}\the\everydisplay}}
\def\@altabstractlanguage{\foreign@language{english}}%
\AtBeginDocument{\selectlanguage{french}%
  \def\figurename{Figure}%
  \def\tablename{Table}%
}%
\fi
  \def\cdr@language{french}%
  \def\cdr@altlanguage{english}%
  \def\cdr@language@short{fr}%
  \def\cdr@altlanguage@short{en}%
\else
\ifcdr@babel
 \ifcdr@frbabel
  \RequirePackage[french,english]{babel}
\AtBeginDocument{\frozen@everymath{\check@mathfonts
  \shorthandoff{;:!?}\the\everymath}%
\frozen@everydisplay{\check@mathfonts
  \shorthandoff{;:!?}\the\everydisplay}}
 \else
  \RequirePackage[english]{babel}
 \fi
\def\@altabstractlanguage{\foreign@language{french}}%
\fi
  \def\cdr@language{english}%
  \def\cdr@altlanguage{french}%
  \def\cdr@language@short{en}%
  \def\cdr@altlanguage@short{fr}%
\fi
\ifcdr@babel\ifcdr@frbabel
 \frenchsetup{StandardLayout=true}%
\fi\fi
\if@compatibility
  \def\@tempa{\RequirePackage{amstex}\relax}%
\else
  \@ifclasswith{\@classname}{nomath}{%
    \let\@tempa\relax
  }{%
    \def\@tempa{\RequirePackage{amsmath}\relax}%
  }%
\fi
%% Bien utile -- peut-{\^e}tre pas l'imposer {\`a} tout le monde {\`a} cause des
%% auteurs AMBP ?
\ifcdr@array
\RequirePackage{array}%
\fi
\@tempa % load amstex.sty or amsmath.sty
\@ifundefined{numberwithin}{%
  \newcommand{\numberwithin}[3][\arabic]{%
    \@ifundefined{c@#2}{\@nocounterr{#2}}{%
      \@ifundefined{c@#3}{\@nocnterr{#3}}{%
        \@addtoreset{#2}{#3}%
        \@xp\xdef\csname the#2\endcsname{%
          \@xp\@nx\csname the#3\endcsname .\@nx#1{#2}}}}%
  }
  \csname newtoks\endcsname\@emptytoks
}{}
\if@compatibility
\else
  \@ifclasswith{\@classname}{noamsfonts}{%
    % amsfonts package is not wanted
  }{%
    % amsfonts package IS wanted; test whether a recent enough version
    % seems to be installed
    \begingroup \fontencoding{U}\fontfamily{msa}\try@load@fontshape\endgroup
    \global\@xp\let\csname U+msa\endcsname\relax % reset
    \@ifundefined{U/msa/m/n}{%
      \ClassError{\@classname}{%
  Package `amsfonts' not installed, or version too old?\MessageBreak
  Unable to get font info for the `msam' fonts in the expected form%
      }{%
  The amsfonts package will not be loaded, to avoid probable\MessageBreak
  incompatibility problems. You can (a) use the `noamsfonts'
      documentclass\MessageBreak
  option next time, or (b) check that the amsfonts package is
      installed\MessageBreak
  correctly, and is not too old to be compatible.%
      }%
    }{%
      \RequirePackage{amsfonts}[1995/01/01]\relax
    }%
  }
\fi % end yesamsfonts branch
\let\cleardouble@page\cleardoublepage
\AtBeginDocument{%
  \ifx\cleardouble@page\cleardoublepage
    \def\cleardoublepage{\clearpage{\pagestyle{empty}\cleardouble@page}}
  \fi
}
\newcommand{\uppercasenonmath}[1]{\toks@\@emptytoks
  \@xp\@skipmath\@xp\@empty#1$$%
  \edef#1{{\@nx\protect\@nx\@upprep\the\toks@}}%
}
\newcommand{\@upprep}{%
  \spaceskip1.3\fontdimen2\font plus1.3\fontdimen3\font
  \upchars@}
\newcommand{\upchars@}{%
  \def\ss{SS}\def\i{I}\def\j{J}\def\ae{\AE}\def\oe{\OE}%
  \def\o{\O}\def\aa{\AA}\def\l{\L}\def\Mc{M{\scshape c}}}
\providecommand{\Mc}{Mc}
\newcommand{\@skipmath}{}
\long\def\@skipmath#1$#2${%
  \@xskipmath#1\(\)%
  \@ifnotempty{#2}{\toks@\@xp{\the\toks@$#2$}\@skipmath\@empty}}%
\newcommand{\@xskipmath}{}
\long\def\@xskipmath#1\(#2\){%
  \uppercase{\toks@\@xp\@xp\@xp{\@xp\the\@xp\toks@#1}}%
  \@ifnotempty{#2}{\toks@\@xp{\the\toks@\(#2\)}\@xskipmath\@empty}}%
\def\altucnm#1{%
  \MakeTextUppercase{\toks@{#1}}%
  \edef#1{\the\toks@}%
}
\AtBeginDocument{%
  \@ifundefined{MakeTextUppercase}{}{\let\uppercasenonmath\altucnm}%
}
\@ifundefined{MakeUppercase}{\let\MakeUppercase\uppercase}{}%
\newcommand{\today}{%
  \relax\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
%%\if@compatibility
%%\else
%%  \def\@obsolete@fontswitch#1#2#3{%
%%    \@latex@warning@no@line{%
%%      Command {\string#1...}\on@line\space is obsolete;\MessageBreak
%%      the LaTeX2e equivalent is \string#3{...}}%
%%    \gdef#1{\@fontswitch\relax#3}%
%%  }
%%  \DeclareRobustCommand*\cal{%
%%    \@xp\@obsolete@fontswitch\csname cal \endcsname\relax\mathcal}
%%  \DeclareRobustCommand*\mit{%
%%    \@xp\@obsolete@fontswitch\csname mit \endcsname\relax\mathnormal}
%%\fi
%%% M{\'e}tadonn{\'e}es
% titre du journal 
\def\currentjournaltitle{JOURNAL INCONNU}
% entit{\'e} {\'e}ditrice du journal 
\def\currentjournalpublisher{\currentjournaltitle}
% titre abr{\'e}g{\'e} du journal
\def\currentjournalshorttitle{Jour. I.}
% acronyme
\def\ISBN#1{\def\@isbn{#1}}
\def\ISSN#1{\def\@issn{#1}}
\def\eISSN#1{\def\@Eissn{#1}}
\let\@isbn\@empty
\let\@issn\@empty
\let\@Eissn\@empty
\def\DOI#1{\def\CDRdoi{#1}}
\let\CDRdoi\@empty
% s{\'e}rie
\let\currentseries\@empty
% ann{\'e}e : \currentyear
% tome : \currentvolume
% fascicule : \currentissue
% premi{\`e}re page : \start@page
% derni{\`e}re page (commande fragile, autre strat{\'e}gie possible en fin de doc...)
%\protected@edef\cdr@end@page{\pageref{TheLastPage}}
\AtBeginDocument{%
  \@ifundefined{r@TheLastPage}{%
    \@xp\gdef\csname r@TheLastPage\endcsname{00}}{}%
  \let\cdr@end@page\r@TheLastPage
  \ifcdr@couv
    \@ifundefined{r@TotalPages}{%
    \@xp\gdef\csname r@TotalPages\endcsname{100}}{}%
  \let\cdr@total@pages\r@TotalPages
  \fi
}%
%
% Pour la page de garde
\def\CDRserviceName{CEDRAM}
\def\CDRcopyright{\textcopyright\ \currentjournalpublisher}
\def\CDRdomain{cedram.org/}
\edef\CDRbaseURL{http://www.\CDRdomain}
\def\CDRjournalURL#1{\xdef\journalURL{http://#1.\CDRdomain}}
\def\CDRlegalURL{\journalURL legal/}
%% info utile ?
\def\cdr@legaldeposit{{\color{red}{date non renseign{\'e}e}}}
\def\legaldeposit#1{\gdef\cdr@legaldeposit{#1}}
\def\cdr@dateprinted{{\color{red}{date non renseign{\'e}e}}}
\def\dateprinted#1{\gdef\cdr@dateprinted{#1}}
% identifiants
\ifcdr@volume\else
\def\CDRidart{\cdr@journalacro_\currentyear_\currentseries_\currentvolume_\currentissue_\Cdr@start@page@idart_0}
\fi
\def\CDRidvol{\cdr@journalacro_\currentyear_\currentseries_\currentvolume_\currentissue}
% relations pour errata, etc.
\let\@Relation\@empty
\newcommand\Relation[2][corrige]{\gdef\@Relation{#2}\gdef\@Relation@type{#1}}
% fichier bib = @@bibfile
\let\cdr@bibliography\bibliography
\let\@@bibfile\@empty
%\ifcdr@recup
%\def\bibliography#1{\def\@@bibfile{#1}\nocite{*}\cdr@bibliography{#1}}
%\else
\def\bibliography#1{\xdef\@@bibfile{#1}\cdr@bibliography{#1}}
\def\nobibliography#1{\xdef\@@bibfile{#1}}%\cdr@bibliography{#1}}
%\fi
%
\let\@abstract@english\@empty
\let\@abstract@french\@empty
\let\@title@english\@empty
\let\@title@french\@empty
\let\@alttitle\@empty
\let\@subtitle\@empty
\let\@altsubtitle\@empty
\let\@subtitle@english\@empty
\let\@subtitle@french\@empty
\let\CDRidinterne\@empty
\newcommand\IdInterne[1]{\gdef\CDRidinterne{#1}}
%% test \renewcommand*{\title}[2][]{\gdef\shorttitle{#1}\gdef\@title{#2}%
\renewcommand*{\title}[2][]{\gdef\shorttitle{#1}\protected@xdef\@title{#2}%
\if@francais
\protected@xdef\@title@french{#2}\else
\protected@xdef\@title@english{#2}\fi}
\edef\title{\@nx\@dblarg
  \@xp\@nx\csname\string\title\endcsname}
\let\@afterauthor\@empty
%% test \newcommand*{\alttitle}[1]{\protected@xdef\@alttitle{#1}%
\newcommand*{\alttitle}[1]{\protected@xdef\@alttitle{#1}%
\if@francais
\protected@xdef\@title@english{#1}\else
\protected@xdef\@title@french{#1}\fi}
\newcommand*{\subtitle}[1]{\protected@xdef\@subtitle{#1}%
\if@francais
\protected@xdef\@subtitle@french{#1}\else
\protected@xdef\@subtitle@english{#1}\fi}
\newcommand*{\altsubtitle}[1]{\protected@xdef\@altsubtitle{#1}%
\if@francais
\protected@xdef\@subtitle@english{#1}\else
\protected@xdef\@subtitle@french{#1}\fi}
\newcommand*{\afterauthor}[1]{\protected@xdef\@afterauthor{#1}}%
\def\initial#1{#1}
\def\lastname#1{#1}
\def\firstname#1{#1}
\def\middlename#1{#1}
\def\vonname#1{#1}
\def\junior#1{#1}
\def\JR{Jr}
%
\newif\ifcdr@printnames\cdr@printnamestrue
\def\printnonames{\cdr@printnamesfalse}
%% plusieurs auteurs pour une seule adresse :
%% On laisse xmladdresses idem, mais on r{\'e}organise ce qui atterrit
%% dans addresses...
\newcounter{sameaddress}
\newif\if@sameaddress\@sameaddressfalse
%% Support pour 4 groupes, ce qui est d{\'e}j{\`a} beaucoup !
\let\@sameaddressi\@empty
\let\@sameauthorsi\@empty
\let\@sameaddressii\@empty
\let\@sameauthorsii\@empty
\let\@sameaddressiii\@empty
\let\@sameauthorsiii\@empty
\let\@sameaddressiv\@empty
\let\@sameauthorsiv\@empty
\def\sameaddress{%
% initialisations
\stepcounter{sameaddress}%
\ifcase\value{sameaddress}\or
\global\let\endsameaddress\endsameaddressi\or
\global\let\endsameaddress\endsameaddressii\or
\global\let\endsameaddress\endsameaddressiii\or
\global\let\endsameaddress\endsameaddressiv\or
\ClassError{\@classname}{%
  Erreur : {\c c}a fait trop de groupes `sameaddress' !
}{%
  C'est limit{\'e} {\`a} 4, ce qui est d{\'e}j{\`a} pas mal, non ?
}\fi
\xdef\thissameaddress{\roman{sameaddress}}
\@sameaddresstrue
  \renewcommand{\author}[2][]{%
    \ifx\@empty\authors
    \gdef\authors{##2}%
    \g@addto@macro\xmladdresses{\author{##2}}%
    \else
    \g@addto@macro\authors{\and##2}%
    \g@addto@macro\xmladdresses{\author{##2}}%
    \fi
% On accumule les auteurs concern{\'e}s dans @sameauthors
    \@xp\ifx\csname @sameauthors\thissameaddress\endcsname\@empty
    \@xp\gdef\csname @sameauthors\thissameaddress\endcsname{##2}%
    \else
    \@xp\g@addto@macro\csname @sameauthors\thissameaddress\endcsname{\and##2}%
    \fi
    \noauthorfalse
    \@ifnotempty{##1}{%
      \ifx\@empty\shortauthors
      \gdef\shortauthors{##1}%
      \else
      \g@addto@macro\shortauthors{\and##1}%
      \fi
    }%
  }
  \edef\author{\@nx\@dblarg
    \@xp\@nx\csname\string\author\endcsname}
  \renewcommand{\noauthor}[2][]{%
    \ifx\@empty\noauthors
    \gdef\noauthors{##2}%
    \g@addto@macro\xmladdresses{\noauthor{##1}{##2}}%
    \else
    \g@addto@macro\noauthors{\and##2}%
    \g@addto@macro\xmladdresses{\noauthor{##1}{##2}}%
    \fi
% On accumule les auteurs concern{\'e}s dans @sameauthors
    \@xp\ifx\csname @sameauthors\thissameaddress\endcsname\@empty
    \@xp\gdef\csname @sameauthors\thissameaddress\endcsname{##2}%
    \else
    \@xp\g@addto@macro\csname @sameauthors\thissameaddress\endcsname{\and##2}%
    \fi
    \noauthortrue
    \@ifnotempty{##1}{%
      \@xp\ifx\csname ##1@noauthors\endcsname\@empty
      \@xp\gdef\csname ##1@noauthors\endcsname{##1}%
      \else
      \@xp\g@addto@macro\csname ##1@noauthors\endcsname{\and##1}%
      \fi
    }%
  }
%% thanks avant la premi{\`e}re adresse !
  \renewcommand{\thanks}[1]{%
  \@ifnotempty{##1}{\g@addto@macro\thankses{\thanks{##1}}%
    \g@addto@macro\authors{\hasthanks{##1}}%
    \@xp\ifx\csname @sameaddress\thissameaddress\endcsname\@empty
    \@xp\gdef\csname @sameaddress\thissameaddress\endcsname{\hasthanks{##1}}\else
    \@xp\g@addto@macro\csname @sameaddress\thissameaddress\endcsname{\hasthanks{##1}}\fi
  }}
  \def\address##1{%
    \g@addto@macro\xmladdresses{\address{}{##1}}%
    \ifnoauthor
\if@sameaddress
    \g@addto@macro\noauthors{\hasaddress\new{##1}}%
\else
    \g@addto@macro\noauthors{\hasaddress\same{##1}}%
\fi
  \else
\if@sameaddress
    \g@addto@macro\authors{\hasaddress\new{##1}}%
\else
    \g@addto@macro\authors{\hasaddress\same{##1}}%
\fi
\fi
% l'adresse est stock{\'e}e dans @sameaddress, les autres sont ignor{\'e}es
\if@sameaddress
  \@xp\ifx\csname @sameaddress\thissameaddress\endcsname\@empty
   \@xp\gdef\csname @sameaddress\thissameaddress\endcsname{\address{}{##1}}\else
  \@xp\g@addto@macro\csname
  @sameaddress\thissameaddress\endcsname{\address{}{##1}}
  \fi
\fi
\global\@sameaddressfalse
}
\renewcommand{\curraddr}[2][]{%
  \ClassError{\@classname}{%
    Pas possible d'utiliser curraddr dans sameaddress !}{}}
\renewcommand{\email}[2][]{%
\@xp\g@addto@macro\csname @sameaddress\thissameaddress\endcsname{\email{##1}{##2}}%
\g@addto@macro\xmladdresses{\email{##1}{##2}}}
\renewcommand{\urladdr}[2][]{%
\@xp\g@addto@macro\csname @sameaddress\thissameaddress\endcsname{\urladdr{##1}{##2}}%
\g@addto@macro\xmladdresses{\urladdr{##1}{##2}}}
}
\def\endsameaddressi{%
% On pr{\'e}sente @sameaddress sous la forme idoine pour {\^e}tre ajout{\'e}e {\`a}
% addresses
\cdr@sameaddress@andify\@sameauthorsi
\ifx\@empty\addresses
 \gdef\addresses{\author{\@sameauthorsi}}%
 \g@addto@macro\addresses{\@sameaddressi}\else
 \g@addto@macro\addresses{\author{\@sameauthorsi}}%
 \g@addto@macro\addresses{\@sameaddressi}%
\fi
}
\def\endsameaddressii{%
% On pr{\'e}sente @sameaddress sous la forme idoine pour {\^e}tre ajout{\'e}e {\`a}
% addresses
\cdr@sameaddress@andify\@sameauthorsii
\ifx\@empty\addresses
 \gdef\addresses{\author{\@sameauthorsii}}%
 \g@addto@macro\addresses{\@sameaddressii}\else
 \g@addto@macro\addresses{\author{\@sameauthorsii}}%
 \g@addto@macro\addresses{\@sameaddressii}%
\fi
}
\def\endsameaddressiii{%
% On pr{\'e}sente @sameaddress sous la forme idoine pour {\^e}tre ajout{\'e}e {\`a}
% addresses
\cdr@sameaddress@andify\@sameauthorsiii
\ifx\@empty\addresses
 \gdef\addresses{\author{\@sameauthorsiii}}%
 \g@addto@macro\addresses{\@sameaddressiii}\else
 \g@addto@macro\addresses{\author{\@sameauthorsiii}}%
 \g@addto@macro\addresses{\@sameaddressiii}%
\fi
}
\def\endsameaddressiv{%
% On pr{\'e}sente @sameaddress sous la forme idoine pour {\^e}tre ajout{\'e}e {\`a}
% addresses
\cdr@sameaddress@andify\@sameauthorsiv
\ifx\@empty\addresses
 \gdef\addresses{\author{\@sameauthorsiv}}%
 \g@addto@macro\addresses{\@sameaddressiv}\else
 \g@addto@macro\addresses{\author{\@sameauthorsiv}}%
 \g@addto@macro\addresses{\@sameaddressiv}%
\fi
}
\newcommand{\Gnxandlist}[4]{%
  \def\@andlistc##1{\toks@\@xp{\the\toks@##1}}%
  \toks@{\toks@\@emptytoks \@andlista{{#1}{#2}{#3}}}%
  \the\@xp\toks@#4\and\and
  \xdef#4{\the\toks@}%
  \let\@andlistc\@iden}
\newcommand\cdr@sameaddress@andify{%
  \Gnxandlist {\unskip ,\penalty-1 \space\ignorespaces}%
    {\unskip {} \@@and~}%
    {\unskip \penalty-2 \space \@@and~}}
%% Fin sameaddress !
\renewcommand{\author}[2][]{%
  \ifx\@empty\authors
    \gdef\authors{#2}%
    \g@addto@macro\addresses{\author{#2}}%
    \g@addto@macro\xmladdresses{\author{#2}}%
  \else
    \g@addto@macro\authors{\and#2}%
    \g@addto@macro\addresses{\author{#2}}%
    \g@addto@macro\xmladdresses{\author{#2}}%
  \fi
  \noauthorfalse
  \@ifnotempty{#1}{%
    \ifx\@empty\shortauthors
      \gdef\shortauthors{#1}%
    \else
      \g@addto@macro\shortauthors{\and#1}%
    \fi
  }%
}
\edef\author{\@nx\@dblarg
  \@xp\@nx\csname\string\author\endcsname}
%% \noauthor[fonction]{nom}
\newif\ifnoauthor
\AtEndOfClass{\noauthorfalse
\ifx\l@nohyphenation\undefined 
\chardef\l@nohyphenation=255\relax 
\fi}
\newcommand{\noauthor}[2][]{%
  \ifx\@empty\noauthors
    \gdef\noauthors{#2}%
    \g@addto@macro\addresses{\noauthor{#1}{#2}}%
    \g@addto@macro\xmladdresses{\noauthor{#1}{#2}}%
  \else
    \g@addto@macro\noauthors{\and#2}%
    \g@addto@macro\addresses{\noauthor{#1}{#2}}%
    \g@addto@macro\xmladdresses{\noauthor{#1}{#2}}%
  \fi
  \noauthortrue
  \@ifnotempty{#1}{%
    \@xp\ifx\csname #1@noauthors\endcsname\@empty
      \@xp\gdef\csname #1@noauthors\endcsname{#1}%
    \else
      \@xp\g@addto@macro\csname #1@noauthors\endcsname{\and#1}%
    \fi
  }%
}
\newcommand{\xmlauthor}[2][]{%
  \ifx\@empty\xmladdresses
    \gdef\xmladdresses{\author{#2}}%
  \else
    \g@addto@macro\xmladdresses{\author{#2}}%
  \fi
  }%

%% \edef\noauthor{\@nx\@dblarg
%%   \@xp\@nx\csname\string\noauthor\endcsname}
\let\shortauthors\@empty   \let\authors\@empty
%% ent{\^e}te de droite = shortauthors par d{\'e}faut 
\def\topauthors{\shortauthors}
\let\translator@noauthors\@empty   
\let\redactor@noauthors\@empty   
\let\appendixwriter@noauthors\@empty   
\let\noauthors\@empty
\newif\ifresetcontrib  \resetcontribfalse
% un contributeur est  redacteur, ou auteur d'un appendice ou quoi ?
\newcommand\contrib[2][]{%
  \def\@tempa{#1}%
  \ifx\@empty\@tempa
  \ClassError{\@classname}{%
    \string\contrib\space has 2 arguments^^J
    (first = nature of contribution  is mandatory)^^J
  might be `redacteur' or `redacteur-appendice'}{%
    You probably used incorrectly the \string\contrib^^J
    command, please read the documentation!}
  \else
  \noauthor[#1]{#2}%
%    \ifresetcontrib% \@xcontribs
%    \else \global\resetcontribtrue
%    \fi
%  \fi
  \@xp\ifx\csname #1@contribs\endcsname\@empty
    \@xp\gdef\csname #1@contribs\endcsname{#2}%
  \else
    \@xp\g@addto@macro\csname #1@contribs\endcsname{\and#2}%
  \fi
\fi
%  \@wraptoccontribs{#1}{#2}%
}
%% le probl{\`e}me des r{\'e}dacteurs d'appendice dont on ne veut pas imprimer
%% l'adresse...
\newcommand\noaddresscontrib[2][]{%
  \def\@tempa{#1}%
  \ifx\@empty\@tempa
  \ClassError{\@classname}{%
    \string\contrib\space has 2 arguments^^J
    (first = nature of contribution  is mandatory)^^J
  might be `redacteur' or `redacteur-appendice'}{%
    You probably used incorrectly the \string\contrib^^J
    command, please read the documentation!}
  \else
%  \noauthor[#1]{#2}%
%    \ifresetcontrib% \@xcontribs
%    \else \global\resetcontribtrue
%    \fi
%  \fi
  \@xp\ifx\csname #1@contribs\endcsname\@empty
    \@xp\gdef\csname #1@contribs\endcsname{#2}%
  \else
    \@xp\g@addto@macro\csname #1@contribs\endcsname{\and#2}%
  \fi
\fi
%  \@wraptoccontribs{#1}{#2}%
}
\def\@wraptoccontribs#1#2{}
\def\@xcontribs{%
  \author@andify\contribs
  \ifx\@empty\xcontribs
    \xdef\xcontribs{\contribs}%
  \else
    \xdef\xcontribs{\xcontribs, \contribs}%
  \fi
  \let\contribs\@empty
}
\let\redactor@contribs\@empty
\let\appendixwriter@contribs\@empty
\let\contribs\@empty  \let\xcontribs\@empty  \let\toccontribs\@empty
\let\addresses\@empty  
\let\xmladdresses\@empty  
\let\thankses\@empty
\def\hasaddress#1#2{\relax}
\def\hascurraddress#1#2{\relax}
\def\hasemail#1#2{\relax}
\def\hasurl#1#2{\relax}
\newcommand{\address}[2][]{%
\g@addto@macro\addresses{\address{#1}{#2}}%
\g@addto@macro\xmladdresses{\address{#1}{#2}}%
  \ifnoauthor
    \g@addto@macro\noauthors{\hasaddress{#1}{#2}}%
  \else
    \g@addto@macro\authors{\hasaddress{#1}{#2}}%
  \fi
}
\newcommand{\curraddr}[2][]{%
\g@addto@macro\addresses{\curraddr{#1}{#2}}%
\g@addto@macro\xmladdresses{\curraddr{#1}{#2}}%
  \ifnoauthor
    \g@addto@macro\noauthors{\hascurraddress{#1}{#2}}%
  \else
    \g@addto@macro\authors{\hascurraddress{#1}{#2}}%
  \fi
}
\newcommand{\email}[2][]{%
\g@addto@macro\addresses{\email{#1}{#2}}%
\g@addto@macro\xmladdresses{\email{#1}{#2}}%
  \ifnoauthor
    \g@addto@macro\noauthors{\hasemail{#1}{#2}}%
  \else
    \g@addto@macro\authors{\hasemail{#1}{#2}}%
  \fi
}
\newcommand{\urladdr}[2][]{%
\g@addto@macro\addresses{\urladdr{#1}{#2}}%
\g@addto@macro\xmladdresses{\urladdr{#1}{#2}}%
  \ifnoauthor
    \g@addto@macro\noauthors{\hasurl{#1}{#2}}%
  \else
    \g@addto@macro\authors{\hasurl{#1}{#2}}%
  \fi

}
\long\def\thanks@warning#1{%
  \ClassError{\@classname}{%
    \protect\thanks\space should be given separately, not inside author name.%
  }\@ehb
}
\def\hasthanks#1{\relax}
\renewcommand{\thanks}[1]{%
  \@ifnotempty{#1}{\g@addto@macro\thankses{\thanks{#1}}%
    \g@addto@macro\authors{\hasthanks{#1}}%
}}
\def\@printauthors{\samepage
\ifx\@empty\@translators \else\@settranslators\fi
  \ifx\@empty\addresses \else\@setaddresses\fi}
\def\printauthors{\xdef\enddoc@text{}{\@printauthors}}
\def\noprintauthors{\xdef\enddoc@text{}}
\ifcdr@special\def\enddoc@text{}\else
\def\enddoc@text{\@printauthors}
\fi
\AtEndDocument{\enddoc@text}
\def\curraddrname{{\itshape Current address}}
\def\emailaddrname{{\itshape E-mail address}}
\def\urladdrname{{\itshape URL}}
\newcount\cdr@auth@count
\newcount\cdr@noauth@count
\cdr@auth@count0
\cdr@noauth@count0
\def\@setaddresses{\par
  \nobreak \begingroup\def\nobreakauthor{~}
\footnotesize
  \def\author##1{\nobreak\addvspace\bigskipamount}%
  \def\noauthor##1{\nobreak\addvspace\bigskipamount}%
  \def\\{\unskip, \ignorespaces}%
  \interlinepenalty\@M
  \def\address##1##2{\begingroup
    \par\addvspace\bigskipamount\indent
    \@ifnotempty{##1}{(\ignorespaces##1\unskip) }%
    {\scshape\ignorespaces##2}\par\endgroup}%
  \def\curraddr##1##2{\begingroup
    \@ifnotempty{##2}{\nobreak\indent\curraddrname
      \@ifnotempty{##1}{, \ignorespaces##1\unskip}\/:\space
      ##2\par}\endgroup}%
  \def\email##1##2{\begingroup
    \@ifnotempty{##2}{\nobreak\indent\emailaddrname
      \@ifnotempty{##1}{, \ignorespaces##1\unskip}\/:\space
      \ttfamily##2\par}\endgroup}%
  \def\urladdr##1##2{\begingroup
    \def~{\char`\~}%
    \@ifnotempty{##2}{\nobreak\indent\urladdrname
      \@ifnotempty{##1}{, \ignorespaces##1\unskip}\/:\space
      \ttfamily##2\par}\endgroup}%
  \addresses
  \endgroup
}
\let\@date\@empty
\def\dedicatory#1{\def\@dedicatory{#1}}
\let\@dedicatory=\@empty
\def\keywords#1{\def\@keywords{#1}%
\if@francais
\protected@xdef\@keywords@french{#1}\else
\protected@xdef\@keywords@english{#1}\fi}
\def\altkeywords#1{\def\@altkeywords{#1}%
\if@francais
\protected@xdef\@keywords@english{#1}\else
\protected@xdef\@keywords@french{#1}\fi}
\let\@keywords=\@empty
\let\@altkeywords\@empty
\let\@keywords@english\@empty
\let\@keywords@french\@empty
\newcommand*\subjclass[2][2010]{%
  \def\@subjclass{#2}%
  \@ifundefined{subjclassname@#1}{%
    \ClassWarning{\@classname}{Unknown edition (#1) of Mathematics
      Subject Classification; using '2010.}%
  }{%
    \@xp\let\@xp\subjclassname\csname subjclassname@#1\endcsname
  }%
}
\let\@subjclass=\@empty
\def\commby#1{\def\@commby{(Communicated by #1)}}
\let\@commby=\@empty
\def\translname{Translated by}
\def\translator#1{%
  \noauthor[traducteur]{#1}%
  \ifx\@empty\@translators \def\@translators{#1}%
  \else\g@addto@macro\@translators{\and#1}\fi}
\let\@translators=\@empty
\def\@settranslators{\par\begingroup
  \addvspace{6\p@\@plus9\p@}%
  \hbox to\columnwidth{\hss\normalfont\normalsize
    \translname{ }%
    \andify\@translators \uppercasenonmath\@translators
    \@translators}
  \endgroup
}
\newcommand{\xandlist}[4]{\@andlista{{#1}{#2}{#3}}#4\and\and}
\def\@andlista#1#2\and#3\and{\@andlistc{#2}\@ifnotempty{#3}{%
  \@andlistb#1{#3}}}
\def\@andlistb#1#2#3#4#5\and{%
  \@ifempty{#5}{%
    \@andlistc{#2#4}%
  }{%
    \@andlistc{#1#4}\@andlistb{#1}{#3}{#3}{#5}%
  }}
\let\@andlistc\@iden
\newcommand{\nxandlist}[4]{%
  \def\@andlistc##1{\toks@\@xp{\the\toks@##1}}%
  \toks@{\toks@\@emptytoks \@andlista{{#1}{#2}{#3}}}%
  \the\@xp\toks@#4\and\and
  \edef#4{\the\toks@}%
  \let\@andlistc\@iden}
\def\@@and{\&}
\def\@maketitle@shortauthors@hook{\let\topauthors\shortauthors}
\def\@maketitle@shortauthors@hook@after{\relax}
% {\`a} utiliser dans le cfg pour faire la page de garde
\def\@makePagedeGarde{}%
\newcommand{\andify}{%
  \nxandlist{\unskip, }{\unskip{} \@@and~}{\unskip{} \@@and~}}
\def\and{\unskip{ }\@@and{ }\ignorespaces}
\def\cdr@oddheadcode{}
\def\cdr@evenheadcode{}
%% pages de garde/m{\'e}tadonn{\'e}es uniquement
% \ifcdr@recup
% \def\maketitle{%
%   \ifcdr@uppercaseheadtitles
%   \uppercasenonmath\shorttitle
%   \fi
%    \@maketitle@shortauthors@hook
%   \ifx\@empty\topauthors \let\topauthors\shorttitle
%   \else \andify\topauthors
%   \fi
%   \@makePDFinfo
%   \@makeSOM
%   \@makePagedeGarde
  
% }
%\else
\def\maketitle{\par
  \@topnum\z@ % this prevents figures from falling at the top of page 1
  \@setcopyright
  \ifcdr@uppercaseheadtitles
  \uppercasenonmath\shorttitle
  \fi
   \@maketitle@shortauthors@hook
  \ifx\@empty\topauthors \let\topauthors\shorttitle
  \else \andify\topauthors
  \fi
  \@makePDFinfo
  \@makeSOM
  \@makePagedeGarde
  \thispagestyle{firstpage}% this sets first page specifications
  \@maketitle@hook
  \begingroup
  \toks@\@xp{{\cdr@evenheadcode\topauthors}}\@temptokena\@xp{{\cdr@oddheadcode\shorttitle}}%
  \ifcdr@AIF
   \toks4{\def\\{ \ignorespaces}\def\lastname##1{\MakeUppercase{##1}}}% defend against questionable usage
  \else
   \toks4{\def\\{ \ignorespaces}}% defend against questionable usage
  \fi
  \ifcdr@uppercaseheadauthors
   \edef\@tempa{%
    \@nx\cdr@markboth{\the\toks4
      \@nx\MakeUppercase{\the\toks@}}{\the\@temptokena}}%
  \else
   \edef\@tempa{%
    \@nx\cdr@markboth{\the\toks4
      \the\toks@}{\the\@temptokena}}%
  \fi
  \@tempa
  \endgroup
\begingroup
  \@maketitle
\endgroup
  \c@footnote\z@
  \@cleartopmattertags
}
%\fi
\def\@cleartopmattertags{%
  \let\maketitle\relax
  % \def\do##1{\let##1\relax}%
  % \do\maketitle \do\@maketitle \do\title \do\@xtitle \do\@title
  % \do\author \do\@xauthor \do\address \do\@xaddress \do\contrib
  % \do\contribs \do\xcontribs \do\toccontribs \do\email \do\@xemail
  % \do\curraddr \do\@xcurraddr \do\commby \do\@commby \do\dedicatory
  % \do\@dedicatory \do\thanks \do\thankses \do\keywords \do\@keywords
  % \do\subjclass \do\@subjclass
}
% 
\def\@maketitle@hook{}%\global\let\@maketitle@hook\@empty}
% {\'e}crit la ligne du sommaire
% \SomLine
%        [#0] = ordreart (optionnel)
%          #1 = auteurs courts
%          #2 = auteurs
%          #3 = langue
%          #4 = titre en anglais  
%          #5 = titre en fran{\c c}ais
%          #6 = r{\'e}sum{\'e} en anglais
%          #7 = r{\'e}sum{\'e} en fran{\c c}ais 
%          #8 = page d{\'e}b.
%          #9 = page fin 
%
%% D{\'e}finitions {\`a} passer {\`a} SomLine
%% 1. version b{\^e}te
\let\@SomDefs\@empty
\long\def\SomDefs#1{
\newtoks\@SomDefs
\@SomDefs={#1}}
%% 2. Mieux
\let\@DefSom\@empty
\newenvironment{DefSom}{%
  \xdef\@DefSom{\jobname/\jobname .cdrsom+}
  \VerbatimEnvironment%
  \begin{VerbatimOut}{\jobname .cdrsom+}%
}
{\end{VerbatimOut}}
\newtoks\cdrsom@toka
\newtoks\cdrsom@tokb
\newtoks\cdrsom@tokc
\newtoks\cdrsom@tokd
\ifcdr@SOM
\newwrite\cdrsom@out
\def\authorSOM@andify{%
  \nxandlist {\unskip ,\penalty-1 \space\ignorespaces}%
    {\unskip {} \@@and~}%
    {\unskip \penalty-2 \space \@@and~}%
}
%
\def\cdrsom@out@filename{\jobname.cdrsom}
\def\@makeSOM{%
  \begingroup
  \protected@edef\cdr@idvol{\cdr@journalacro_\currentyear_\currentseries_\currentvolume_\currentissue}%
  \protected@edef\cdr@idart{\cdr@idvol_\Cdr@start@page@idart_0}%
  \immediate\openout\cdrsom@out=\cdrsom@out@filename\relax
  \immediate\write\cdrsom@out{\string\begingroup}%
  \immediate\write\cdrsom@out{\cdr@com Article : \cdr@idart}%
  \immediate\write\cdrsom@out{\cdr@com Fichier : \jobname .tex}%
%  \immediate\write\cdrsom@out{\string\FichierArt{\jobname}{\currentyear}{\currentvolume}{\currentissue}{\cdr@start@page}{\cdr@end@page}}  %LG
  \immediate\write\cdrsom@out{\cdr@com Date prod. :
    \number\year/\number\month/\number\day}%
  %% num{\'e}ro d'expos{\'e} (SEDP...)
  \ifx\@dateexpose\@empty\else
   \cdrsom@toka=\@xp{\@dateexpose}%
      \immediate\write\cdrsom@out{%
        \string\def\string\@dateexpose
        \cdr@lb\the\cdrsom@toka\cdr@rb\cdr@pc}%***
  \fi
  %% macros utilisateurs d{\'e}conseill{\'e}es !
  \ifx\@DefSom\@empty
  % pas d'utilisation de l'environnement DefSom
  \ifx\@SomDefs\@empty\else
  % cas SomDefs
    \immediate\write\cdrsom@out{%
      \the\@SomDefs\cdr@pc}%***
  \fi\else
  % cas DefSom : SomDefs ignor{\'e}
      \immediate\write\cdrsom@out{%
      \string\InputIfFileExists
      {\jobname/\jobname.cdrsom+}{}{}\cdr@pc}%***
  \fi
%% fin support macros utilisateurs
  \immediate\write\cdrsom@out{\string\SomLine}%
%% param{\`e}tre optionnel : ordreart
  \ifnum\c@article>\z@\relax
   \cdrsom@toka={\value{article}}%
  \immediate\write\cdrsom@out{%
    \cdrsom@tab [\the\c@article]}%
  \fi
  \authorSOM@andify\shortauthors
    \cdrsom@toka=\@xp{\shortauthors}%
  \immediate\write\cdrsom@out{%
    \cdrsom@tab \cdr@lb\the\cdrsom@toka\cdr@rb}% Auteurs abr{\'e}g{\'e}s
  \authorSOM@andify\authors
    \cdrsom@toka=\@xp{\authors}%
  \immediate\write\cdrsom@out{%
    \cdrsom@tab \cdr@lb\the\cdrsom@toka\cdr@rb}% Auteurs
  \if@francais
    \cdrsom@toka=\@xp{\@alttitle}% en
    \cdrsom@tokb=\@xp{\@title}% fr
  \else
    \cdrsom@toka=\@xp{\@title}% en
    \cdrsom@tokb=\@xp{\@alttitle}% fr
  \fi
  \cdrsom@tokc=\@xp{\@abstract@english}%
  \cdrsom@tokd=\@xp{\@abstract@french}%
\if@francais
\immediate\write\cdrsom@out{%
    \cdrsom@tab \cdr@lb french\cdr@rb}% Langue
\else
\immediate\write\cdrsom@out{%
    \cdrsom@tab \cdr@lb english\cdr@rb}% Langue
\fi
\immediate\write\cdrsom@out{%
    \cdrsom@tab \cdr@lb\the\cdrsom@toka\cdr@rb^^J% Titre anglais
    \cdrsom@tab \cdr@lb\the\cdrsom@tokb\cdr@rb^^J% Titre fran{\c c}ais
    \cdrsom@tab \cdr@lb\the\cdrsom@tokc\cdr@rb^^J% Abstract anglais
    \cdrsom@tab \cdr@lb\the\cdrsom@tokd\cdr@rb^^J% Abstract fran{\c c}ais
    \cdrsom@tab \cdr@lb\cdr@start@page\cdr@rb^^J% Page d{\'e}but    
    \cdrsom@tab \cdr@lb\cdr@end@page\cdr@rb% Page fin
  }
\immediate\write\cdrsom@out{\string\endgroup}%
\immediate\closeout\cdrsom@out
\endgroup}%
\else
\let\@makeSOM\relax
\fi
% catalogue PDFinfo
\def\url#1{#1}
\def\href#1#2{#2}
\ifcdr@hyperref
  \ifcdr@writexviii
  \immediatelywrite@shell{\cdr@touch hyperref.cfg}\fi
\AtEndOfClass{\ifcdr@HTML
\RequirePackage[dvips,
  hyperfootnotes=false,
  raiselinks=true,
  hypertexnames=false,
  % naturalnames=true,
  colorlinks=true,
  % backref,
  % pagelayout,
  bookmarks=true,
  bookmarksopen=false,
  anchorcolor=black,
  citecolor=black,
  linkcolor=black,
  filecolor=black,
%  pagecolor=black,
  urlcolor=black]{hyperref}
 \let\@makePDFinfo\relax
\else
\RequirePackage[pdftex,
     pdfview=XYZ,
     pdfstartview=FitV,
     % pdfcenterwindow,
     pdffitwindow,
  hyperfootnotes=false,
  raiselinks=true,
  hypertexnames=false,
  % naturalnames=true,
  colorlinks=true,
  % backref,
  % pagelayout,
  bookmarks=true,
  bookmarksopen=false,
  anchorcolor=black,
  citecolor=black,
  linkcolor=black,
  filecolor=black,
%  pagecolor=black,
  urlcolor=black]{hyperref}
\def\@makePDFinfo{%
\begingroup
  \nxandlist {, }%
    {\@@and~}%
    { \@@and~}\authors
   \hypersetup{%
     pdfauthor=\authors,
     pdftitle=\@title,
     pdfsubject=\CDRcopyright,
%     baseurl={\journalURL},
     pdfkeywords={Produit dans le cadre du \CDRserviceName, \CDRbaseURL}}%
\endgroup}%
%% Fix for page anchors / hyperpage
 \def\Hy@EveryPageAnchor{%
   \Hy@DistillerDestFix
   \ifHy@pageanchor
         \begingroup
           \let\@number\@firstofone
           \Hy@unicodefalse
           \Hy@PageAnchorSlide
           \pdfstringdef\@the@H@page{\thepage}%
         \endgroup
         \EdefUnescapeString\@the@H@page{\@the@H@page}%
         \def\Hy@TempPageAnchor{\hyper@@anchor{page.\@the@H@page}}%
      \vbox to 0pt{%
       \kern\voffset
       \kern\topmargin
       \kern-1bp\relax
       \hbox to 0pt{%
         \kern\hoffset
         \kern\ifodd\value{page}%
                \oddsidemargin
              \else
                \evensidemargin
              \fi
         \kern-1bp\relax
         \Hy@TempPageAnchor\relax
         \hss
       }%
       \vss
     }%
   \csname fi\endcsname
 }%
\fi
\ifcdr@recup
  \hypersetup{%
         pdfpagemode=UseNone}%
\else
  \hypersetup{%
         pdfpagemode=UseOutlines}%
\fi
\ifcdr@unicode
  \hypersetup{unicode}%
\fi
\pdfstringdefDisableCommands{%
\let\TOCNoIndent\relax
\let\except\@gobbletwo}{}%
%% ajustement largeur SMF pour JEP
\let\cdr@HREFbibitem\bibitem
\let\cdr@HREFATbibitem\@bibitem
\let\cdr@HREFATLbibitem\@lbibitem
\ifcdr@JEP
\def\bibitem{\@ifnextchar[\smf@lbibitem\smf@bibitem}%]
\def\smf@lbibitem[#1]#2{\cdr@HREFATLbibitem[#1]{#2}%
       \settowidth\smf@tempwidthb{\@biblabel{#1}}%
       \ifdim\smf@tempwidthb>\smf@tempwidtha
          \global\smf@tempwidtha=\smf@tempwidthb
       \fi\ignorespaces}
\def\smf@bibitem#1{\cdr@HREFATbibitem{#1}%
        \settowidth\smf@tempwidthb{\@biblabel{\theenumiv}}%
        \ifdim\smf@tempwidthb>\smf@tempwidtha
           \global\smf@tempwidtha=\smf@tempwidthb
        \fi\ignorespaces}
\fi
}\else
\let\href\undefined
 \RequirePackage{nohyperref}
 \let\pdfstringdefDisableCommands\@gobble
 \let\@makePDFinfo\relax
\fi
%
\newlength{\@titletopskip}
\setlength{\@titletopskip}{42\p@}
\newlength{\@titlebotskip}
\setlength{\@titlebotskip}{34\p@}
%
\let\cdr@preabstracthook\@empty
\let\cdr@interabstracthook\@empty
\let\cdr@postabstracthook\@empty
\def\@setsubtitle#1{#1}
\def\@setafterauthor#1{#1}
\def\@setdedicatory{\baselineskip18\p@%
    \vtop{\centering{\footnotesize\itshape\@dedicatory\@@par}%
      \global\dimen@i\prevdepth}\prevdepth\dimen@i}
\def\@maketitle{%
\ifcdr@recup
  \@mkboth{\@nx\shortauthors}{\@nx\shorttitle}%
\else
  \normalfont\normalsize
  \@adminfootnotes
%  \@mkboth{\@nx\shortauthors}{\@nx\shorttitle}%
  \global\topskip\@titletopskip\relax % 5.5pc   "   "   "     "     "
  \@settitle
  \ifx\@empty\@subtitle\else \@setsubtitle\fi
  \ifx\@empty\authors \else \@setauthors \fi
  \ifx\@empty\@afterauthor\else \@setafterauthor\fi
  \ifx\@empty\@dedicatory\else\@setdedicatory\fi
    \cdr@preabstracthook
    \@setabstract@first
    \cdr@interabstracthook
    \@setabstract@last
    \cdr@postabstracthook
  \normalsize
  \if@titlepage
    \newpage
  \else
    \dimen@\@titlebotskip \advance\dimen@-\baselineskip
    \vskip\dimen@\relax
  \fi
\fi} % end \@maketitle
\def\@setabstract@first{\@setabstract}
\def\@setabstract@last{\@setaltabstract}
\def\@adminfootnotes{%
  \let\@makefnmark\relax  \let\@thefnmark\relax
  \ifx\@empty\@date\else \@footnotetext{\@setdate}\fi
  \ifx\@empty\@subjclass\else \@footnotetext{\@setsubjclass}\fi
  \ifx\@empty\@keywords\else \@footnotetext{\@setkeywords}\fi
  \ifx\@empty\thankses\else \@footnotetext{%
    \def\par{\let\par\@par}\@setthanks}%
  \fi
}
\AtBeginDocument{%
  \@ifundefined{publname}{%
    \let\publname\@empty
    \let\@serieslogo\@empty
  }{%
    \def\@serieslogo{\article@logo}%
  }%
}
\AtBeginDocument{%
  \@ifundefined{volinfo}{%
    \def\volinfo{%
      Volume \currentvolume, Number \number0\currentissue
      \if\@printyear , \currentmonth\ \currentyear\fi
    }%
  }{}%
}
\def\@printyear{TF}% boolean false
\def\lieusem#1{\def\currentlocation{#1}}
\def\issueinfo#1#2#3#4{\def\currentvolume{#1}\def\currentissue{#2}%
  \def\currentmonth{#3}\def\currentyear{#4}}
%% quand les donn{\'e}es {\`a} imprimer dans l'article ne sont pas celles du fascicule
%% (donc idart) 
\def\articleinfo#1#2#3#4{\def\currentARTvolume{#1}\def\currenARTtissue{#2}%
  \def\currentARTmonth{#3}\def\currentARTyear{#4}}
\issueinfo{00}% volume number
  {0}%        % issue number
  {Xxxx}%     % month
  {XXXX}%     % year
\articleinfo\currentvolume\currentissue\currentmonth\currentyear
\lieusem{Nulle Part !}
\newcommand{\copyrightinfo}[2]{%
  \def\copyrightyear{#1}%
  \@ifnotempty{#2}{\def\copyrightholder{#2}}%
}
\copyrightinfo{0000}{(copyright holder)}
\newcounter{article}
%% compatibilit{\'e} ?
\def\pagespan#1#2{\setcounter{page}{#1}%
  \ifnum\c@page<\z@ \pagenumbering{Roman}\setcounter{page}{-#1}\fi
  \def\start@page{#1}\def\end@page{#2}}%
% start@page = pagedeb, si <0 -> romain
% cdr@start@page = pagedeb format{\'e} avec \thepage (sommaire, \pageinfo)
% Cdr@start@page = pagedeb pour XML (arabe) 
% Cdr@start@page@idart = champ pagedeb pour idart (15, R1, A2...)
\newcommand\setpage[2][arabic]{\pagenumbering{#1}\setcounter{page}{#2}%
%  \ifnum\c@page<\z@ \pagenumbering{Roman}\setcounter{page}{-#1}\fi
  \gdef\start@page{#2}\protected@xdef\@pagenumbering{#1}}%
\pagespan{000}{000}
\ifcdr@volume%% 
\newenvironment{DefGlobales}{%
  \VerbatimEnvironment%
  \begin{VerbatimOut}{\CDRidvol -global.cfg}%
}
{\end{VerbatimOut}%
}%
\fi
\AtEndOfClass{%
\ifcdr@volume\else
\InputIfFileExists{./\jobname .cfg}{%
\message{** Fichier de configuration \jobname .cfg charg{\'e} pour cet article **^^J}}{%
\message{** Pas de fichier de configuration pour cet article **^^J}}%
\InputIfFileExists{./\jobname .cdrdoidates}{%
\message{** Fichier de dates/doi \jobname .cdrdoidates charg{\'e} pour cet article **^^J}}{%
\message{** Pas de fichier de dates/doi pour cet article **^^J}}%
\InputIfFileExists{../\CDRidvol -global.cfg}{%
\message{** Fichier de configuration \CDRidvol -global.cfg charg{\'e} pour cet article **^^J}}{%
\InputIfFileExists{./\CDRidvol -global.cfg}{%
\message{** Fichier de configuration \CDRidvol -global.cfg charg{\'e} **^^J}}{%
\message{** Pas de fichier de configuration global pour ce volume **^^J}}}%%
\fi
\ifcdr@published
\global\pdfdraftmode=1
\fi
}
\AtBeginDocument{%
  \protected@edef\cdr@start@page{\thepage}%
  \protected@edef\Cdr@start@page{\arabic{page}}%
  \g@addto@macro\Cdr@start@page{\XMLaddatt{systnum}{arabe}}%
  \protected@edef\Cdr@start@page@idart{%
    \@arabic\start@page}
  \def\tmp@{roman}
  \ifx\@pagenumbering\tmp@
  \protected@edef\Cdr@start@page@idart{%
     r\@arabic\start@page}%
   \g@addto@macro\Cdr@start@page{\XMLaddatt*{systnum}{romain}}\fi
  \def\tmp@{Roman}
  \ifx\@pagenumbering\tmp@
  \protected@edef\Cdr@start@page@idart{%
    R\@arabic\start@page}%
   \g@addto@macro\Cdr@start@page{\XMLaddatt*{systnum}{Romain}}\fi
  \ifnum\c@article>\z@\relax
  \protected@edef\Cdr@start@page@idart{%
    A\@arabic\c@article}\fi
  \@ifundefined{pageinfo}{%
    \def\pageinfo{%
      \ifnum\start@page<\z@
       \ifx\cdr@start@page\cdr@end@page
        \cdr@start@page
       \else
        \cdr@start@page\pageinfosep\cdr@end@page
       \fi
      \else
      \ifnum\start@page=\z@
         000-000%
      \else
        \ifx\cdr@start@page\cdr@end@page
          \cdr@start@page
        \else
          \cdr@start@page\pageinfosep\cdr@end@page
        \fi \fi
      \fi}%
  }{}%
}
%% Si besoin pour revenir sur les automatismes
\def\PageInfo#1#2{%
 \def\cdr@start@page{#1}%
 \def\cdr@end@page{#2}%
}
\@ifundefined{ISSN}{\def\ISSN{0000-0000}}{}
\newcommand\PII[1]{\def\@PII{#1}}
\PII{S \ISSN(XX)0000-0}
\newinsert\copyins
\skip\copyins=1.5pc
\count\copyins=1000 % magnification factor, 1000 = 100%
\dimen\copyins=.5\textheight % maximum allowed per page
\g@addto@macro\@reinserts{%
  \ifvoid\copyins\else\insert\copyins{\unvbox\copyins}\fi
}
\def\@copyinsfontsize{\fontsize{6}{7\p@}\normalfont\upshape}
\newif\if@extracrline  \@extracrlinefalse
\let\@extracrline\@empty
\relax
\def\pageinfosep{-}
\def\@setcopyright{%
  \ifx\@empty\@serieslogo
  \else\ifx\@empty\copyrightyear
  \else
    \insert\copyins{\hsize\textwidth
      \parfillskip\z@\relax
      \leftskip\z@\@plus.9\textwidth\relax \rightskip\z@\relax
      \@copyinsfontsize
      \everypar{}%
      \vskip-\skip\copyins
      \if@extracrline
        \vskip-6pt
      \fi
      \nointerlineskip
      \leavevmode\hfill\vrule\@width\z@\@height\skip\copyins
      \copyright\copyrightyear\ \copyrightholder\ignorespaces
      \if@extracrline \@extracrline \fi
      \par
      \kern\z@}%
  \fi\fi
}
\def\@combinefloats{%
  \ifx \@toplist\@empty \else \@cflt \fi
  \ifx \@botlist\@empty \else \@cflb \fi
  \ifvoid\copyins \else \@cflci \fi
}
\def\@cflci{%
  \setbox\@outputbox\vbox{%
    \unvbox\@outputbox
    \vskip\skip\copyins
    \if@twocolumn \else \vskip\z@ plus\p@ \fi
    \hbox to\columnwidth{%
      \hss\vbox to\z@{\vss
        \if@twocolumn
          \if@firstcolumn \else \unvbox\copyins \fi
        \else
          \unvbox\copyins
        \fi
        }}}%
  \if@twocolumn \if@firstcolumn
    \insert\copyins{\unvbox\copyins}%
  \fi\fi
  \global\count\copyins=999 \relax
}
\newif\if@revertcopyright  \@revertcopyrightfalse
\newcommand{\revertcopyright}{%
  \global\@revertcopyrighttrue
  \global\@extracrlinetrue}
\def\@revertcrfontsize{\fontsize{6}{7\p@}\normalfont\upshape}
\def\@extracrline{%
  \if@revertcopyright
    \unskip\\
    \@revertcrfontsize
    Reverts to public domain 28 years from publication
  \fi
}
\if@francais
\newcommand\cdrnumero{\no}
\newcommand{\cdredsname}{{\'e}ds.}
\newcommand{\cdredname}{{\'e}d.}
\newcommand{\cdrchapname}{chap.}
\newcommand{\cdrmastersthesisname}{M{\'e}moire}
\newcommand{\cdrphdthesisname}{Th{\`e}se}
\newcommand{\abstractname}{R{\'e}sum{\'e}}
\newcommand{\altabstractname}{Abstract}
\newcommand{\disclaimername}{Avertissement}
\newcommand{\altdisclaimername}{Disclaimer}
\newcommand{\annexname}{Annexe}
\newcommand{\altannexname}{Annex}
\newcommand{\keywordsname}{Mots cl{\'e}s}
\newcommand{\subjclassname}{%
   Classification Math{\'e}matique (2010)}
\@namedef{subjclassname@1991}{%
   Classification Math{\'e}matique (1991)}
\@namedef{subjclassname@2000}{%
   Classification Math{\'e}matique (2000)}
\@xp\let\csname subjclassname@2010\endcsname \subjclassname
\newcommand{\datename}{Re{\c c}u par la r{\'e}daction}
\else
\newcommand\cdrnumero{no.~}
\newcommand{\cdredsname}{eds.}
\newcommand{\cdredname}{ed.}
\newcommand{\cdrchapname}{chap.}
\newcommand{\cdrmastersthesisname}{Memoir}
\newcommand{\cdrphdthesisname}{PhD Thesis}
\providecommand{\abstractname}{Abstract}
\newcommand{\altabstractname}{R{\'e}sum{\'e}}
\newcommand{\disclaimername}{Disclaimer}
\newcommand{\altdisclaimername}{Avertissement}
\newcommand{\annexname}{Annex}
\newcommand{\altannexname}{Annexe}
\newcommand{\keywordsname}{Key words}
\newcommand{\subjclassname}{%
  \textup{2010} Mathematics Subject Classification}
\@namedef{subjclassname@1991}{%
  \textup{1991} Mathematics Subject Classification}
\@namedef{subjclassname@2000}{%
  \textup{2000} Mathematics Subject Classification}
\@xp\let\csname subjclassname@2010\endcsname \subjclassname
  \newcommand{\datename}{Received by the editors}
\fi
\def\@settitle{\begin{center}%
  \baselineskip14\p@\relax
    \bfseries
\uppercasenonmath\@title
  \@title
  \end{center}%
}
\def\author@andify{%
  \nxandlist {\unskip ,\penalty-1 \space\ignorespaces}%
    {\unskip {} \@@and~}%
    {\unskip ,\penalty-2 \space \@@and~}%
}
\def\@setauthors{%
  \begingroup\def\nobreakauthor{~}%
  \def\thanks{\protect\thanks@warning}%
  \trivlist
  \centering\footnotesize \@topsep30\p@\relax
  \advance\@topsep by -\baselineskip
  \item\relax
  \author@andify\authors
  \def\\{\protect\linebreak}%
  \MakeUppercase{\authors}%
  \ifx\@empty\contribs
  \else
    ,\penalty-3 \space \@setcontribs
    \@closetoccontribs
  \fi
  \endtrivlist
  \endgroup
}
\def\@closetoccontribs{}
\def\@setcontribs{%
  \@xcontribs
  \MakeUppercase{\xcontribs}%
}
\def\@setdate{\datename\ \@date\@addpunct.}
\def\@setsubjclass{%
  {\itshape\subjclassname.}\enspace\@subjclass\@addpunct.}
\def\@setkeywords{%
  {\itshape \keywordsname.}\enspace \@keywords\@addpunct.}
\def\@setthanks{\def\thanks##1{\par##1\@addpunct.}\thankses}
%% Environnements (alt)abstract de la SMF
\def\abstractheadfont{\bfseries}
\def\abstractfont{\footnotesize}
\newdimen\abstractmargin
\abstractmargin1em
\newdimen\abstractmarginL
\abstractmarginL\abstractmargin
\newdimen\abstractmarginR
\abstractmarginR\abstractmargin
\newtoks\@genabs\newtoks\@genabstokb
%% genabstract #1 = nom env. #2 = type (sans alt)
\newenvironment{@genabstract}[2]{%
  \gdef\@genabstinternalname{#2}%
  \gdef\@genabstext{}\def\cdr@tempb{#1}\@getgenabstext
}{% on r{\'e}cup{\`e}re le contenu de l'environnement #1
  \@xp\@xp\global\@xp\let\csname @\cdr@tempb\endcsname \@genabstext
% pendant qu'on y est, on cr{\'e}e une version ind{\'e}pendante de la langue
% de l'article
  \@xp\@xp\global\@xp\let\csname @\@genabstinternalname @\@cdrabstractlanguagext\endcsname \@genabstext}
%
\long\def\@getgenabstext#1\end #2{%
  \@genabs=\expandafter{\@genabstext}
  \def\@tempa{#2}\ifx\@tempa\cdr@tempb
     \@genabstokb={#1}%
     \edef\@next{\noexpand\end{@genabstract}\noexpand\end{\cdr@tempb}}%
  \else
     \@genabstokb={#1\end{#2}}%
     \let\@next\@getgenabstext
  \fi
  \global\edef\@genabstext {\the\@genabs \the\@genabstokb}%
  \@next}
\def\@setgenabstract#1{%
\@xp\ifx\csname @#1\endcsname\@empty\else
\if@abstractvbox\vbox\bgroup\fi
\begingroup
  \abstractfont
  \list{}{\labelwidth\z@
    \leftmargin\abstractmarginL \rightmargin\abstractmarginR
    \listparindent\normalparindent
    \itemindent\z@
  %    \itemindent\normalparindent %  \advance\itemindent\labelsep
    \parsep\z@ \@plus\p@
    \let\fullwidthdisplay\relax}%
\ifcdr@JEP
  \sbox\@tempboxa{\csname @set#1head\endcsname}%
  \ifdim\wd\@tempboxa>.7\textwidth \smf@skippttrue\fi
\fi
  \item\relax{
\csname @set#1head\endcsname
\ifcdr@JEP
   \ifsmf@skippt
       \global\smf@skipptfalse
       \@@par\nobreak
   \else
       \pointrait\nobreak
   \fi
\fi}
  \ignorespaces
  \csname @#1language\endcsname\csname @#1\endcsname
  \endlist
  \endgroup
  \if@abstractvbox\egroup\fi
\fi}
%% r{\'e}sum{\'e}s suppl{\'e}mentaires, non conserv{\'e}s en XML
\newenvironment{supplabstract}[1]{%
\if@abstractvbox\vbox\bgroup\fi
\begingroup
  \abstractfont
  \list{}{\labelwidth\z@
    \leftmargin\abstractmarginL \rightmargin\abstractmarginR
    \listparindent\normalparindent
    \itemindent\z@
    \parsep\z@ \@plus\p@
    \let\fullwidthdisplay\relax}%
  \item\relax
    {\def\abstractname{#1}\@setabstracthead}%
  \ignorespaces}
%  \csname @#1language\endcsname\csname @#1\endcsname
{%
 \endlist
  \endgroup
  \if@abstractvbox\egroup\fi
}
\def\@abstract{}
%
\newenvironment{abstract}{%
  \ifx\maketitle\relax
    \ClassWarning{\@classname}{Abstracts should precede
      \protect\maketitle\space in this documentclass; reported}%
  \fi
  \if@francais
  \def\@cdrabstractlanguagext{french}%
  \else
  \def\@cdrabstractlanguagext{english}%
  \fi
  \begin{@genabstract}{abstract}{abstract}%
}{%
  \ifx\@setabstract\relax \@setabstracta\par\bigskip \fi
}
\def\@setabstracthead{{\abstractheadfont\abstractname\unskip.\kern.3em\ignorespaces}}
\newif\ifcdr@abstracta\cdr@abstractatrue
\def\@setabstract{\ifcdr@abstracta
    \@setabstracta
    \global\let\@setabstract\relax
    \fi}
\def\@setabstracta{\@setgenabstract{abstract}}
\def\@altabstract{}
\newenvironment{altabstract}{%
  \ifx\maketitle\relax
    \ClassWarning{\@classname}{Abstracts should precede
      \protect\maketitle\space in this documentclass; reported}%
  \fi
  \if@francais
  \def\@cdrabstractlanguagext{english}%
  \else
  \def\@cdrabstractlanguagext{french}%
  \fi
  \@altabstractlanguage
  \begin{@genabstract}{altabstract}{abstract}%
}{%
  \ifx\@setaltabstract\relax \@setaltabstracta\par\bigskip \fi
}
\def\@setaltabstracthead{{\abstractheadfont\altabstractname\unskip.}%
  \ifx\@alttitle\@empty\else\  
  \textup(\emph{\@alttitle}\textup)\fi\kern.3em\ignorespaces}
\newif\ifcdr@altabstracta\cdr@altabstractatrue
\def\@setaltabstract{\ifcdr@altabstracta \@setaltabstracta
  \global\let\@setaltabstract\relax \fi}
\def\@setaltabstracta{\@setgenabstract{altabstract}}
\let\@disclaimer@english\@empty
\let\@disclaimer@french\@empty
\newenvironment{disclaimer}[1][\disclaimername]{%
  \ifx\maketitle\relax
    \ClassWarning{\@classname}{Disclaimers should precede
      \protect\maketitle\space in this documentclass}%
  \fi
  \gdef\cdr@disclaimername{#1}%
  \if@francais
  \def\@cdrabstractlanguagext{french}%
  \gdef\cdr@disclaimername@french{#1}%
  \else
  \def\@cdrabstractlanguagext{english}%
  \gdef\cdr@disclaimername@english{#1}%
  \fi
  \begin{@genabstract}{disclaimer}{disclaimer}%
}{%
  \ifx\@setabstract\relax \@setabstracta\par\bigskip \fi
}
\newenvironment{altdisclaimer}[1][\altdisclaimername]{%
  \ifx\maketitle\relax
    \ClassWarning{\@classname}{Disclaimers should precede
      \protect\maketitle\space in this documentclass}%
  \fi
  \gdef\cdr@altdisclaimername{#1}%
  \if@francais
  \def\@cdrabstractlanguagext{english}%
  \gdef\cdr@disclaimername@english{#1}%
  \else
  \def\@cdrabstractlanguagext{french}%
  \gdef\cdr@disclaimername@french{#1}%
  \fi
  \@altabstractlanguage
  \begin{@genabstract}{altdisclaimer}{disclaimer}%
}{%
  \ifx\@setabstract\relax \@setabstracta\par\bigskip \fi
}
\let\@annex@english\@empty
\let\@annex@french\@empty
\newenvironment{annex}[1][\annexname]{%
  \ifx\maketitle\relax
    \ClassWarning{\@classname}{Annexes should precede
      \protect\maketitle\space in this documentclass}%
  \fi
  \gdef\cdr@annexname{#1}%
  \if@francais
  \def\@cdrabstractlanguagext{french}%
  \gdef\cdr@annexname@french{#1}%
  \else
  \def\@cdrabstractlanguagext{english}%
  \gdef\cdr@annexname@english{#1}%
  \fi
  \begin{@genabstract}{annex}{annex}%
}{%
  \ifx\@setabstract\relax \@setabstracta\par\bigskip \fi
}
\newenvironment{altannex}[1][\altannexname]{%
  \ifx\maketitle\relax
    \ClassWarning{\@classname}{Annexs should precede
      \protect\maketitle\space in this documentclass}%
  \fi
  \gdef\cdr@altannexname{#1}%
  \if@francais
  \def\@cdrabstractlanguagext{english}%
  \gdef\cdr@annexname@english{#1}%
  \else
  \def\@cdrabstractlanguagext{french}%
  \gdef\cdr@annexname@french{#1}%
  \fi
  \@altabstractlanguage
  \begin{@genabstract}{altannex}{annex}%
}{%
  \ifx\@setabstract\relax \@setabstracta\par\bigskip \fi
}
% macro pour fichiers attach{\'e}s en plus du PDF...
\def\cdrattach#1{\url{\journalURL public/\CDRidart/#1}}
\def\cdrcouvattach#1{\url{\journalURL public/\CDRidvol/#1}}
%%%% support supplementary material
\let\cdr@supplements\@empty
\newcommand{\CDRsupplementary}[2][unknown]{%
  \ifx\@empty\cdr@supplements
    \gdef\cdr@supplements{\CDRsupplementsingle{\CDRsupplementwithtype{#1}{#2}}}%
  \else
    \g@addto@macro\cdr@supplements{\CDRsupplementsingle{\CDRsupplementwithtype{#1}{#2}}}%
  \fi
}
%%%%
\def\titlepage{%
  \clearpage
  \thispagestyle{empty}\setcounter{page}{0}}
\def\endtitlepage{\newpage}
\def\labelenumi{(\theenumi)}
\def\theenumi{\@arabic\c@enumi}
\def\labelenumii{(\theenumii)}
\def\theenumii{\@alph\c@enumii}
\def\p@enumii{\theenumi}
\def\labelenumiii{(\theenumiii)}
\def\theenumiii{\@roman\c@enumiii}
\def\p@enumiii{\theenumi(\theenumii)}
\def\labelenumiv{(\theenumiv)}
\def\theenumiv{\@Alph\c@enumiv}
\def\p@enumiv{\p@enumiii\theenumiii}
\def\labelitemi{$\m@th\bullet$}
\def\labelitemii{\bfseries --}% \upshape already done by \itemize
\def\labelitemiii{$\m@th\ast$}
\def\labelitemiv{$\m@th\cdot$}
\newenvironment{verse}{\let\\\@centercr
  \list{}{\itemsep\z@ \itemindent -1.5em\listparindent\itemindent
  \rightmargin\leftmargin \advance\leftmargin 1.5em}\item[]%
}{%
  \endlist
}
\let\endverse=\endlist % for efficiency
\newenvironment{quotation}{\list{}{%
    \leftmargin3pc \listparindent\normalparindent
    \itemindent\z@
    \rightmargin\leftmargin \parsep\z@ \@plus\p@}%
  \item[]%
}{%
  \endlist
}
\let\endquotation=\endlist % for efficiency
\newenvironment{quote}{%
  \list{}{\rightmargin\leftmargin}\item[]%
}{%
  \endlist
}
\let\endquote=\endlist % for efficiency
\def\trivlist{\parsep\parskip\@nmbrlistfalse
  \@trivlist \labelwidth\z@ \leftmargin\z@
  \itemindent\z@
  \let\@itemlabel\@empty
  \def\makelabel##1{\upshape##1}}
\renewenvironment{enumerate}{%
  \ifnum \@enumdepth >3 \@toodeep\else
      \advance\@enumdepth \@ne
      \edef\@enumctr{enum\romannumeral\the\@enumdepth}\list
      {\csname label\@enumctr\endcsname}{\usecounter
        {\@enumctr}\def\makelabel##1{\hss\llap{\upshape##1}}}\fi
}{%
  \endlist
}
\let\endenumerate=\endlist % for efficiency
\renewenvironment{itemize}{%
  \ifnum\@itemdepth>3 \@toodeep
  \else \advance\@itemdepth\@ne
    \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
    \list{\csname\@itemitem\endcsname}%
      {\def\makelabel##1{\hss\llap{\upshape##1}}}%
  \fi
}{%
  \endlist
}
\let\enditemize=\endlist % for efficiency
\newcommand{\descriptionlabel}[1]{\hspace\labelsep \upshape\bfseries #1:}
\newenvironment{description}{\list{}{%
  \advance\leftmargini6\p@ \itemindent-12\p@
  \labelwidth\z@ \let\makelabel\descriptionlabel}%
}{
  \endlist
}
\let\enddescription=\endlist % for efficiency
\let\upn=\textup
\AtBeginDocument{%
  \labelsep=5pt\relax
  \setcounter{enumi}{13}\setcounter{enumii}{13}%
  \setcounter{enumiii}{13}\setcounter{enumiv}{13}%
  \settowidth\leftmargini{\labelenumi\hskip\labelsep}%
  \advance\leftmargini by \normalparindent
  \settowidth\leftmarginii{\labelenumii\hskip\labelsep}%
  \settowidth\leftmarginiii{\labelenumiii\hskip\labelsep}%
  \settowidth\leftmarginiv{\labelenumiv\hskip\labelsep}%
  \setcounter{enumi}{0}\setcounter{enumii}{0}%
  \setcounter{enumiii}{0}\setcounter{enumiv}{0}%
  \leftmarginv=10pt  \leftmarginvi=\leftmarginv
  \leftmargin=\leftmargini
  \labelwidth=\leftmargini \advance\labelwidth-\labelsep
  \@listi}
\newskip\listisep
\listisep\smallskipamount
\newskip\bibitemsep
\bibitemsep\z@skip
\def\@listI{\leftmargin\leftmargini \parsep\z@skip
  \topsep\listisep \itemsep\z@skip
  \listparindent\normalparindent}
\let\@listi\@listI
\def\@listii{\leftmargin\leftmarginii
  \labelwidth\leftmarginii \advance\labelwidth-\labelsep
  \topsep\z@skip \parsep\z@skip \partopsep\z@skip \itemsep\z@skip}
\def\@listiii{\leftmargin\leftmarginiii
  \labelwidth\leftmarginiii \advance\labelwidth-\labelsep}
\def\@listiv{\leftmargin\leftmarginiv
  \labelwidth\leftmarginiv \advance\labelwidth-\labelsep}
\def\@listv{\leftmargin\leftmarginv
  \labelwidth\leftmarginv \advance\labelwidth-\labelsep}
\def\@listvi{\leftmargin\leftmarginvi
  \labelwidth\leftmarginvi \advance\labelwidth-\labelsep}
\@ifclasswith{\@classname}{fleqn}{%
  \let\@tempa\@iden
  \AtBeginDocument{\mathindent\leftmargini}%
}{\let\@tempa\@gobble}%
\@ifpackageloaded{amsmath}{\let\@tempa\@gobble}{%
  \@ifpackageloaded{amstex}{\let\@tempa\@gobble}{}%
}
\@tempa{%
  \def\[{\relax
    \ifmmode\@badmath
    \else
      \begin{trivlist}%
      \@beginparpenalty\predisplaypenalty
      \@endparpenalty\postdisplaypenalty
      \item[]\leavevmode
      \hbox to\linewidth\bgroup$\displaystyle
      \hskip\mathindent\bgroup
    \fi}%
  \def\]{\relax
    \ifmmode
      \egroup \m@th$\hfil \egroup
      \end{trivlist}%
    \else \@badmath
    \fi}%
  \renewenvironment{equation}{%
    \@beginparpenalty\predisplaypenalty
    \@endparpenalty\postdisplaypenalty
    \refstepcounter{equation}%
    \@topsep\abovedisplayskip \trivlist
    \item[]\leavevmode
    \hbox to\linewidth\bgroup\hskip\mathindent$\displaystyle
  }{%
    \m@th$\hfil \displaywidth\linewidth \hbox{\@eqnnum}\egroup
    \endtrivlist
  }%
  \renewenvironment{eqnarray}{%
    \stepcounter{equation}\let\@currentlabel\theequation
    \global\@eqnswtrue \global\@eqcnt\z@ \tabskip\mathindent
    \let\\=\@eqncr \abovedisplayskip\topsep
    \ifvmode \advance\abovedisplayskip\partopsep \fi
    \belowdisplayskip\abovedisplayskip
    \belowdisplayshortskip\abovedisplayskip
    \abovedisplayshortskip\abovedisplayskip
    $$\everycr{}\halign to\linewidth\bgroup
      \hskip\@centering
      $\displaystyle\tabskip\z@skip####\m@th$&%
      \@eqnsel \global\@eqcnt\@ne
      \hfil${}####{}\m@th$\hfil&%
      \global\@eqcnt\tw@
      $\displaystyle ####\m@th$\hfil\tabskip\@centering&%
      \global\@eqcnt\thr@@
      \hbox to \z@\bgroup\hss####\egroup\tabskip\z@skip\cr
    }{%
      \@@eqncr \egroup \global\advance\c@equation\m@ne$$%
      \global\@ignoretrue
    }%
  \newdimen\mathindent
  \mathindent\leftmargini
}
\def\@startsection#1#2#3#4#5#6{%
 \if@noskipsec \leavevmode \fi
 \par \@tempskipa #4\relax
 \@afterindenttrue
 \ifdim \@tempskipa <\z@ \@tempskipa -\@tempskipa \@afterindentfalse\fi
 \if@nobreak \everypar{}\else
     \addpenalty\@secpenalty\addvspace\@tempskipa\fi
 \@ifstar{\@dblarg{\@sect{#1}{\@m}{#3}{#4}{#5}{#6}}}%
         {\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}%
}
\def\@seccntformat#1{%
  \protect\textup{\protect\@secnumfont
    \csname the#1\endcsname
    \protect\@secnumpunct
  }%
}
\def\@secnumfont{\mdseries}
\def\@sect#1#2#3#4#5#6[#7]#8{%
  \edef\@toclevel{\ifnum#2=\@m 0\else\number#2\fi}%
  \ifnum #2>\c@secnumdepth \let\@secnumber\@empty
  \else \@xp\let\@xp\@secnumber\csname the#1\endcsname\fi
  \@tempskipa #5\relax
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
    \edef\@secnumpunct{%
      \ifdim\@tempskipa>\z@ % not a run-in section heading
        \@ifnotempty{#8}{.\@nx\enspace}%
      \else
        \@ifempty{#8}{.}{.\@nx\enspace}%
      \fi
    }%
    \@ifempty{#8}{%
      \ifnum #2=\tw@ \def\@secnumfont{\bfseries}\fi}{}%
    \protected@edef\@svsec{%
      \ifnum#2<\@m
        \@ifundefined{#1name}{}{%
          \ignorespaces\csname #1name\endcsname\space
        }%
      \fi
      \@seccntformat{#1}%
    }%
  \fi
  \ifdim \@tempskipa>\z@ % then this is not a run-in section heading
    \begingroup #6\relax
    \@hangfrom{\hskip #3\relax\@svsec}{\interlinepenalty\@M #8\par}%
    \endgroup
    \ifnum#2>\@m \else \@tocwrite{#1}{#8}\fi
  \else
  \def\@svsechd{#6\hskip #3\@svsec
    \@ifnotempty{#8}{\ignorespaces#8\unskip
       \@addpunct\cdr@secpoint}%
    \ifnum#2>\@m \else \@tocwrite{#1}{#8}\fi
  }%
  \fi
  \global\@nobreaktrue
  \@xsect{#5}}
\def\cdr@secpoint{.}
\let\@ssect\relax
\newcounter{part}
%% sections renum{\'e}rot{\'e}es {\`a} l'int{\'e}rieur des chapitres, si...
\ifcdr@chapters
\newcounter{chapter}
\ifcdr@sectioninchapters
\newcounter{section}[chapter]
\else
\newcounter{section}
\fi
\else
\newcounter{section}
\fi
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]
\newcounter{subparagraph}[paragraph]
\renewcommand\thepart          {\arabic{part}}
\renewcommand\thesection       {\arabic{section}}
\renewcommand\thesubsection    {\thesection.\arabic{subsection}}
\renewcommand\thesubsubsection {\thesubsection .\arabic{subsubsection}}
\renewcommand\theparagraph     {\thesubsubsection.\arabic{paragraph}}
\renewcommand\thesubparagraph  {\theparagraph.\arabic{subparagraph}}
\setcounter{secnumdepth}{3}
\def\partname{Part}
\def\part{\@startsection{part}{0}%
  \z@{\linespacing\@plus\linespacing}{.5\linespacing}%
  {\normalfont\bfseries\raggedright}}
\ifcdr@chapters
%   \def\chaptermark{%
%     \@secmark\markboth\chapterrunhead{}}%
\renewcommand\thechapter       {\arabic{chapter}}
\let\chapterrunhead\partrunhead
\let\sectionrunhead\partrunhead
\def\chapter{%
  {\clearpage{\pagestyle{empty}\cleardoublepage}}
  %\thispagestyle{plain}
  \global\@topnum\z@
  \@afterindenttrue \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{\refstepcounter{chapter}%
  \ifnum\c@secnumdepth<\z@ \let\@secnumber\@empty
  \else \let\@secnumber\thechapter \fi
  \typeout{\chaptername\space\@secnumber}%
  \def\@toclevel{0}%
  \ifx\chaptername\appendixname \@tocwriteb\tocappendix{chapter}{#2}%
  \else \@tocwriteb\tocchapter{chapter}{#2}\fi
%  \chaptermark{#1}%
  \addtocontents{lof}{\protect\addvspace{10\p@}}%
  \addtocontents{lot}{\protect\addvspace{10\p@}}%
  \@makechapterhead{#2}\@afterheading}
\def\@schapter#1{\typeout{#1}%
  \let\@secnumber\@empty
  \def\@toclevel{0}%
  \ifx\chaptername\appendixname \@tocwriteb\tocappendix{chapter}{#1}%
  \else \@tocwriteb\tocchapter{chapter}{#1}\fi
%  \chaptermark{#1}%
  \addtocontents{lof}{\protect\addvspace{10\p@}}%
  \addtocontents{lot}{\protect\addvspace{10\p@}}%
  \@makeschapterhead{#1}\@afterheading}
\newcommand\chaptername{Chapter}
\def\@makechapterhead#1{\vspace*{4.5pc}%
  \begingroup
  \huge\centering
    \ifnum\c@secnumdepth>\m@ne
      \leavevmode \hskip-\leftskip
      \rlap{\vbox to\z@{\vss
          \centerline{\large\mdseries
              \uppercase\@xp{\chaptername}\enspace\thechapter}
          \vskip 2.5pc}}\hskip\leftskip\fi
     #1\par \endgroup
  \skip@34\p@ \advance\skip@-\normalbaselineskip
  \vskip\skip@ }
\def\@makeschapterhead#1{\vspace*{4.5pc}%
  \begingroup
  \huge\centering
  #1\par \endgroup
  \skip@34\p@ \advance\skip@-\normalbaselineskip
  \vskip\skip@ }
\fi
\def\specialsection{\@startsection{section}{1}%
  \z@{\linespacing\@plus\linespacing}{.5\linespacing}%
  {\normalfont\centering}}
\def\section{\@startsection{section}{1}%
  \z@{.7\linespacing\@plus\linespacing}{.5\linespacing}%
  {\normalfont\scshape\centering}}
\def\subsection{\@startsection{subsection}{2}%
  \z@{.5\linespacing\@plus.7\linespacing}{-.5em}%
  {\normalfont\bfseries}}
\def\subsubsection{\@startsection{subsubsection}{3}%
  \z@{.5\linespacing\@plus.7\linespacing}{-.5em}%
  {\normalfont\itshape}}
\def\paragraph{\@startsection{paragraph}{4}%
  \z@\z@{-\fontdimen2\font}%
  \normalfont}
\def\subparagraph{\@startsection{subparagraph}{5}%
  \z@\z@{-\fontdimen2\font}%
  \normalfont}
\def\appendix{\par\c@section\z@ \c@subsection\z@
   \let\sectionname\appendixname
   \def\thesection{\@Alph\c@section}}
\def\appendixname{Appendix}
\def\@Roman#1{\@xp\@slowromancap
  \romannumeral#1@}%
\def\@slowromancap#1{\ifx @#1% then terminate
  \else
    \if i#1I\else\if v#1V\else\if x#1X\else\if l#1L\else\if
    c#1C\else\if m#1M\else#1\fi\fi\fi\fi\fi\fi
    \@xp\@slowromancap
  \fi
}
\newcommand{\@pnumwidth}{1.6em}
\newcommand{\@tocrmarg}{2.6em}
\setcounter{tocdepth}{2}
\newswitch{toc}
\newswitch{lof}
\newswitch{lot}
\newcommand\contentsnamefont{\scshape}
\def\@starttoc#1#2{\begingroup
  \setTrue{#1}%
  \par\removelastskip\vskip\z@skip
  \@startsection{}\@M\z@{\linespacing\@plus\linespacing}%
    {.5\linespacing}{\centering\contentsnamefont}{#2}%
  \ifx\contentsname#2%
  \else \addcontentsline{toc}{section}{#2}\fi
  \makeatletter
  \@input{\jobname.#1}%
  \if@filesw
    \@xp\newwrite\csname tf@#1\endcsname
    \immediate\@xp\openout\csname tf@#1\endcsname \jobname.#1\relax
  \fi
  \global\@nobreakfalse \endgroup
  \addvspace{32\p@\@plus14\p@}%
  \let\tableofcontents\relax
}
\def\contentsname{Contents}
\def\listfigurename{List of Figures}
\def\listtablename{List of Tables}
\def\tableofcontents{%
  \@starttoc{toc}\contentsname
}
\def\listoffigures{\@starttoc{lof}\listfigurename}
\def\listoftables{\@starttoc{lot}\listtablename}
\AtBeginDocument{%
  \@for\@tempa:=-1,0,1,2,3,4,5\do{%
    \@ifundefined{r@tocindent\@tempa}{%
      \@xp\gdef\csname r@tocindent\@tempa\endcsname{0pt}}{}%
  }%
}
\def\@writetocindents{%
  \begingroup
  \@for\@tempa:=-1,0,1,2,3,4,5\do{%
    \immediate\write\@auxout{%
      \string\newlabel{tocindent\@tempa}{%
        \csname r@tocindent\@tempa\endcsname}}%
  }%
  \endgroup}
\AtEndDocument{\@writetocindents}
%
\let\indentlabel\@empty
\def\@tochangmeasure#1{\sbox\z@{#1}%
  \ifdim\wd\z@>\csname r@tocindent\@toclevel\endcsname\relax
    \@xp\xdef\csname r@tocindent\@toclevel\endcsname{\the\wd\z@}%
  \fi
}
\def\@toclevel{0}
\def\@tocline#1#2#3#4#5#6#7{\relax
  \ifnum #1>\c@tocdepth % then omit
  \else
    \par \addpenalty\@secpenalty\addvspace{#2}%
    \begingroup \hyphenpenalty\@M
    \@ifempty{#4}{%
      \@tempdima\csname r@tocindent\number#1\endcsname\relax
    }{%
      \@tempdima#4\relax
    }%
    \parindent\z@ \leftskip#3\relax \advance\leftskip\@tempdima\relax
    \rightskip\@pnumwidth plus4em \parfillskip-\@pnumwidth
    #5\leavevmode\hskip-\@tempdima #6\nobreak\relax
    \hfil\hbox to\@pnumwidth{\@tocpagenum{#7}}\par
    \nobreak
    \endgroup
  \fi}
\def\@tocpagenum#1{\hss{\mdseries #1}}
\def\@tocwrite#1{\@xp\@tocwriteb\csname toc#1\endcsname{#1}}
\def\@tocwriteb#1#2#3{%
  \begingroup
    \def\@tocline##1##2##3##4##5##6{%
      \ifnum##1>\c@tocdepth
      \else \sbox\z@{##5\let\indentlabel\@tochangmeasure##6}\fi}%
    \csname l@#2\endcsname{#1{\csname#2name\endcsname}{\@secnumber}{}}%
  \endgroup
  \addcontentsline{toc}{#2}%
    {\protect#1{\csname#2name\endcsname}{\@secnumber}{#3}}}
\def\l@section{\@tocline{1}{0pt}{1pc}{}{}}
\newcommand{\tocsection}[3]{%
  \indentlabel{\@ifnotempty{#2}{\ignorespaces#1 #2.\quad}}#3}
\def\l@subsection{\@tocline{2}{0pt}{1pc}{5pc}{}}
\let\tocsubsection\tocsection
\def\l@subsubsection{\@tocline{3}{0pt}{1pc}{7pc}{}}
\let\tocsubsubsection\tocsection
\def\l@paragraph{\@tocline{4}{0pt}{1pc}{8pc}{}}
\let\tocparagraph\tocsection
\let\l@subparagraph\l@paragraph
\let\tocsubparagraph\tocsection
\def\l@part{\@tocline{-1}{12pt plus2pt}{0pt}{}{\bfseries}}
\let\tocpart\tocsection
\def\l@chapter{\@tocline{0}{8pt plus1pt}{0pt}{}{}}
\let\tocchapter\tocsection
\newcommand{\tocappendix}[3]{%
  \indentlabel{#1\@ifnotempty{#2}{ #2}.\quad}#3}
\def\l@figure{\@tocline{0}{3pt plus2pt}{0pt}{1.5pc}{}}
\let\l@table=\l@figure
\def\refname{References}
\def\bibname{Bibliography}
\def\@defaultbiblabelstyle#1{#1.}
\def\bibliographystyle#1{%
    \if@filesw\immediate\write\@auxout{\string\bibstyle{#1}}\fi
    \def\@tempa{#1}%
    \def\@tempb{amsplain}%
    \def\@tempc{}%
    \ifx\@tempa\@tempb
        \def\@biblabel##1{\@defaultbiblabelstyle{##1}}%
        \def\bibsetup{}%
    \else
        \def\bibsetup{\labelsep6\p@}%
        \ifx\@tempa\@tempc
            \def\@biblabel##1{}%
            \def\bibsetup{\labelwidth\z@ \leftmargin24\p@
                \itemindent-\leftmargin
                \labelsep\z@ }%
        \fi
    \fi}
\ifcdr@chapters
\def\@auxsection{\chapter}
\else
\def\@auxsection{\section}
\fi
\newcommand{\bibliofont}{\footnotesize}
\newcommand{\@bibtitlestyle}{%
  \@xp\@auxsection\@xp*\@xp{\refname}%
}
\let\@flatbib\@empty
%\newcount\smf@nthebib
\newdimen\smf@tempwidtha
\newdimen\smf@tempwidthb
%% nothebibliography: pas de texte imprim{\'e}, mais bib sauv{\'e}e pour tralics
\newenvironment{nothebibliography}[1]{%
%%% On r{\'e}cup{\`e}re le contenu de l'environnement dans @flatbib
\gdef\@genbibtext{}\def\cdr@tempb{nothebibliography}\@getgennobibtext
}{%
    \global\let\@flatbib\@genbibtext
}
\long\def\@getgennobibtext#1\end #2{%
  \@genabs=\expandafter{\@genbibtext}
  \def\@tempa{#2}\ifx\@tempa\cdr@tempb
     \@genabstokb={#1}%
     \def\@next{\end{nothebibliography}}%
  \else
     \@genabstokb={#1\end{#2}}%
     \let\@next\@getgenabstext
  \fi
  \global\edef\@genbibtext {\the\@genabs \the\@genabstokb}%
  \@next}
%% biblios
%% d{\'e}finition normale de la biblio, sans sauvegarde en XML
\newenvironment{thebibliography}[1]{%
  \@bibtitlestyle\ifcdr@hyperref\phantomsection\fi
  \normalfont\bibliofont\labelsep .5em\relax
  \renewcommand\theenumiv{\arabic{enumiv}}\let\p@enumiv\@empty
  \list{\@biblabel{\theenumiv}}{
%% ajustement largeur label SMF
\ifcdr@JEP
   \global\smf@tempwidtha 0pt
    \expandafter\ifx
        \csname r@maxlabelwd\endcsname
        \relax
        \settowidth\labelwidth{\@biblabel{#1}}%
    \else
         \expandafter\expandafter\expandafter\labelwidth
         \csname r@maxlabelwd\endcsname
    \fi
\else
\settowidth\labelwidth{\@biblabel{#1}}%
\fi
    \leftmargin\labelwidth \advance\leftmargin\labelsep\itemsep\bibitemsep
    \usecounter{enumiv}}%
  \sloppy \clubpenalty\@M \widowpenalty\clubpenalty
  \sfcode`\.=\@m
}{%
  \def\@noitemerr{\@latex@warning{Empty `thebibliography' environment}}%
  \endlist
\ifcdr@JEP
  \immediate\write\@auxout
     {\string\newlabel{maxlabelwd}{\the\smf@tempwidtha}}%
\fi
}
\ifCDRZeBib
\ifCDRxmlbib
\ifcdr@recup
% pas de texte imprim{\'e}, mais bib sauv{\'e}e pour tralics
\renewenvironment{thebibliography}[1]{%
%%% On r{\'e}cup{\`e}re le contenu de l'environnement dans @flatbib
\gdef\@genbibtext{}\def\cdr@tempb{thebibliography}\@getgenbibtext
}{%
    \global\let\@flatbib\@genbibtext
}
\else
%% flat bib dans le XML et dans le texte
\RequirePackage{placeins}
\renewenvironment{thebibliography}[1]{%
\FloatBarrier\par 
  \@bibtitlestyle\ifcdr@hyperref\phantomsection\fi
  \normalfont\bibliofont\labelsep .5em\relax
  \renewcommand\theenumiv{\arabic{enumiv}}\let\p@enumiv\@empty
  \list{\@biblabel{\theenumiv}}{%
%% ajustement largeur label SMF
\ifcdr@JEP
   \global\smf@tempwidtha 0pt
    \expandafter\ifx
        \csname r@maxlabelwd\endcsname
        \relax
        \settowidth\labelwidth{\@biblabel{#1}}%
    \else
         \expandafter\expandafter\expandafter\labelwidth
         \csname r@maxlabelwd\endcsname
    \fi
\else
\settowidth\labelwidth{\@biblabel{#1}}%
\fi
    \leftmargin\labelwidth \advance\leftmargin\labelsep\itemsep\bibitemsep
    \usecounter{enumiv}}%
  \sloppy \clubpenalty\@M \widowpenalty\clubpenalty
  \sfcode`\.=\@m
%%% On r{\'e}cup{\`e}re le contenu de l'environnement dans @flatbib
\gdef\@genbibtext{}\def\cdr@tempb{thebibliography}\@getgenbibtext
}{%
    \global\let\@flatbib\@genbibtext
% print the biblio 
\@genbibtext
  \def\@noitemerr{\@latex@warning{Empty `thebibliography' environment}}%
  \endlist
\ifcdr@JEP
  \immediate\write\@auxout
     {\string\newlabel{maxlabelwd}{\the\smf@tempwidtha}}%
\fi
}
\fi
\fi
% ZeBib
\fi
\long\def\@getgenbibtext#1\end #2{%
  \@genabs=\expandafter{\@genbibtext}
  \def\@tempa{#2}\ifx\@tempa\cdr@tempb
     \@genabstokb={#1}%
     \def\@next{\end{thebibliography}}%
  \else
     \@genabstokb={#1\end{#2}}%
     \let\@next\@getgenabstext
  \fi
  \global\edef\@genbibtext {\the\@genabs \the\@genabstokb}%
  \@next}
\def\bysame{\leavevmode\hbox to3em{\hrulefill}\thinspace}
\def\newblock{}
\newcommand\MR[1]{\relax\ifhmode\unskip\spacefactor3000 \space\fi
  MR~\MRhref{#1}{#1}}
\let\MRhref\@gobble
\newcommand\URL{\begingroup
  \def\@sverb##1{%
    \def\@tempa####1##1{\@URL{####1}\egroup\endgroup}%
    \@tempa}%
  \verb}
\let\URLhref\@gobble
\def\@URL#1{\URLhref{#1}#1}
\newif\if@restonecol
\newcommand{\@indextitlestyle}{%
  \twocolumn[\@xp\@auxsection\@xp*\@xp{\indexname}]%
}
\def\theindex{\@restonecoltrue\if@twocolumn\@restonecolfalse\fi
  \columnseprule\z@ \columnsep 35\p@
  \@indextitlestyle
  \thispagestyle{plain}%
  \let\item\@idxitem
  \parindent\z@  \parskip\z@\@plus.3\p@\relax
  \raggedright
  \hyphenpenalty\@M
  \footnotesize}
\def\indexname{Index}
\def\@idxitem{\par\hangindent 2em}
\def\subitem{\par\hangindent 2em\hspace*{1em}}
\def\subsubitem{\par\hangindent 3em\hspace*{2em}}
\def\endtheindex{\if@restonecol\onecolumn\else\clearpage\fi}
\def\indexspace{\par\bigskip}
\def\footnoterule{\kern-.4\p@
        \hrule\@width 5pc\kern11\p@\kern-\footnotesep}
%% on revient a la def latex standard pour eviter quelque pb
\def\@makefnmark{%
  \hbox{\@textsuperscript{\normalfont\@thefnmark}}}%
\def\@makefntext{\indent\@makefnmark}
\long\def\@footnotetext#1{%
  \insert\footins{%
    \normalfont\footnotesize
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep \splitmaxdepth \dp\strutbox
    \floatingpenalty\@MM \hsize\columnwidth
    \@parboxrestore \parindent\normalparindent \sloppy
    \protected@edef\@currentlabel{%
      \csname p@footnote\endcsname\@thefnmark}%
    \@makefntext{%
      \rule\z@\footnotesep\ignorespaces#1\unskip\strut\par}}}
\hfuzz=1pt \vfuzz=\hfuzz
\def\sloppy{\tolerance9999 \emergencystretch 3em\relax}
\setcounter{topnumber}{4}
\setcounter{bottomnumber}{4}
\setcounter{totalnumber}{4}
\setcounter{dbltopnumber}{4}
\renewcommand{\topfraction}{.97}
\renewcommand{\bottomfraction}{.97}
\renewcommand{\textfraction}{.03}
\renewcommand{\floatpagefraction}{.9}
\renewcommand{\dbltopfraction}{.97}
\renewcommand{\dblfloatpagefraction}{.9}
\setlength{\floatsep}{12pt plus 6pt minus 4pt}
\setlength{\textfloatsep}{15pt plus 8pt minus 5pt}
\setlength{\intextsep}{12pt plus 6pt minus 4pt}
\setlength{\dblfloatsep}{12pt plus 6pt minus 4pt}
\setlength{\dbltextfloatsep}{15pt plus 8pt minus 5pt}
\setlength{\@fptop}{0pt}% removed "plus 1fil"
\setlength{\@fpsep}{8pt}% removed "plus 2fil"
\setlength{\@fpbot}{0pt plus 1fil}
\setlength{\@dblfptop}{0pt}% removed "plus 1fil"
\setlength{\@dblfpsep}{8pt}% removed "plus 2fil"
\setlength{\@dblfpbot}{0pt plus 1fil}
\newcommand{\fps@figure}{tbp}
\newcommand{\fps@table}{tbp}
\newcounter{figure}
\def\@captionheadfont{\scshape}
\def\@captionfont{\normalfont}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\ \thefigure}
\def\figurename{Figure}
\newenvironment{figure}{%
  \@float{figure}%
}{%
  \end@float
}
\newenvironment{figure*}{%
  \@dblfloat{figure}%
}{%
  \end@dblfloat
}
\newcounter{table}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\ \thetable}
\def\tablename{Table}
\newenvironment{table}{%
  \@float{table}%
}{%
  \end@float
}
\newenvironment{table*}{%
  \@dblfloat{table}%
}{%
  \end@dblfloat
}
\def\@floatboxreset{\global\@minipagefalse \centering}
\long\def\@makecaption#1#2{%
  \setbox\@tempboxa\vbox{\color@setgroup
    \advance\hsize-2\captionindent\noindent
    \@captionfont\@captionheadfont#1%
    \def\cdr@tmp@{\ignorespaces \ifHy@nesting \hyper@@anchor {\@currentHref }{}\else
      \Hy@raisedlink {\hyper@@anchor {\@currentHref }{\relax }}\fi}%
    \def\cdr@tmp@@{#2}%
%    \@xp\ifx\csname hyper@@anchor\endcsname\relax
    \ifx\cdr@tmp@@\cdr@tmp@\cdr@tmp@\else
    \def\cdr@tmp@{\ignorespaces}%
    \ifx\cdr@tmp@@\cdr@tmp@\else% \@xp\@ifnotempty\@xp{\@cdr#2\@nil}{
    \captionseparator\@captionfont\cdr@up\enspace#2
    \fi\fi
    \unskip\kern-2\captionindent\par
    \global\setbox\@ne\lastbox\color@endgroup}%
  \ifhbox\@ne % the normal case
    \setbox\@ne\hbox{\unhbox\@ne\unskip\unskip\unpenalty\unkern}%
  \fi
  \ifdim\wd\@tempboxa=\z@ % this means caption will fit on one line
    \setbox\@ne\hbox to\columnwidth{\hss\kern-2\captionindent\box\@ne\hss}%
  \else % tempboxa contained more than one line
    \setbox\@ne\vbox{\unvbox\@tempboxa\parskip\z@skip
        \noindent\unhbox\@ne\advance\hsize-2\captionindent\par}%
  \fi
  \ifnum\@tempcnta<64 % if the float IS a figure...
    \addvspace\abovecaptionskip
    \hbox to\hsize{\kern\captionindent\box\@ne\hss}%
  \else % if the float IS NOT a figure...
    \hbox to\hsize{\kern\captionindent\box\@ne\hss}%
    \nobreak
    \vskip\belowcaptionskip
  \fi
\relax
}
\def\captionseparator{.}\def\cdr@up{\upshape}
\newskip\abovecaptionskip \abovecaptionskip=12pt \relax
\newskip\belowcaptionskip \belowcaptionskip=12pt \relax
\newdimen\captionindent \captionindent=3pc
\def\nonbreakingspace{\unskip\nobreak\ \ignorespaces}
\def~{\protect\nonbreakingspace}
\def\@biblabel#1{\@ifnotempty{#1}{[#1]}}
\def\@citestyle{\m@th\upshape\mdseries}
\let\citeform\@firstofone
\def\@cite#1#2{{%
  \@citestyle[\citeform{#1}\if@tempswa, #2\fi]}}
\@ifundefined{cite }{%
  \expandafter\let\csname cite \endcsname\cite
  \edef\cite{\@nx\protect\@xp\@nx\csname cite \endcsname}%
}{}
\def\fullwidthdisplay{\displayindent\z@ \displaywidth\columnwidth}
\edef\@tempa{\noexpand\fullwidthdisplay\the\everydisplay}
\everydisplay\expandafter{\@tempa}
\newcommand*\seeonlyname{see}
\newcommand*\seename{see also}
\newcommand*\alsoname{see also}
\newcommand*\seeonly[2]{\emph{\seeonlyname} #1}
\newcommand*\see[2]{\emph{\seename} #1}
\newcommand*\seealso[2]{\emph{\alsoname} #1}
\newcommand\printindex{\@input{\jobname.ind}}
\DeclareRobustCommand\textprime{\leavevmode
  \raise.8ex\hbox{\check@mathfonts\the\scriptfont2 \char48 }}
%
\begingroup
  \catcode`P=12
  \catcode`T=12
  \lowercase{
    \def\x{\def\rem@apt##1.##2PT{##1}}}
  \expandafter\endgroup\x
\def\strip@apt{\expandafter\rem@apt\the}
\newcommand{\theoremstyle}[1]{%
  \@ifundefined{th@#1}{%
    \PackageWarning{amsthm}{Unknown theoremstyle `#1'}%
    \thm@style{plain}%
  }{%
    \thm@style{#1}%
  }%
}
\newtoks\thm@style
\thm@style{plain}
\newtoks\thm@bodyfont  \thm@bodyfont{\itshape}
\newtoks\thm@headfont  \thm@headfont{\bfseries}
\newtoks\thm@notefont  \thm@notefont{}
\newtoks\thm@headpunct \thm@headpunct{.}
\newskip\thm@preskip \newskip\thm@postskip
\def\thm@space@setup{%
  \thm@preskip=.5\baselineskip\@plus.2\baselineskip
                             \@minus.2\baselineskip
  \thm@postskip=\thm@preskip
}
\renewcommand{\newtheorem}{\@ifstar{\@xnthm *}{\@xnthm \relax}}
\def\@xnthm#1#2{%
  \let\@tempa\relax
  \@xp\@ifdefinable\csname #2\endcsname{%
    \global\@xp\let\csname end#2\endcsname\@endtheorem
    \ifx *#1% unnumbered, need to get one more mandatory arg
      \edef\@tempa##1{%
        \gdef\@xp\@nx\csname#2\endcsname{%
          \@nx\@thm{\@xp\@nx\csname th@\the\thm@style\endcsname}%
            {}{##1}}}%
    \else % numbered theorem, need to check for optional arg
      \def\@tempa{\@oparg{\@ynthm{#2}}[]}%
    \fi
  }%
  \@tempa
}
\def\@ynthm#1[#2]#3{%
  \ifx\relax#2\relax
    \def\@tempa{\@oparg{\@xthm{#1}{#3}}[]}%
  \else
    \@ifundefined{c@#2}{%
      \def\@tempa{\@nocounterr{#2}}%
    }{%
      \@xp\xdef\csname the#1\endcsname{\@xp\@nx\csname the#2\endcsname}%
      \toks@{#3}%
      \@xp\xdef\csname#1\endcsname{%
        \@nx\@thm{%
          \let\@nx\thm@swap
            \if S\thm@swap\@nx\@firstoftwo\else\@nx\@gobble\fi
          \@xp\@nx\csname th@\the\thm@style\endcsname}%
            {#2}{\the\toks@}}%
      \let\@tempa\relax
    }%
  \fi
  \@tempa
}
\def\@xthm#1#2[#3]{%
  \ifx\relax#3\relax
    \newcounter{#1}%
  \else
    \newcounter{#1}[#3]%
    \@xp\xdef\csname the#1\endcsname{\@xp\@nx\csname the#3\endcsname
      \@thmcountersep\@thmcounter{#1}}%
  \fi
  \toks@{#2}%
  \@xp\xdef\csname#1\endcsname{%
    \@nx\@thm{%
      \let\@nx\thm@swap
        \if S\thm@swap\@nx\@firstoftwo\else\@nx\@gobble\fi
      \@xp\@nx\csname th@\the\thm@style\endcsname}%
      {#1}{\the\toks@}}%
}
\def\@thm#1#2#3{%
  \ifhmode\unskip\unskip\par\fi
  \normalfont
  \trivlist
  \let\thmheadnl\relax
  \let\thm@swap\@gobble
  \let\thm@indent\noindent % no indent
  \thm@headfont{\bfseries}% heading font bold
  \thm@notefont{\fontseries\mddefault\upshape}%
  \thm@headpunct{.}% add period after heading
  \thm@headsep 5\p@ plus\p@ minus\p@\relax
  \thm@space@setup
  #1% style overrides
  \@topsep \thm@preskip               % used by thm head
  \@topsepadd \thm@postskip           % used by \@endparenv
  \def\@tempa{#2}\ifx\@empty\@tempa
    \def\@tempa{\@oparg{\@begintheorem{#3}{}}[]}%
  \else
    \refstepcounter{#2}%
    \def\@tempa{\@oparg{\@begintheorem{#3}{\csname the#2\endcsname}}[]}%
  \fi
  \@tempa
}
\def\@restorelabelsep{\relax}
\let\@ythm\relax
\let\thmname\@iden \let\thmnote\@iden \let\thmnumber\@iden
\providecommand\@upn{\textup}
\def\thmhead@plain#1#2#3{%
  \thmname{#1}\thmnumber{\@ifnotempty{#1}{ }\@upn{#2}}%
  \thmnote{ {\the\thm@notefont(#3)}}}
\let\thmhead\thmhead@plain
\def\swappedhead#1#2#3{%
  \thmnumber{\@upn{\@secnumfont#2\@ifnotempty{#1}{.~}}}%
  \thmname{#1}%
  \thmnote{ {\the\thm@notefont(#3)}}}
\let\swappedhead@plain=\swappedhead
\let\thmheadnl\relax
\let\thm@indent\noindent
\let\thm@swap\@gobble
\def\@begintheorem#1#2[#3]{%
  \deferred@thm@head{\the\thm@headfont \thm@indent
    \@ifempty{#1}{\let\thmname\@gobble}{\let\thmname\@iden}%
    \@ifempty{#2}{\let\thmnumber\@gobble}{\let\thmnumber\@iden}%
    \@ifempty{#3}{\let\thmnote\@gobble}{\let\thmnote\@iden}%
    \thm@swap\swappedhead\thmhead{#1}{#2}{#3}%
    \the\thm@headpunct
    \thmheadnl % possibly a newline.
    \hskip\thm@headsep
  }%
  \ignorespaces}
\newskip\thm@headsep
\thm@headsep=5pt plus1pt minus1pt\relax
\let\adjust@parskip@nobreak=\@nbitem
\newtoks\dth@everypar
\dth@everypar={%
  \@minipagefalse \global\@newlistfalse
  \@noparitemfalse
  \if@inlabel
    \global\@inlabelfalse
    \begingroup \setbox\z@\lastbox
     \ifvoid\z@ \kern-\itemindent \fi
    \endgroup
    \unhbox\@labels
  \fi
  \if@nobreak \@nobreakfalse \clubpenalty\@M
  \else \clubpenalty\@clubpenalty \everypar{}%
  \fi
}%
\def\deferred@thm@head#1{%
  \if@inlabel \indent \par \fi % eject a section head if one is pending
  \if@nobreak
    \adjust@parskip@nobreak
  \else
    \addpenalty\@beginparpenalty
    \addvspace\@topsep
    \addvspace{-\parskip}%
  \fi
  \global\@inlabeltrue
  \everypar\dth@everypar
  \sbox\@labels{\normalfont#1}%
  \ignorespaces
}
\def\nonslanted{\relax
  \@xp\let\@xp\@tempa\csname\f@shape shape\endcsname
  \ifx\@tempa\itshape\upshape
  \else\ifx\@tempa\slshape\upshape\fi\fi}
\def\swapnumbers{\edef\thm@swap{\if S\thm@swap N\else S\fi}}
\def\thm@swap{N}%
\let\@opargbegintheorem\relax
\def\th@plain{%
%%  \let\thm@indent\noindent % no indent
%%  \thm@headfont{\bfseries}% heading font is bold
%%  \thm@notefont{}% same as heading font
%%  \thm@headpunct{.}% add period after heading
%%  \let\thm@swap\@gobble
%%  \thm@preskip\topsep
%%  \thm@postskip\theorempreskipamount
  \itshape % body font
}
\def\th@definition{%
  \normalfont % body font
}
\def\th@remark{%
  \thm@headfont{\itshape}%
  \normalfont % body font
}
\def\@endtheorem{\endtrivlist\@endpefalse }
\newcommand{\newtheoremstyle}[9]{%
  \@ifempty{#5}{\dimen@\z@skip}{\dimen@#5\relax}%
  \ifdim\dimen@=\z@
    \toks@{#4\let\thm@indent\noindent}%
  \else
    \toks@{#4\def\thm@indent{\noindent\hbox to#5{}}}%
  \fi
  \def\@tempa{#8}\ifx\space\@tempa
    \toks@\@xp{\the\toks@ \thm@headsep\fontdimen\tw@\font\relax}%
  \else
    \def\@tempb{\newline}%
    \ifx\@tempb\@tempa
      \toks@\@xp{\the\toks@ \thm@headsep\z@skip
        \def\thmheadnl{\newline}}%
    \else
      \toks@\@xp{\the\toks@ \thm@headsep#8\relax}%
    \fi
  \fi
  \begingroup
  \thm@space@setup
  \@defaultunits\@tempskipa#2\thm@preskip\relax\@nnil
  \@defaultunits\@tempskipb#3\thm@postskip\relax\@nnil
  \xdef\@gtempa{\thm@preskip\the\@tempskipa
    \thm@postskip\the\@tempskipb\relax}%
  \endgroup
  \@temptokena\@xp{\@gtempa
    \thm@headfont{#6}\thm@headpunct{#7}%
  }%
  \@ifempty{#9}{%
    \let\thmhead\thmhead@plain
  }{%
    \@namedef{thmhead@#1}##1##2##3{#9}%
    \@temptokena\@xp{\the\@temptokena
      \@xp\let\@xp\thmhead\csname thmhead@#1\endcsname}%
  }%
  \@xp\xdef\csname th@#1\endcsname{\the\toks@ \the\@temptokena}%
}
\DeclareRobustCommand{\qed}{%
  \ifmmode \mathqed
  \else
    \leavevmode\unskip\penalty9999 \hbox{}\nobreak\hfill
    \quad\hbox{\qedsymbol}%
  \fi
}
\let\QED@stack\@empty
\let\qed@elt\relax
\newcommand{\pushQED}[1]{%
  \toks@{\qed@elt{#1}}\@temptokena\expandafter{\QED@stack}%
  \xdef\QED@stack{\the\toks@\the\@temptokena}%
}
\newcommand{\popQED}{%
  \begingroup\let\qed@elt\popQED@elt \QED@stack\relax\relax\endgroup
}
\def\popQED@elt#1#2\relax{#1\gdef\QED@stack{#2}}
\newcommand{\qedhere}{%
  \begingroup \let\mathqed\math@qedhere
    \let\qed@elt\setQED@elt \QED@stack\relax\relax \endgroup
}
\newif\ifmeasuring@
\newif\iffirstchoice@ \firstchoice@true
\def\setQED@elt#1#2\relax{%
  \ifmeasuring@
  \else \iffirstchoice@ \gdef\QED@stack{\qed@elt{}#2}\fi
  \fi
  #1%
}
\def\qed@warning{%
  \PackageWarning{amsthm}{The \@nx\qedhere command may not work
    correctly here}%
}
\newcommand{\mathqed}{\quad\hbox{\qedsymbol}}
\def\linebox@qed{\hfil\hbox{\qedsymbol}\hfilneg}
\@ifpackageloaded{amsmath}{%
  \def\math@qedhere{%
    \@ifundefined{\@currenvir @qed}{%
      \qed@warning\quad\hbox{\qedsymbol}%
    }{%
      \@xp\aftergroup\csname\@currenvir @qed\endcsname
    }%
  }
  \def\displaymath@qed{%
    \relax
    \ifmmode
      \ifinner \aftergroup\linebox@qed
      \else
        \eqno
        \let\eqno\relax \let\leqno\relax \let\veqno\relax
        \hbox{\qedsymbol}%
      \fi
    \else
       \aftergroup\linebox@qed
    \fi
  }
  \@xp\let\csname equation*@qed\endcsname\displaymath@qed
  \def\equation@qed{%
    \iftagsleft@
      \hbox{\phantom{\quad\qedsymbol}}%
      \gdef\alt@tag{%
        \rlap{\hbox to\displaywidth{\hfil\qedsymbol}}%
        \global\let\alt@tag\@empty
      }%
    \else
      \gdef\alt@tag{%
        \global\let\alt@tag\@empty
        \vtop{\ialign{\hfil####\cr
                \tagform@\theequation\cr
                \qedsymbol\cr}}%
        \setbox\z@
      }%
    \fi
  }
  \def\qed@tag{%
    \global\tag@true \nonumber
    &\omit\setboxz@h {\strut@ \qedsymbol}\tagsleft@false
    \place@tag@gather
    \kern-\tabskip
    \ifst@rred \else \global\@eqnswtrue \fi \global\advance\row@\@ne \cr
  }
  \def\split@qed{%
    \def\endsplit{\crcr\egroup \egroup \ctagsplit@false \rendsplit@
      \aftergroup\align@qed
    }%
  }
  \def\align@qed{%
    \ifmeasuring@ \tag*{\qedsymbol}%
    \else \let\math@cr@@@\qed@tag
    \fi
  }
  \@xp\let\csname align*@qed\endcsname\align@qed
  \@xp\let\csname gather*@qed\endcsname\align@qed
%% Needs some patching up for amsmath 1.2
}{% end of amsmath branch, start plain LaTeX branch
  \def\math@qedhere{%
    \@ifundefined{\@currenvir @qed}{%
      \qed@warning \aftergroup\displaymath@qed
    }{%
      \@xp\aftergroup\csname\@currenvir @qed\endcsname
    }%
  }
  \def\displaymath@qed{%
    \relax
    \ifmmode
      \ifinner \aftergroup\aftergroup\aftergroup\linebox@qed
      \else
        \eqno \def\@badmath{$$}%
        \let\eqno\relax \let\leqno\relax \let\veqno\relax
        \hbox{\qedsymbol}%
      \fi
    \else
       \aftergroup\linebox@qed
    \fi
  }
  \@ifundefined{ver@leqno.clo}{%
    \def\equation@qed{\displaymath@qed \quad}%
  }{%
    \def\equation@qed{\displaymath@qed}%
  }
  \def\@tempa#1$#2#3\@nil{%
    \def\[{#1$#2\def\@currenvir{displaymath}#3}%
  }%
  \expandafter\@tempa\[\@nil
}
\@ifpackageloaded{amstex}{%
  \def\@tempa{TT}%
}{%
  \@ifpackageloaded{amsmath}{%
    \def\@tempb#1 v#2.#3\@nil{#2}%
    \ifnum\@xp\@xp\@xp\@tempb\csname ver@amsmath.sty\endcsname v0.0\@nil
       <\tw@
      \def\@tempa{TT}%
    \else
      \def\@tempa{TF}%
    \fi
  }{%
    \def\@tempa{TF}
  }%
}
\if\@tempa
  \renewcommand{\math@qedhere}{\quad\hbox{\qedsymbol}}%
\fi
\newcommand{\openbox}{\leavevmode
  \hbox to.77778em{%
  \hfil\vrule
  \vbox to.675em{\hrule width.6em\vfil\hrule}%
  \vrule\hfil}}
\DeclareRobustCommand{\textsquare}{%
  \begingroup \usefont{U}{msa}{m}{n}\thr@@\endgroup
}
\@ifclasswith{\@classname}{noamsfonts}{%
  \providecommand{\qedsymbol}{\openbox}%
}{}
\providecommand{\qedsymbol}{\textsquare}
\def\cdr@proofpunct{.}
\def\cdr@proofindent{\labelsep}
\newenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\cdr@proofindent
        \itshape
    #1\@addpunct{\cdr@proofpunct}]\ignorespaces
}{%
  \popQED\endtrivlist\@endpefalse
}
\providecommand{\proofname}{Proof}
\def\bb@skip#1{%
  \skip@#1\relax \advance\skip@-\prevdepth \advance\skip@-\baselineskip
  \vskip\skip@}
\def\markleft#1{{\let\protect\noexpand
    \let\label\relax \let\index\relax \let\glossary\relax
    \expandafter\@markleft\@themark{#1}%
    \mark{\@themark}}%
  \if@nobreak\ifvmode\nobreak\fi\fi}
\def\@markleft#1#2#3{\gdef\@themark{{#3}{#2}}}
\def\@tempa{}
\edef\@dh{%
  \noexpand\mathhexbox{\hexnumber@\symAMSb}67}
\DeclareTextCommand{\dh}{OT1}{%
  \edef\@tempb{\scdefault}%
  \ifx\f@shape\@tempb
    \leavevmode
    \raisebox{-.8ex}{\makebox[\z@][l]{\hskip-.08em\accent"16\hss}}d%
  \else
    \@dh
  \fi
}
%
\def\cdr@thmdefs{}
\def\cdr@enoncedef{}
\def\cdr@thmeqs{}
\def\equalenv#1#2{%
\@ifundefined{#1}%
%\@xp\ifx\csname #1\endcsname\undefined
{\newenvironment{#1}{\begin{#2}}{\end{#2}}}%
{\ClassWarningNoLine{\@classname}{%
 #1 already defined: I won't redefine it!}}}
\newif\ifcdr@thmsin\cdr@thmsintrue
\newif\ifcdr@thmsas\cdr@thmsasfalse
\newif\ifcdr@thm@necounter\cdr@thm@necounterfalse
\ifcdr@cdrthmdefs
%% Th{\'e}or{\`e}mes pr{\'e}d{\'e}finis (piqu{\'e} {\`a} smfthm)
\def\OneNumberAllTheorems{\cdr@thm@necountertrue}
\def\NumberTheoremsIn#1{\@ifempty{#1}%
     {\cdr@thmsinfalse}%
     {\@ifundefined{c@#1}{\@nocounterr{#1}}%
       {\cdr@thmsintrue\cdr@thmsasfalse\def\@NumberTheorems{#1}}}}
  \NumberTheoremsIn{section}%
\def\NumberTheoremsAs#1{\@ifempty{#1}%
     {\cdr@thmsasfalse}%
     {\@ifundefined{c@#1}{\@nocounterr{#1}}%
       {\cdr@thmsinfalse\cdr@thmsastrue\cdr@thm@necountertrue\def\@NumberTheorems{#1}}}}
  \NumberTheoremsAs{}%
\def\SwapTheoremNumbers{\def\thm@swap{S}}
\def\NoSwapTheoremNumbers{\def\thm@swap{N}}
  \NoSwapTheoremNumbers
\def\cdr@thmdefs{%
  \theoremstyle{plain}
  \ifcdr@thm@necounter
  \ifcdr@thmsin
  \newcounter{cdrthm}[\@NumberTheorems]%
  \xdef\thecdrthm
         {\expandafter\noexpand\csname the\@NumberTheorems\endcsname
           \@thmcountersep\@thmcounter{cdrthm}}%
    \gdef\cdr@thm{cdrthm}%     
    \else
    \ifcdr@thmsas
    \xdef\cdr@thm{\@NumberTheorems}%
    \else
    \newcounter{cdrthm}%
    \gdef\cdr@thm{cdrthm}%     
    \fi\fi\fi
\ifcdr@thm@necounter
  \newtheorem{theo}[\cdr@thm]{\theoname}%
  \newtheorem{prop}[\cdr@thm]{\propname}%
  \newtheorem{conj}[\cdr@thm]{\conjname}%
  \newtheorem{ques}[\cdr@thm]{\quesname}%
  \newtheorem{coro}[\cdr@thm]{\coroname}%
  \newtheorem{lemm}[\cdr@thm]{\lemmname}%
  \theoremstyle{definition}%
  \newtheorem{defi}[\cdr@thm]{\definame}%
  \theoremstyle{remark}%
  \newtheorem{nota}[\cdr@thm]{\notaname}%
  \newtheorem{notas}[\cdr@thm]{\notasname}%
  \newtheorem{rema}[\cdr@thm]{\remaname}%
  \newtheorem{remas}[\cdr@thm]{\remasname}%
  \newtheorem{exam}[\cdr@thm]{\examname}%
  \newtheorem{exams}[\cdr@thm]{\examsname}%
\else
\ifcdr@thmsin
  \newtheorem{theo}{\theoname}[\@NumberTheorems]%
  \newtheorem{prop}{\propname}[\@NumberTheorems]%
  \newtheorem{conj}{\conjname}[\@NumberTheorems]%
  \newtheorem{ques}{\quesname}[\@NumberTheorems]%
  \newtheorem{coro}{\coroname}[\@NumberTheorems]%
  \newtheorem{lemm}{\lemmname}[\@NumberTheorems]%
  \theoremstyle{definition}%
  \newtheorem{defi}{\definame}[\@NumberTheorems]%
  \theoremstyle{remark}%
  \newtheorem{nota}{\notaname}[\@NumberTheorems]%
  \newtheorem{notas}{\notasname}[\@NumberTheorems]%
  \newtheorem{rema}{\remaname}[\@NumberTheorems]%
  \newtheorem{remas}{\remasname}[\@NumberTheorems]%
  \newtheorem{exam}{\examname}[\@NumberTheorems]%
  \newtheorem{exams}{\examsname}[\@NumberTheorems]%
\else
  \newtheorem{theo}{\theoname}%
  \newtheorem{prop}{\propname}%
  \newtheorem{conj}{\conjname}%
  \newtheorem{ques}{\quesname}%
  \newtheorem{coro}{\coroname}%
  \newtheorem{lemm}{\lemmname}%
  \theoremstyle{definition}%
  \newtheorem{defi}{\definame}%
  \theoremstyle{remark}%
  \newtheorem{nota}{\notaname}%
  \newtheorem{notas}{\notasname}%
  \newtheorem{rema}{\remaname}%
  \newtheorem{remas}{\remasname}%
  \newtheorem{exam}{\examname}%
  \newtheorem{exams}{\examsname}%
\fi\fi
  \theoremstyle{definition}%
  \newtheorem*{defi*}{\definame}%
  \theoremstyle{remark}%
  \newtheorem*{nota*}{\notaname}%
  \newtheorem*{notas*}{\notasname}%
  \newtheorem*{rema*}{\remaname}%
  \newtheorem*{remas*}{\remasname}%
  \newtheorem*{exam*}{\examname}%
  \newtheorem*{exams*}{\examsname}%
  \theoremstyle{plain}%
  \newtheorem*{theo*}{\theoname}%
  \newtheorem*{prop*}{\propname}%
  \newtheorem*{conj*}{\conjname}%
  \newtheorem*{ques*}{\quesname}%
  \newtheorem*{coro*}{\coroname}%
  \newtheorem*{lemm*}{\lemmname}%
}
\def\cdr@enoncedef{%
 \newenvironment{enonce}[2][plain]%
    {\let\cdrenonce\relax \theoremstyle{##1}%
      \ifcdr@thm@necounter
      \newtheorem{cdrenonce}[\cdr@thm]{##2}%
      \else
      \ifcdr@thmsin
      \newtheorem{cdrenonce}{##2}[\@NumberTheorems]%
      \else
      \newtheorem{cdrenonce}{##2}%
      \fi\fi
     \begin{cdrenonce}}%
    {\end{cdrenonce}}%
 \newenvironment{enonce*}[2][plain]%
    {\let\cdrenonce\relax \theoremstyle{##1}%
     \newtheorem*{cdrenonce}{##2}%
     \begin{cdrenonce}}%
    {\end{cdrenonce}}%
}
\AtBeginDocument{%
\cdr@thmdefs
\cdr@enoncedef
\cdr@thmeqs}
%
% Compatibilit{\'e} AMBP...?
\def\cdr@thmeqs{%
\equalenv{theorem}{theo}
\equalenv{thm}{theo}
\equalenv{thm*}{theo*}
\equalenv{conjecture}{conj}
\equalenv{question}{ques}
\equalenv{lemma}{lemm}
\equalenv{Remark}{rema}
\equalenv{Remarks}{remas}
\equalenv{corollary}{coro}
\equalenv{proposition}{prop}
\equalenv{definition}{defi}
\equalenv{remark}{rema}
\equalenv{remarks}{remas}
\equalenv{notation}{nota}
\equalenv{example}{exam}
\equalenv{Theoreme}{theo}
\equalenv{theoreme}{theo}
\equalenv{Lemme}{lemm}
\equalenv{lemme}{lemm}
\equalenv{Remarque}{rema}
\equalenv{remarque}{rema}
\equalenv{Remarques}{remas}
\equalenv{remarques}{remas}
\equalenv{Corollaire}{coro}
\equalenv{corollaire}{coro}
\equalenv{Proposition}{prop}
\equalenv{Definition}{defi}
\equalenv{Notation}{nota}
\equalenv{exem}{exam}
\equalenv{exems}{exams}
\equalenv{Exemple}{exam}
\equalenv{exemple}{exam}
\equalenv{Proof}{proof}
\equalenv{Preuve}{proof}}
%
%Fin thms 
\fi
%
\def\propname{Proposition}%
\def\conjname{Conjecture}%
\def\quesname{Question}%
\def\notaname{Notation}%
\if@francais
\def\notasname{Notations}%
\def\theoname{Th{\'e}or{\`e}me}%
\def\coroname{Corollaire}%
\def\lemmname{Lemme}%
\def\definame{D{\'e}finition}%
\def\remaname{Remarque}%
\def\remasname{Remarques}%
\def\examname{Exemple}%
\def\examsname{Exemples}%
\else
\def\notasname{Notation}%
\def\theoname{Theorem}%
\def\coroname{Corollary}%
\def\lemmname{Lemma}%
\def\definame{Definition}%
\def\remaname{Remark}%
\def\remasname{Remarks}%
\def\examname{Example}%
\def\examsname{Examples}%
\fi
%
\DeclareTextCommand{\DH}{OT1}{%
  \leavevmode\raisebox{-.5ex}{\makebox[\z@][l]{\hskip-.07em\accent"16\hss}}D}
\DeclareTextCommand{\DJ}{OT1}{%
  \leavevmode\raisebox{-.5ex}{\makebox[\z@][l]{\hskip-.07em\accent"16\hss}}D}
\DeclareTextCommand{\dj}{OT1}{%
  \edef\@tempa{\f@shape}\edef\@tempb{\scdefault}%
  \ifx\@tempa\@tempb
    \leavevmode
    \raisebox{-.75ex}{\makebox[\z@][l]{\hskip-.08em\accent"16\hss}}d%
  \else
    \leavevmode\raisebox{.02ex}{\makebox[\z@][l]{\hskip.1em\accent"16\hss}}d%
  \fi}
\hyphenation{acad-e-my acad-e-mies af-ter-thought anom-aly anom-alies
an-ti-deriv-a-tive an-tin-o-my an-tin-o-mies apoth-e-o-ses
apoth-e-o-sis ap-pen-dix ar-che-typ-al as-sign-a-ble as-sist-ant-ship
as-ymp-tot-ic asyn-chro-nous at-trib-uted at-trib-ut-able bank-rupt
bank-rupt-cy bi-dif-fer-en-tial blue-print busier busiest
cat-a-stroph-ic cat-a-stroph-i-cally con-gress cross-hatched data-base
de-fin-i-tive de-riv-a-tive dis-trib-ute dri-ver dri-vers eco-nom-ics
econ-o-mist elit-ist equi-vari-ant ex-quis-ite ex-tra-or-di-nary
flow-chart for-mi-da-ble forth-right friv-o-lous ge-o-des-ic
ge-o-det-ic geo-met-ric griev-ance griev-ous griev-ous-ly
hexa-dec-i-mal ho-lo-no-my ho-mo-thetic ideals idio-syn-crasy
in-fin-ite-ly in-fin-i-tes-i-mal ir-rev-o-ca-ble key-stroke
lam-en-ta-ble light-weight mal-a-prop-ism man-u-script mar-gin-al
meta-bol-ic me-tab-o-lism meta-lan-guage me-trop-o-lis
met-ro-pol-i-tan mi-nut-est mol-e-cule mono-chrome mono-pole
mo-nop-oly mono-spline mo-not-o-nous mul-ti-fac-eted mul-ti-plic-able
non-euclid-ean non-iso-mor-phic non-smooth par-a-digm par-a-bol-ic
pa-rab-o-loid pa-ram-e-trize para-mount pen-ta-gon phe-nom-e-non
post-script pre-am-ble pro-ce-dur-al pro-hib-i-tive pro-hib-i-tive-ly
pseu-do-dif-fer-en-tial pseu-do-fi-nite pseu-do-nym qua-drat-ic
quad-ra-ture qua-si-smooth qua-si-sta-tion-ary qua-si-tri-an-gu-lar
quin-tes-sence quin-tes-sen-tial re-arrange-ment rec-tan-gle
ret-ri-bu-tion retro-fit retro-fit-ted right-eous right-eous-ness
ro-bot ro-bot-ics sched-ul-ing se-mes-ter semi-def-i-nite
semi-ho-mo-thet-ic set-up se-vere-ly side-step sov-er-eign spe-cious
spher-oid spher-oid-al star-tling star-tling-ly sta-tis-tics
sto-chas-tic straight-est strange-ness strat-a-gem strong-hold
sum-ma-ble symp-to-matic syn-chro-nous topo-graph-i-cal tra-vers-a-ble
tra-ver-sal tra-ver-sals treach-ery turn-around un-at-tached
un-err-ing-ly white-space wide-spread wing-spread wretch-ed
wretch-ed-ly Eng-lish Euler-ian Feb-ru-ary Gauss-ian
Hamil-ton-ian Her-mit-ian Jan-u-ary Japan-ese Kor-te-weg
Le-gendre Mar-kov-ian Noe-ther-ian No-vem-ber Rie-mann-ian Sep-tem-ber}
\def\calclayout{\advance\textheight -\headheight
  \advance\textheight -\headsep
  \oddsidemargin\paperwidth
  \advance\oddsidemargin -\textwidth
  \divide\oddsidemargin\tw@
  \ifdim\oddsidemargin<.5truein \oddsidemargin.5truein \fi
  \advance\oddsidemargin -1truein
  \evensidemargin\oddsidemargin
  \topmargin\paperheight \advance\topmargin -\textheight
  \advance\topmargin -\headheight \advance\topmargin -\headsep
  \divide\topmargin\tw@
  \ifdim\topmargin<.5truein \topmargin.5truein \fi
  \advance\topmargin -1truein\relax
}
%% On utilise LM en T1 pour pouvoir copier le texte
\ifcdr@tonelm
\RequirePackage[T1]{fontenc}
\ifcdr@JEP
\RequirePackage[nomath]{lmodern}
\else
\RequirePackage{lmodern}
\fi\fi
\RequirePackage{textcomp}
\ifcdr@latinone
\RequirePackage[latin1]{inputenc}\else
\ifcdr@unicode
\RequirePackage[utf8]{inputenc}
\fi
\fi
% \ifcdr@HTML
% %\RequirePackage{pslatex}
% \else
% \fi
%% possibilit{\'e} de retirer {\c c}a si pb avec source...
\ifcdr@graphicx
\ifcdr@HTML
\RequirePackage[dvips]{color,graphicx}
\else
\RequirePackage[pdftex]{xcolor,graphicx}
\fi\fi
%\providecommand\thepage{\arabic{page}}
\ifcdr@couv
 \RequirePackage{everyshi}[1994/12/09]
 \EveryShipout{\global\advance \count1 by 1}%
\fi
%% M{\'e}tadonn{\'e}es pseudo XML
\RequirePackage{fancyvrb}
\AtEndDocument{\clearpage
%% Attention, ne plus rien faire apr{\`e}s {\c c}a !
\global\def\AtEndDocument#1{%
  \ClassError{\@classname}{%
    AtEndDocument interdit pass{\'e} ce point  !^^J
    Utiliser enddoc@text...^^J
}{}}%
  \addtocounter{page}{-1}%
  \immediate\write\@auxout{%
    \string\newlabel{TheLastPage}{\thepage}}%
  % 
\ifcdr@couv
   \immediate\write\@mainaux
     {\string\newlabel{TotalPages}{\the\count1}}%
\fi
  \protected@edef\Cdr@end@page{\@arabic\c@page}%
  \g@addto@macro\Cdr@end@page{\XMLaddatt{systnum}{arabe}}%
  \def\tmp@{roman}
  \ifx\@pagenumbering\tmp@
    \g@addto@macro\Cdr@end@page{\XMLaddatt*{systnum}{romain}}\fi
  \def\tmp@{Roman}
  \ifx\@pagenumbering\tmp@
    \g@addto@macro\Cdr@end@page{\XMLaddatt*{systnum}{Romain}}\fi
%   \def\tmp@{arabic}
%   \ifx\@pagenumbering\tmp@
%   \edef\Cdr@end@page{%
%     \@arabic\c@page}\fi
%%   \ifnum\start@page<\z@
%%     R\@arabic{\c@page}%
%%     \else
%%     \@arabic{\c@page}%
%%     \fi%
\@makebeforecdrxml
\@makecdrxml
\@makeaftercdrxml}%
\let\cdr@specialtype\@empty
\def\CDRspecialtype#1{\gdef\cdr@specialtype{#1}}
\def\@makebeforecdrxml{}
\def\@makeaftercdrxml{}
% mode XML tralics
\let\xmlbibcites\@empty
\let\xmlbibcitations\@empty
\AtEndOfClass{%
\let\cdr@bibcite\bibcite
\let\cdr@bibcitation\citation
\ifCDRxmlbib
\gdef\bibcite#1#2{\ifx\@empty\xmlbibcites
    \gdef\xmlbibcites{\xmlbibcite{#1}{#2}}%
  \else
    \g@addto@macro\xmlbibcites{\xmlbibcite{#1}{#2}}%
  \fi
\cdr@bibcite{#1}{#2}}%
\gdef\citation#1{\ifx\@empty\xmlbibcitations
    \gdef\xmlbibcitations{\xmlbibcitation{#1}}%
  \else
    \g@addto@macro\xmlbibcitations{\xmlbibcitation{#1}}%
  \fi
\cdr@bibcitation{#1}}%
\fi
}
% Time stamp avec \pdfcreationdate
% We have to test what kind of time data is produced by pdftex...
{\@makeother\D\@makeother\+\@makeother\-
 \@makeother\:\@makeother\>\@makeother\Z

 \def\cdr@beforeplus#1+{#1}
 \def\cdr@beforez#1Z{#1}

 \xdef\tmpa{\expandafter\cdr@beforeplus\pdfcreationdate +}
 \xdef\tmpb{\expandafter\cdr@beforez\tmpa Z}
 \gdef\pdftex@now{\romannumeral0\expandafter\pdftex@now@i\tmpb>}
 \gdef\pdftex@now@i D:#1#2#3#4#5#6#7#8#9>{\pdftex@now@ii{#1#2#3#4-#5#6-#7#8}#9>}
 \gdef\pdftex@now@ii#1#2#3#4#5#6#7#8>{\space#1 #2#3:#4#5:#6#7 MET}
}
\protected@xdef\@timeprod{\pdftex@now}
\protected@xdef\timestamp{\pdftex@now}

\newwrite\cdrxml@out
\newtoks\cdrxml@toks
\newtoks\cdrxml@Underscore
\def\cdr@auteurelt{auteur}
\def\cdr@resprole{editeur}
\cdrxml@Underscore={\Textunderscore}
\newtoks\cdrxml@killpar
\cdrxml@killpar={\let\\\space}
%% tralics
\newcommand\xmllatex[2]{#2}
\let\tralicstex\@secondoftwo
\let\bibtralicstex\@secondoftwo
%% D{\'e}finitions {\`a} passer {\`a} Tralics
%% 1. ancienne version, pour raison de compatibilit{\'e}
\let\@TralicsDefs\@empty
\long\def\TralicsDefs#1{
\newtoks\@TralicsDefs
\@TralicsDefs={#1}}
%% 2. Mieux
\newenvironment{DefTralics}{%
  \VerbatimEnvironment%
  \begin{VerbatimOut}{\jobname -cdrxml.ult}%
}
{\end{VerbatimOut}%
}%
% 3. extra sur la premi{\`e}re ligne
\def\cdr@extra{}%
\def\TralicsExtra#1{\protected@xdef\cdr@extra{#1}}%
\ifcdr@unicode
%\TralicsExtra{utf8-encoded}
\TralicsExtra{-*-coding: utf-8}
\fi

%%
\protected@edef\@dateprod{\number\year-\two@digits\month-\two@digits\day}
\def\setpdftimes#1#2{\gdef\pdftimestamp{#1}\gdef\pdfdateprod{#2}}
\let\pdftimestamp\@empty
\let\pdfdateprod\@empty
\AtBeginDocument{\ifcdr@published\else
\toks@{\setpdftimes}
\immediatelywrite@shell{echo \cdr@lq\the\toks@{\pdftex@now}{\@dateprod}\cdr@rq 
    >  \jobname -pdftimestamp.txt}%
\fi
\InputIfFileExists{\jobname -pdftimestamp.txt}%
{}{}}
\def\@makecdrxml{%
%% test si authors vide
 \begingroup
 \def\nobreakauthor{\unskip\ignorespaces}%%
 \def\and{\unskip\ignorespaces}%%
   \def\firstname##1{\unskip\ignorespaces}%
    \def\lastname##1{\unskip\ignorespaces}%
    \def\middlename##1{\unskip\ignorespaces}%
    \def\vonname##1{\unskip\ignorespaces}%
    \def\junior##1{\unskip\ignorespaces}%
    \edef\@tmpa{\authors}
  \sbox\@tempboxa{\@tmpa}%
  \ifdim\wd\@tempboxa>\z@%\fontdimen2\font%
  \ClassError{\@classname}{%
   Warning:  \@tmpa^^J
   No printable char should be placed outside of name commands for
   authors names (firstname, lastname, middlename, vonname,
   junior). If you want to insert a nonbreakable space, please use nobreakauthor!
      }{%
RTFM!
      }%
\fi
\endgroup
 \ifcdr@XML
\let\nombre@auteurs\@empty
\let\nombre@noauteurs\@empty
  \bgroup\def\nobreakauthor{ }%
%  \def\the\cdrxml@Underscore{\the\the\cdrxml@Underscore}
  \def\cdrxml@space{ }%
  \def\cdrxml@tab{\cdrxml@space\cdrxml@space\cdrxml@space\cdrxml@space}%
  \def\auteurisresp{resp}%
  \def\cdrxml@authors{%
    \let\@firstname\@empty
    \let\@lastname\@empty
    \let\@middlename\@empty
    \let\@vonname\@empty
    \let\@junior\@empty
    \def\author####1{% on ferme la balise du pr{\'e}c{\'e}dent
      \ifnum\cdr@auth@count=\z@\else\immediate\write\cdrxml@out{%
        \cdrxml@tab \string\end{xmlelement}%auteur
}\fi
      \ifnum\cdr@noauth@count=\z@\else\immediate\write\cdrxml@out{%
        \cdrxml@tab \string\end{xmlelement}%auteur
}\fi
      \def\@nomcomplet{####1}
      \immediate\write\cdrxml@out{%
        \cdrxml@tab \string\begin{xmlelement}{\cdr@auteurelt}}%
      \ifx\auteurisresp\cdr@auteurelt
      \immediate\write\cdrxml@out{\cdrxml@tab \string\XMLaddatt{role}{\cdr@resprole}}%
\fi
      \Do{nomcomplet}\@nomcomplet
       \begingroup
      \def\firstname########1{\def\@firstname{########1}%
        \Do{prenom}\@firstname}
      \def\lastname########1{\def\@lastname{########1}%
        \Do{nom}\@lastname}
      \def\middlename########1{\def\@middlename{########1}%
        \Do{middlename}\@middlename}
      \def\junior########1{\def\@junior{########1}%
        \Do{junior}\@junior}
      \def\vonname########1{\def\@vonname{########1}%
      \Do{particule}\@vonname}
    ####1\endgroup
    \advance\cdr@auth@count1
}%
    \def\noauthor####1####2{% on ferme la balise du pr{\'e}c{\'e}dent
      \ifnum\cdr@noauth@count=\z@% si c'est le premier, on ferme la balise du dernier auteur if any
	\ifnum\cdr@auth@count=\z@\else\immediate\write\cdrxml@out{%
        \cdrxml@tab \string\end{xmlelement}%
}\fi
	\else\immediate\write\cdrxml@out{%
        \cdrxml@tab \string\end{xmlelement}%
}\fi
      \def\@nomcomplet{####2}
      \immediate\write\cdrxml@out{%
        \cdrxml@tab \string\begin{xmlelement}{contributeur}\string\XMLaddatt{role}{####1}}%
      \Do{nomcomplet}\@nomcomplet
       \begingroup
      \def\firstname########1{\def\@firstname{########1}%
        \Do{prenom}\@firstname}
      \def\lastname########1{\def\@lastname{########1}%
        \Do{nom}\@lastname}
      \def\middlename########1{\def\@middlename{########1}%
        \Do{middlename}\@middlename}
      \def\junior########1{\def\@junior{########1}%
        \Do{junior}\@junior}
      \def\vonname########1{\def\@vonname{########1}%
      \Do{particule}\@vonname}
    ####2\endgroup
    \advance\cdr@noauth@count1
}%
    \def\email####1####2{%
      \@ifnotempty{####2}{%\nobreak\indent\emailaddrname
        % \@ifnotempty{####1}{, \ignorespaces####1\unskip}\/:\space
	\cdrxml@toks=\@xp{####2}%
	\immediate\write\cdrxml@out{%
     \cdrxml@tab\cdrxml@tab \string\xbox{mel}{\string\url\cdr@lb\the\cdrxml@toks\cdr@rb}}}}%	
    \def\urladdr####1####2{%
      % ?      \def~{\char`\~}%
      \@ifnotempty{####2}{%\nobreak\indent\urladdrname
        % \@ifnotempty{##1}{, \ignorespaces##1\unskip}\/:\space
	\cdrxml@toks=\@xp{####2}%
	\immediate\write\cdrxml@out{%
     \cdrxml@tab\cdrxml@tab \string\xbox{url}{\string\url\cdr@lb\the\cdrxml@toks\cdr@rb}}}}%
    \def\address####1####2{%
                                % \@ifnotempty{####1}{(\ignorespaces####1\unskip) }%
      \qDo{adresse}{\protect####2}}%
    \def\curraddr####1####2{%
      \@ifnotempty{####2}{%\nobreak\indent\curraddrname
        % \@ifnotempty{####1}{, \ignorespaces####1\unskip}\/:\space
        \qDo{adresse\the\cdrxml@Underscore actuelle}{\protect####2}}}%
    \let~\space
    \xmladdresses
  \ifnum\cdr@auth@count=\z@\ifnum\cdr@noauth@count=\z@\else\immediate\write\cdrxml@out{%
        \cdrxml@tab \string\end{xmlelement}%contributeur
}\fi\else\immediate\write\cdrxml@out{%
    \cdrxml@tab \string\end{xmlelement}%auteur
}\fi
\ifcdr@volume\else
  \protected@edef\nombre@auteurs{\number\cdr@auth@count}%
  \protected@edef\nombre@noauteurs{\number\cdr@noauth@count}%
\fi
  \do{nombre\the\cdrxml@Underscore auteurs}\nombre@auteurs
  \do{nombre\the\cdrxml@Underscore contributeurs}\nombre@noauteurs
}%
  \def\do##1##2{\ifx##2\@empty\else\cdrxml@toks=\@xp{##2}%
     \immediate\write\cdrxml@out{%
     \cdrxml@tab \string\xbox{##1}{\the\cdrxml@toks}}\fi}%
  \def\edo##1##2{\cdrxml@toks=\@xp{##2}%
     \immediate\write\cdrxml@out{%
     \cdrxml@tab \string\xbox{##1}{\the\cdrxml@toks}}}%
  \def\xdo##1##2##3{\ifx##3\@empty\else\cdrxml@toks=\@xp{##3}%
     \immediate\write\cdrxml@out{%
     \cdrxml@tab
     \string\begin{XTAPelement}[##2]{##1}\the\cdrxml@toks\string\end{XTAPelement}%\string\AddAttToLast{xml:lang}{##2}
   }\fi}%
  \def\qxdo##1##2##3{\ifx##3\@empty\else\cdrxml@toks=\@xp{##3}%
     \immediate\write\cdrxml@out{%
     \cdrxml@tab
     \string{\string\killparcode\string\begin{XTAelement}[##2]{##1}%
       \the\cdrxml@toks\string\end{XTAelement}\string}%\string\AddAttToLast{xml:lang}{##2}%
   }\fi}%
  \def\attxdo##1##2##3##4{\ifx##4\@empty\else\cdrxml@toks=\@xp{##4}%
     \immediate\write\cdrxml@out{%
     \cdrxml@tab \string{\string\NoCatCode\string\begin{xmlelement}{##1}\string\XMLaddatt{##2}{##3}\the\cdrxml@toks\string\end{xmlelement}\string}}\fi}%
  \def\AttXdo##1##2##3##4##5{\ifx##5\@empty\else\cdrxml@toks=\@xp{##5}%
     \immediate\write\cdrxml@out{%
     \cdrxml@tab \string\begin{XTAPelement}[##2]{##1}\string\XMLaddatt{##3}{##4}\the\cdrxml@toks\string\end{XTAPelement}%
   }\fi}%
  \def\Do##1##2{\ifx##2\@empty\else\cdrxml@toks=\@xp{##2}%
     \immediate\write\cdrxml@out{%
     \cdrxml@tab\cdrxml@tab \string\xbox{##1}{\the\cdrxml@toks}}\fi}%
  \def\qDo##1##2{\cdrxml@toks=\@xp{##2}%
     \immediate\write\cdrxml@out{%
     \cdrxml@tab\cdrxml@tab
     \string{\string\killparcode\string\begin{xmlelement}{##1}\the\cdrxml@toks\string\end{xmlelement}\string}%
   }}%
 \protected@edef\cdr@idvol{\cdr@journalacro\string\Textunderscore\space \currentyear\string\Textunderscore\space \currentseries\string\Textunderscore\space \currentvolume\string\Textunderscore\space \currentissue}%
\ifcdr@volume\else
 \protected@edef\cdr@idart{\cdr@idvol\string\Textunderscore\space \Cdr@start@page@idart\string\Textunderscore\space 0}%
\fi
  \immediate\openout\cdrxml@out=\jobname -cdrxml.tex
\protected@xdef\@tralicsaux{\jobname -cdrxml}
%%
% 
%% M{\'e}tadonn{\'e}es volume
\ifcdr@volume
  \immediate\write\cdrxml@out{%
 \string\documentclass[\cdr@journalacro]{cedramhead}\cdr@pc\cdr@extra^^J
 \string\vbox\cdr@lb\cdr@pc}
\immediate\write\cdrxml@out{%
  \cdrxml@space\cdrxml@space \string\begin{xmlelement}{production}\string\NoCatCode}%
\do{fichier\the\cdrxml@Underscore tex}\jobname
\do{fichier\the\cdrxml@Underscore bib}\@@bibfile
\edo{fichier\the\cdrxml@Underscore tralics}{\jobname -cdrxml}%
\do{date\the\cdrxml@Underscore prod}\@dateprod
\do{date\the\cdrxml@Underscore prod\the\cdrxml@Underscore PDF}\pdfdateprod
\do{timestamp}\@timeprod
\do{pdftimestamp}\pdftimestamp
\immediate\write\cdrxml@out{%
  \cdrxml@space\cdrxml@space \string\end{xmlelement}%production
}%
\immediate\write\cdrxml@out{%
  \cdrxml@space\cdrxml@space \string\begin{xmlelement}{gestion}}%
\ifcdr@OA\immediate\write\cdrxml@out{%
  \cdrxml@tab \string\xbox{OpenAccess}{yes}%
}%
\fi
\ifcdr@published\immediate\write\cdrxml@out{%
  \cdrxml@tab \string\xbox{paru}{yes}%
}%
\fi
\immediate\write\cdrxml@out{%
  \cdrxml@space\cdrxml@space \string\end{xmlelement}%gestion
}%
\do{idvol}\cdr@idvol
\ifx\cdr@idvol\@empty\else\cdrxml@toks=\@xp{\cdr@idvol}%
     \immediate\write\cdrxml@out{%
     \cdrxml@tab \string\gdef\string\idvol{\the\cdrxml@toks}\cdr@pc}\fi
\do{id}\CDRidinterne
\immediate\write\cdrxml@out{%
\cdrxml@space\cdrxml@space  \string\begin{xmlelement}{revue}}%
\do{jtitre}\currentjournaltitle
\qDo{jtitrecourt}\currentjournalshorttitle
\do{acrocedram}\cdr@journalacro
\do{jediteur}\currentjournalpublisher
\do{issn}\@issn
\do{E-issn}\@Eissn
\immediate\write\cdrxml@out{%
\cdrxml@space\cdrxml@space  \string\end{xmlelement}%revue
}%
\do{serie}\currentseries
\do{tome}\currentvolume
\do{annee}\currentyear
\do{mois}\currentmonth
\do{fascicule}\currentissue
\qxdo{titre}{fr}\@title@french
\qxdo{titre}{en}\@title@english
\AttXdo{avertissement}{fr}{label}{\cdr@disclaimername@french}\@disclaimer@french
\AttXdo{avertissement}{en}{label}{\cdr@disclaimername@english}\@disclaimer@english
\xdo{resume}{fr}\@abstract@french
\xdo{resume}{en}\@abstract@english
\def\cdr@auteurelt{resp}
\cdrxml@authors
\immediate\write\cdrxml@out{%
  \cdr@rb}% ferme le vbox
%  \cdrxml@space \string\end{xmlelement}%notice
%
\else
%% Cas d'un special
\ifcdr@special
\immediate\write\cdrxml@out{%
%  \cdrxml@space
 \string\documentclass[\cdr@journalacro]{cedramspec}\cdr@pc\cdr@extra^^J
 \string\addattributestodocument{xml:lang}{\cdr@language@short}^^J%
 \string\addattributestodocument{type}{\cdr@specialtype}^^J%
 \string\vbox\cdr@lb\cdr@pc}
\immediate\write\cdrxml@out{%
  \cdrxml@space\cdrxml@space \string\begin{xmlelement}{production}\string\NoCatCode}%
\do{fichier\the\cdrxml@Underscore tex}\jobname
\do{fichier\the\cdrxml@Underscore bib}\@@bibfile
\edo{fichier\the\cdrxml@Underscore tralics}{\jobname -cdrxml}%
\do{date\the\cdrxml@Underscore prod}\@dateprod
\do{date\the\cdrxml@Underscore prod\the\cdrxml@Underscore PDF}\pdfdateprod
\do{timestamp}\@timeprod
\do{pdftimestamp}\pdftimestamp
\immediate\write\cdrxml@out{%
  \cdrxml@space\cdrxml@space \string\end{xmlelement}%production
}%
\do{id}\CDRidinterne
\do{pagedeb}\Cdr@start@page
\do{pagefin}\Cdr@end@page
\qxdo{titre}{fr}\@title@french
\qxdo{titre}{en}\@title@english%
\do{langue}\cdr@language@short
\immediate\write\cdrxml@out{%
  \cdr@rb}% ferme le vbox
\else
%% Cas d'un article
\immediate\write\cdrxml@out{%
 \string\documentclass[\cdr@journalacro]{cedramarticle}\cdr@pc\cdr@extra^^J%
 \string\selectlanguage{\cdr@language@short}\cdr@pc^^J%
 \string\vbox\cdr@lb\cdr@pc}
% souvenir des articles cit{\'e}s
% --plus aucune diff{\'e}rence-- mode bibtex ou latex ?
%\ifx\@@bibfile\@empty
%\immediate\write\cdrxml@out{%
%  \cdrxml@space \string\bibtexbibfalse}%***
%\fi
% en mode Recup, pas de \xmlcitation
\ifcdr@recup
 \immediate\write\cdrxml@out{%
   \cdrxml@space \string\nocitationtrue}%***
\fi
%% macros pass{\'e}es {\`a} tralics
\ifx\@TralicsDefs\@empty\else%\cdrxml@toks=\@xp{\@TralicsDefs}%
\immediate\write\cdrxml@out{%
  \cdrxml@space \the\@TralicsDefs\cdr@pc}%***
\fi
\ifx\xmlbibcitations\@empty\else\cdrxml@toks=\@xp{\xmlbibcitations}%
\immediate\write\cdrxml@out{%
  \cdrxml@space \the\cdrxml@toks\cdr@pc}%***
\fi
\ifx\xmlbibcites\@empty\else\cdrxml@toks=\@xp{\xmlbibcites}%
\immediate\write\cdrxml@out{%
  \cdrxml@space \the\cdrxml@toks\cdr@pc}%***
\fi
\immediate\write\cdrxml@out{%
  \cdrxml@space\cdrxml@space \string\begin{xmlelement}{production}\string\NoCatCode}%
\do{fichier\the\cdrxml@Underscore tex}\jobname
\do{fichier\the\cdrxml@Underscore bib}\@@bibfile%
\edo{fichier\the\cdrxml@Underscore tralics}{\jobname -cdrxml}%
\do{date\the\cdrxml@Underscore prod}\@dateprod
\do{date\the\cdrxml@Underscore prod\the\cdrxml@Underscore PDF}\pdfdateprod
\do{timestamp}\@timeprod
\do{pdftimestamp}\pdftimestamp
\immediate\write\cdrxml@out{%
  \cdrxml@space\cdrxml@space \string\end{xmlelement}%production
}%
\immediate\write\cdrxml@out{%
  \cdrxml@space\cdrxml@space \string\begin{xmlelement}{gestion}}%
\do{date\the\cdrxml@Underscore reception}\@datereceived
\do{date\the\cdrxml@Underscore revision}\@daterevised
\do{date\the\cdrxml@Underscore acceptation}\@dateaccepted
\do{date\the\cdrxml@Underscore online}\@dateposted
\ifcdr@OA\immediate\write\cdrxml@out{%
  \cdrxml@tab \string\xbox{OpenAccess}{yes}%
}%
\fi
\ifcdr@published\immediate\write\cdrxml@out{%
  \cdrxml@tab \string\xbox{paru}{yes}%
}%
\fi
\ifcdr@publishTeX\immediate\write\cdrxml@out{%
  \cdrxml@tab \string\xbox{publishTeX}{yes}%
}%
\fi
\immediate\write\cdrxml@out{%
  \cdrxml@space\cdrxml@space \string\end{xmlelement}%gestion
}%
\do{idart}\cdr@idart
\ifx\cdr@idart\@empty\else\cdrxml@toks=\@xp{\cdr@idart}%
     \immediate\write\cdrxml@out{%
     \cdrxml@tab \string\gdef\string\idart{\the\cdrxml@toks}\cdr@pc}\fi
\do{id}\CDRidinterne
\ifnum\c@article>\z@
\immediate\write\cdrxml@out{%
  \cdrxml@tab \string\xbox{ordreart}{\the\c@article}}
\fi
\def\killcoloncatcode{\catcode`\:=11}%
\ifx\CDRdoi\@empty\else\cdrxml@toks=\@xp{\CDRdoi}%
     \immediate\write\cdrxml@out{%
     \cdrxml@tab \string{\string\killcoloncatcode\string\xbox{doi}{\the\cdrxml@toks}\string}}\fi
\do{num\the\cdrxml@Underscore expose}\cdr@numexpose
\do{pagedeb}\Cdr@start@page
\do{pagefin}\Cdr@end@page
\cdrxml@authors
\qxdo{titre}{fr}\@title@french
\qxdo{titre}{en}\@title@english
\qxdo{soustitre}{fr}\@subtitle@french
\qxdo{soustitre}{en}\@subtitle@english
\ifx\@Relation\@empty\else
  \attxdo{relations}{type}{\@Relation@type}\@Relation\fi
\do{langue}\cdr@language@short
\AttXdo{avertissement}{fr}{label}{\cdr@disclaimername@french}\@disclaimer@french
\AttXdo{avertissement}{en}{label}{\cdr@disclaimername@english}\@disclaimer@english
\xdo{resume}{fr}\@abstract@french
\xdo{resume}{en}\@abstract@english
\AttXdo{annexe}{fr}{label}{\cdr@annexname@french}\@annex@french
\AttXdo{annexe}{en}{label}{\cdr@annexname@english}\@annex@english
\ifx\cdr@supplements\@empty\else
  \Do{supplements}\cdr@supplements\fi
\qxdo{motcle}{fr}\@keywords@french
\qxdo{motcle}{en}\@keywords@english
\do{msc}\@subjclass
%% biblio XML
\ifx\@@bibfile\@empty
% thebibliography
\ifx\@flatbib\@empty\else
\cdrxml@toks=\@xp{\@flatbib}%
\immediate\write\cdrxml@out{%
  \string{\string\killparcode\string\begin{biblio}\the\cdrxml@toks\string\end{biblio}\string}}\fi
% peut pas marcher !
% \immediate\write\cdrxml@out{%
%   \cdr@lb\string\killparcode\string\begin{xmlelement}{biblio}}%
% \begingroup
% %% {\'e}vitons les ennuis !
% \def\par{ }\def\\{ }\def\linebreak{ }\def\eject{ }%
% \def\newpage{ }\def\clearpage{ }\def\break{ }%
% \newcounter{bibcount}
% \def\thebibcount{\arabic{bibcount}}
% \renewcommand\bibitem[2][vide]{%
% \endgroup
% \immediate\write\cdrxml@out{%
%   \string\end{xmlelement}\cdr@rb}%
%\fi
%% fichier .bib
\else
\cdrxml@toks=\@xp{\@@bibfile}%
\immediate\write\cdrxml@out{%
%  \string\nocite{*}
  \string\bibliography{\the\cdrxml@toks}
}\fi%
% debug
% \do{auteurs}\authors
% \do{title}\@title
% \do{alttitle}\@alttitle
% \do{abstract}\@abstract
% \do{altabstract}\@altabstract
% \do{motcles}\@keywords
% \do{altkeywords}\@altkeywords
\immediate\write\cdrxml@out{%
  \cdr@rb}% ferme le vbox
%  \cdrxml@space \string\end{xmlelement}%article
%^^J}
%\end{xmlelement}%volart
%
\fi\fi
\immediate\closeout\cdrxml@out
\egroup%
\fi}% Fin XML

%
%% Fabrication volumes
%%
\ifcdr@hascedrics\def\cdr@tralics@com{cedrics
}\else\def\cdr@tralics@com{echo }\fi
\def\ScreenMode{\global\cdr@pagedegardetrue\global\cdr@tireapartfalse\ifcdr@hascedrics\global\cdr@XMLtrue\fi\global\cdr@SOMtrue\ifcdr@XML\message{*** XML activ{\'e} ***}\else
\message{*** XML d{\'e}sactiv{\'e} ***}\fi}
\def\ScreenModeNew{}
\def\VolumeDef#1{\g@addto@macro\ScreenModeNew{#1}}
%\def\TITREspecial{}
\newif\ifcdr@specialtitre\cdr@specialtitrefalse
\ifcdr@volume
\let\articlesXML\@empty
\let\articlesSOM\@empty
\def\@makeaftercdrxml{%
  \ifcdr@newsom
  \immediatelywrite@shell{cat  \articlesSOM >
    \cdr@journalacro -Sommaire-data.tex}%
  \fi
  \ifcdr@couv\MakeCouverture\fi
  \ifcdr@couvT\MakeCouvTiresapart\fi
\ifcdr@XML
  \immediatelywrite@shell{\cdr@tralics@com  \jobname -cdrxml}%
  \immediatelywrite@shell{cat \jobname -cdrxml.xml \articlesXML %\space
                                %trailer.txt 
    >  \jobname .pxml}%
  \immediatelywrite@shell{echo \jobname -cdrxml.xml \articlesXML %\space
                                %trailer.txt 
    >  \jobname .xml-list}%
  \immediatelywrite@shell{zip -r \jobname -xml.zip \jobname -cdrxml.xml
                                \articlesXML \space \jobname .xml-list }%
\fi
}
\RequirePackage{pdfpages}
\newcommand\SetFirstPage[2][arabic]{\def\@FirstPage{#2}\def\@FirstPageNumbering{#1}}
\def\maketitle{%
  \ClassError{\@classname}{%
    commande maketitle inactive en mode volume !^^J
}{}}
\def\@makefront{}
\def\@makebody{}
%% Pages pr{\'e}liminaires du journal
\def\makefront{%
  %% ce qui est quasi-constant
  \input{\cdr@journalconfig -front}%
  %% Ce qui d{\'e}pend de la revue, {\`a} d{\'e}finir dans revue.cfg
  \@makefront
  \@makebody}
\def\@makeback{}
\def\makeback{%
    %% ce qui est quasi-constant
  \input{\cdr@journalconfig -back}%
   %% Ce qui d{\'e}pend de la revue, {\`a} d{\'e}finir dans revue.cfg
  \@makeback
}
%
\newtoks\tkkv
\newtoks\tkkp
\newtoks\tkki
\AtBeginDocument{%
  \protected@edef\CDRidvol{\cdr@journalacro_\currentyear_\currentseries_\currentvolume_\currentissue}%
}
\newcommand\IssueInfo[5][]{%
\@ifempty{#1}{%
\ifCDRxmlbib
  \ifcdr@OA
  \tkkv={\ScreenMode\OpenAccess\issueinfo{#2}{#3}{#4}{#5}}%
  \else
  \tkkv={\ScreenMode\issueinfo{#2}{#3}{#4}{#5}}%
  \fi
\else
  \ifcdr@OA
  \tkkv={\ScreenMode\OpenAccess\global\CDRxmlbibfalse\issueinfo{#2}{#3}{#4}{#5}}%
  \else
  \tkkv={\ScreenMode\global\CDRxmlbibfalse\issueinfo{#2}{#3}{#4}{#5}}%
  \fi
\fi}{%
\ifCDRxmlbib
  \tkkv={\ScreenMode\issueinfo{#2}{#3}{#4}{#5}\lieusem{#1}}%
\else
  \tkkv={\ScreenMode\global\CDRxmlbibfalse\issueinfo{#2}{#3}{#4}{#5}\lieusem{#1}}%
\fi}%
\issueinfo{#2}{#3}{#4}{#5}\@ifnotempty{#1}{\lieusem{#1}}}
%% Commande AddToSom : rajoute quelque chose au sommaire imprim{\'e} du volume
\newcounter{addtosom}
\renewcommand\theaddtosom{\roman{addtosom}}
\def\AddToSom#1{%
  \stepcounter{addtosom}%
  \toks@{#1}%
  \immediatelywrite@shell{echo \cdr@lq\the\toks@\cdr@rq > \jobname-\theaddtosom.cdrsom}%
   \ifx\@empty\articlesSOM
    \protected@xdef\articlesSOM{\jobname-\theaddtosom.cdrsom}%
   \else
    \protected@xdef\articlesSOM{\articlesSOM\space \jobname-\theaddtosom.cdrsom}%
   \fi
}
\newcommand\IncludeSom[1]{%
  \cleardoublepage
  \tkkp={\setpage[Roman]}%
  \immediatelywrite@shell{echo \cdr@lq\the\tkkv \the\tkkp{\thepage}\cdr@rq > #1.cfg}%
  \immediatelywrite@shell{\pdflatex@shell@option #1}%
  \immediatelywrite@shell{\pdflatex@shell@option #1}%
  \includepdf[pages={-},noautoscale]{#1.pdf}%
\ifcdr@XML
  \immediatelywrite@shell{\cdr@tralics@com  #1-cdrxml}%
  \ifx\@empty\articlesXML
    \gdef\articlesXML{#1-cdrxml.xml}%
  \else
    \g@addto@macro\articlesXML{ #1-cdrxml.xml}%
  \fi
\fi
}
\tkkp={\setpage}
\newcommand\IncludeArticle[3][2]{%
\tkki=\@xp{\cdr@inclart}%
    \cleardoublepage
  \immediatelywrite@shell{echo \cdr@lq\the\tkkv \the\tkkp{\thepage}
    \the\tkki \string\setcounter{article}{\the\c@article}\cdr@rq > #2#3.cfg}%
  \immediatelywrite@shell{cd #2 && \pdflatex@shell@option #3}%
  \ifcdr@redoBibtex
    \ifcdr@redoIndex
    \immediatelywrite@shell{cd #2 && makeindex #3}%
    \fi
  \immediatelywrite@shell{cd #2 && bibtex #3}%
  \immediatelywrite@shell{cd #2 && \pdflatex@shell@option #3}%
  \immediatelywrite@shell{cd #2 && \pdflatex@shell@option #3}%
  \else
      \ifcdr@redoIndex
    \immediatelywrite@shell{cd #2 && makeindex #3}%
    \fi
  \immediatelywrite@shell{cd #2 && \pdflatex@shell@option #3}%
  \immediatelywrite@shell{cd #2 && \pdflatex@shell@option #3}%
  \fi

  \immediatelywrite@shell{cd #2 && \pdflatex@shell@option #3}%
  \includepdf[pages={#1-},noautoscale]{#2#3.pdf}%
}
%% Cas d'un article produit avec dvips...
\newcommand\IncludeDVIPSArticle[3][2]{%
\tkki=\@xp{\cdr@inclart}%
    \cleardoublepage
  \immediatelywrite@shell{echo \cdr@lq\the\tkkv \the\tkkp{\thepage}
    \the\tkki \string\setcounter{article}{\the\c@article}\cdr@rq > #2#3.cfg}%
  \immediatelywrite@shell{cd #2 && latex \cdr@shell@option\ -interaction=nonstopmode #3}%
  \ifcdr@redoBibtex
  \immediatelywrite@shell{cd #2 && bibtex #3}%
  \immediatelywrite@shell{cd #2 && latex \cdr@shell@option\ -interaction=nonstopmode #3}%
  \immediatelywrite@shell{cd #2 && latex \cdr@shell@option\ -interaction=nonstopmode #3}%
  \fi
  \immediatelywrite@shell{cd #2 && latex \cdr@shell@option\ -interaction=nonstopmode #3}%
% Dvips avec les bonnes dimensions
  \immediatelywrite@shell{cd #2 && dvips \cdr@dvipsoptions #3 -o}%
% ghostscript 8.5 pour faire un PDF idoine ?
  \immediatelywrite@shell{cd #2 && ps2pdf14 #3.ps #3.pdf}%
  \includepdf[pages={#1-},noautoscale]{#2#3.pdf}%
}
\newcommand\IncludeSpecial[3][1]{%
%    \cleardoublepage
  \immediatelywrite@shell{echo \cdr@lq\the\tkkv \the\tkkp{\thepage}\cdr@rq > #2#3.cfg}%
  \immediatelywrite@shell{cd #2 && \pdflatex@shell@option #3}%
  \immediatelywrite@shell{cd #2 && \pdflatex@shell@option #3}%
  \includepdf[pages={#1-},noautoscale]{#2#3.pdf}%
}
%% Num{\'e}ros sp{\'e}ciaux
\newtoks\cdr@specialtitret
\def\SpecialNo#1{\gdef\TITREspecial{#1}\cdr@specialtitret={\gdef\TITREspecial{#1}}\global\cdr@specialtitretrue}
\newcommand\MakeCouverture{%
  \newwrite\cdr@couvfile
  \immediate\openout\cdr@couvfile=\CDRidvol -couverture.tex
  \immediate\write\cdr@couvfile{\string\input{\cdr@journalacro -couverture}\string\endinput}%
  \immediate\closeout\cdr@couvfile
  \newwrite\cdr@couvcfgfile
  \immediate\openout\cdr@couvcfgfile=\CDRidvol -couverture.cfg
\ifcdr@specialtitre
  \immediate\write\cdr@couvcfgfile{\the\cdr@specialtitret}%
\fi
  \immediate\write\cdr@couvcfgfile{\the\tkkv \the\tkkp{\thepage}
    \string\def\string\FirstPage{\@FirstPage}\string\def\string\TotalPages{\cdr@total@pages}}%
\immediate\closeout\cdr@couvcfgfile
  \immediatelywrite@shell{\pdflatex@shell@option \CDRidvol -couverture}%
  \immediatelywrite@shell{\pdflatex@shell@option \CDRidvol -couverture}%
}
\newcommand\MakeCouvTiresapart{%
  \newwrite\cdr@couvTfile
  \immediate\openout\cdr@couvTfile=\CDRidvol -couv-tires.tex
  \immediate\write\cdr@couvTfile{\string\input{\cdr@journalacro -couv-tireapart}\string\endinput}
  \immediate\closeout\cdr@couvTfile
  \immediatelywrite@shell{echo \cdr@lq\the\tkkv\cdr@rq > \CDRidvol -couv-tires.cfg}%
  \immediatelywrite@shell{\pdflatex@shell@option \CDRidvol -couv-tires}%
  \immediatelywrite@shell{\pdflatex@shell@option \CDRidvol -couv-tires}%
}
%% On garde celui-ci si jamais l'autre foire...
\def\oldincludearticle#1{%
  \IncludeArticle[\cdr@includearticleafter]{#1/}{#1}%
\ifcdr@XML
  \immediatelywrite@shell{cd #1 && \cdr@tralics@com #1-cdrxml}%
    \ifx\@empty\articlesXML
    \gdef\articlesXML{#1/#1-cdrxml.xml}%
  \else
    \g@addto@macro\articlesXML{ #1/#1-cdrxml.xml}%
  \fi
\fi
  \ifx\@empty\articlesSOM
    \gdef\articlesSOM{#1/#1.cdrsom}%
   \else
    \g@addto@macro\articlesSOM{ #1/#1.cdrsom}%
   \fi
}
\def\oldincludedvipsarticle#1{%
  \IncludeDVIPSArticle[2]{#1/}{#1}%
\ifcdr@XML
  \immediatelywrite@shell{cd #1 && \cdr@tralics@com #1-cdrxml}%
  \ifx\@empty\articlesXML
    \gdef\articlesXML{#1/#1-cdrxml.xml}%
  \else
    \g@addto@macro\articlesXML{ #1/#1-cdrxml.xml}%
 \fi
\fi
  \ifx\@empty\articlesSOM
    \gdef\articlesSOM{#1/#1.cdrsom}%
   \else
    \g@addto@macro\articlesSOM{ #1/#1.cdrsom}%
   \fi
}
%% Truc ins{\'e}r{\'e} n'apparaissant pas au sommaire
\def\includenoarticle#1{%
  \IncludeArticle[]{#1/}{#1}%
%   \ifx\@empty\articlesXML
%     \gdef\articlesXML{#1/#1-cdrxml.xml}%
%   \else
%     \g@addto@macro\articlesXML{ #1/#1-cdrxml.xml}%
%   \fi
}
\newcommand\IncludePub[2][pubs/]{%
    \clearpage
    \includepdf[pages={-}]{#1#2.pdf}%
}
\def\includepub#1{%
  \IncludePub[pubs/]{#1}%
}
%%%% EXPerimental !!
\def\cdr@inclart{}
\define@key{cdr@inclart}{doi}{%
  \g@addto@macro\cdr@inclart{\gdef\CDRdoi{#1}}%
}
\define@key{cdr@inclart}{intID}{%
  \g@addto@macro\cdr@inclart{\gdef\CDRidinterne{#1}}%
}
\define@key{cdr@inclart}{published}[true]{%
  \g@addto@macro\cdr@inclart{\gdef\CDRpublished{#1}\ItIsPublished}%
}
\define@key{cdr@inclart}{publishTeX}[true]{%
  \g@addto@macro\cdr@inclart{\gdef\CDRpublishTeX{#1}\ItHasTeXPublished}%
}
\define@key{cdr@inclart}{NopublishTeX}[false]{%
  \g@addto@macro\cdr@inclart{\gdef\CDRpublishTeX{#1}\ItHasNoTeXPublished}%
}
%
\def\includearticle{\@ifnextchar[\@includearticle{\@includearticle[]}}


%%%%%% FIN EXP
\def\cdr@includearticleafter{2}
\def\@includearticle[#1]#2{%
%\begingroup  
  \setkeys{cdr@inclart}{#1}%
  \IncludeArticle[\cdr@includearticleafter]{#2/}{#2}%
\ifcdr@XML
  \immediatelywrite@shell{cd #2 && \cdr@tralics@com #2-cdrxml}%
    \ifx\@empty\articlesXML
    \gdef\articlesXML{#2/#2-cdrxml.xml}%
  \else
    \g@addto@macro\articlesXML{ #2/#2-cdrxml.xml}%
  \fi
\fi
  \ifx\@empty\articlesSOM
    \gdef\articlesSOM{#2/#2.cdrsom}%
   \else
    \g@addto@macro\articlesSOM{ #2/#2.cdrsom}%
   \fi
   \gdef\cdr@inclart{}%
%\endgroup
}
\fi% Fin Volume
\def\ItIsPublished{\global\cdr@publishedtrue}%
\def\ItHasTeXPublished{\global\cdr@publishTeXtrue}%
\def\ItHasNoTeXPublished{\global\cdr@publishTeXfalse}%
\ifcdr@sommaire
\def\SomInput#1{%
  \makeatletter
  \input{#1.cdrsom}%
  \makeatother
}
\fi
\ifcdr@special
\def\ScreenMode{}
\def\ScreenModeNew{}
\fi
%
\ifcdr@recup
\RequirePackage{pdfpages}
\fi
\InputIfFileExists{cedram-\cdr@journalconfig .clo}{}{%
  \calclayout % initialize
  \pagenumbering{arabic}%
  \pagestyle{headings}%
  \thispagestyle{plain}%
}%
%% macros utiles...
\def\cprime{\tralicstex{\amp 2BC;}{$'$}}
\def\polhk#1{\k{#1}}
\providecommand\nequiv{\not\equiv}
%% Compteurs uniques/relatifs {\`a} la section
\ifcdr@eqcountersinsections
 \numberwithin{equation}{section}
\fi
\ifcdr@flcountersinsections
 \numberwithin{figure}{section}
 \numberwithin{table}{section}
\fi
%% Amsart/one numbering for everything compatibility
\ifcdr@onecountereverything
\let\c@equation\c@subsection
\let\theequation\thesubsection
\OneNumberAllTheorems
\NumberTheoremsAs{subsection}
\fi
\ifcdr@subsectaspar
\let\c@paragraph\c@subsection
\let\theparagraph\thesubsection
\let\subsection\paragraph
\setcounter{secnumdepth}{4}
\fi
\ifcdr@published
\global\pdfdraftmode=1
\fi
\if@compatibility \else\endinput\fi
\def\tiny{\Tiny}
\def\defaultfont{\normalfont}
\def\rom{\textup}
\let\@newpf\proof \let\proof\relax \let\endproof\relax
\newenvironment{pf}{\@newpf[\proofname]}{\popQED\endtrivlist}
\newenvironment{pf*}[1]{\@newpf[#1]}{\popQED\endtrivlist}
%

\endinput
%%
%% End of file `cedram.cls'.
%
