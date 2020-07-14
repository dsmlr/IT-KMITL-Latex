\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{itkmitlproject}[2019/05/21]

\LoadClass[11pt, a4paper, oneside]{book}

\RequirePackage[top=1in, bottom=1in, left=1.5in, right=1in]{geometry}
\RequirePackage[labelfont=bf]{caption}
\RequirePackage{fontspec}
\RequirePackage{xunicode}
\RequirePackage{xltxtra}
\RequirePackage{titlesec}
\RequirePackage{eucal}
\RequirePackage{eufrak}
\RequirePackage{fancyhdr}
\RequirePackage{tabularx}
\RequirePackage{titletoc}
\RequirePackage{ifthen}
\RequirePackage{lineno}
\RequirePackage{afterpage}
\RequirePackage{subfigure}
\RequirePackage{etoolbox}
\RequirePackage{array}
\RequirePackage{everyshi}
% \RequirePackage{biblatex}

% ##### Re-define words
\newcommand{\useThai}{
    \renewcommand{\bibname}{บรรณานุกรม}
    \renewcommand{\contentsname}{สารบัญ}
    \renewcommand{\chaptername}{บทที่}
    \renewcommand{\figurename}{รูปที่}
    \renewcommand{\tablename}{ตารางที่}
    \renewcommand{\listfigurename}{สารบัญรูป}
    \renewcommand{\listtablename}{สารบัญตาราง}
    \renewcommand{\appendixname}{ภาคผนวก}

    \newcommand{\ackname}{กิตติกรรมประกาศ}
    \newcommand{\abstractnameen}{บทคัดย่อ ภาษาอังกฤษ}
    \newcommand{\abstractnameth}{บทคัดย่อ}
    \newcommand{\biographyname}{ประวัติผู้เขียน}
    \newcommand{\pagecolumnname}{หน้า}
    \newcommand{\continuename}{ต่อ}

    % Use thai character sequence
    \newcommand{\setthaienv}{}
}
\newcommand{\useEnglish}{
    \renewcommand{\bibname}{Bibliography}
    \renewcommand{\contentsname}{Content}
    \renewcommand{\chaptername}{Chapter}
    \renewcommand{\figurename}{Figure}
    \renewcommand{\tablename}{Table}
    \renewcommand{\listfigurename}{List of Figures}
    \renewcommand{\listtablename}{List of Tables}
    \renewcommand{\appendixname}{Appendix}

    \newcommand{\ackname}{Acknowledgment}
    \newcommand{\abstractnameen}{Abstract}
    \newcommand{\abstractnameth}{Abstract Thai}
    \newcommand{\biographyname}{Biography}
    \newcommand{\pagecolumnname}{Page}
    \newcommand{\continuename}{Continue}
}

% ##### If condition for Thai language
\newcommand\ifthai[1]{
    \@ifundefined{setthaienv}{}
    {
        #1
    }
}

% ##### Set caption label to be left-aligned
\captionsetup[table]{justification=raggedright, singlelinecheck=off, labelsep=space}
\captionsetup[figure]{labelsep=space}

% ##### Font and Typing
\XeTeXlinebreaklocale "th_TH" %สำหรับตัดคำ
\XeTeXlinebreakskip = 0pt plus 1pt
\linespread{1.3}
\setmainfont{Kinnari}[
	Path = fonts/,
	UprightFont = Kinnari,
	ItalicFont = *-Italic,
	BoldFont = *-Bold,
	BoldItalicFont = *-BoldItalic,
	Extension = .otf,
	Script=Thai
]

% ##### Set Chapter and Section Style
\titleformat{\chapter}[display]
{\normalfont\Large\bfseries\centering}
{\chaptertitlename\ \thechapter}{0pt}{\LARGE}
\titlespacing*{\chapter}{0pt}{-2\baselineskip}{2em}

\titleformat{\section}
{\normalfont\large\bfseries}{\thesection}{0.5em}{}

\titleformat{\subsection}
{\normalfont\bfseries}{\thesubsection}{0.5em}{}
\titlespacing*{\subsection}{0pt}{1em}{0.25em}

% ##### Set a pagination style to be on top right of page
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}


% ##### Override the plain style to make the first chapter page same with other pages
\fancypagestyle{plain}{
    \renewcommand{\headrulewidth}{0pt}
    \lhead{}\rhead{}\chead{}
    \lfoot{}\cfoot{}\rfoot{}
}

% ##### Override subfigure to use Thai alpha instead of English
\def\thaialph#1{\expandafter\thalph\csname c@#1\endcsname}
\def\thalph#1{%
    \ifcase#1\or ก\or ข\or ค\or ง\or จ\or ฉ\or ช\or ซ\or
    ฌ\or ญ\or ฎ\or ฏ\or ฐ\or ฑ\or ฒ\or ณ\or ด\or ต\or ถ\or ท\or ธ\or น\or
    บ\or ป\or ผ\or ฝ\or พ\or ฟ\or ภ\or ม\or ย\or ร\or ฤ\or ล\or ฦ\or ว\or
    ศ\or ษ\or ส\or ห\or ฬ\or อ\else ฮ\else\xpg@ill@value{#1}{thalph}\fi}
\ifthai{\renewcommand\thesubfigure{(\thaialph{subfigure})}}

% ##### TOC Overriden
% อ้างอิงจาก http://kt-linux.blogspot.com/2011/01/latex.html
% ตั้งค่าความลึกของหน้าสารบัญใหม่เป็น 1 (คือลงลึกแค่ชั้นเดียว) และตั้งค่าคำสั่ง \tableofcontents ใหม่
\setcounter{tocdepth}{1}
\renewcommand\tableofcontents{
    \begin{center}
        {\LARGE \textbf{\contentsname} }
    \end{center} \vskip2em
    \begin{flushright}
        \textbf{\pagecolumnname}
    \end{flushright}
    % Hold current page value
    % for TOC heading
    \newcounter{tocitem}
    \setcounter{tocitem}{0}
    \modulolinenumbers[50]
    \linenumbers[1]
    \@starttoc{toc}
    \setcounter{tocitem}{0}
    \clearpage
    \cleardoublepage
}

% สร้างคำสั่งใหม่สำหรับตรวจสอบว่าบรรทัดปัจจุบัน หรือ จำนวนหัวข้อที่แสดงในสารบัญเกินค่าทึ่กำหนดหรือยัง
% หากเกินแล้วให้ตัดขึ้นหน้าใหม่ รีเซตตัวนับ tocitem รีเซตตัวนับบรรทัดใหม่
% และเขียนหัวของหน้าสารบัญใหม่ (เช่น สารบัญ (ต่อ) ในกรณีนี้)
\newcommand{\tocheadcont}[3]{
    \ifthenelse{#1>31 \OR #2>31}{
        %Should be a newpage here.
        \pagebreak[4]
        \resetlinenumber[1]
        \setcounter{tocitem}{0}
        \begin{center}
            {\LARGE \textbf{#3 (\continuename)} }
        \end{center}  \vskip2em
        \begin{flushright}
            \textbf{\pagecolumnname}
        \end{flushright}
    }{}
}

% tocitem format for chapter
\titlecontents{chapter}[0mm]
{\stepcounter{tocitem}\tocheadcont{\thelinenumber}{\thetocitem}{\contentsname}}
{\chaptername\hspace{1ex}\thecontentslabel\hspace{2mm}}
{}{\hfill \contentspage}

% tocitem format for section
\titlecontents{section}[0mm]
{\stepcounter{tocitem}\tocheadcont{\thelinenumber}{\thetocitem}{\contentsname}}
{\hspace{6ex}\thecontentslabel\hspace{2mm}}{\hspace{6ex}\thecontentslabel\hspace{2mm}}
{\hfill \contentspage}

% ##### LOT Overrided
\newcommand{\lotheadcont}[3]{
    \ifthenelse{#1>29 \OR #2>29}{
        %Should be a newpage here.
        \pagebreak[4]
        \resetlinenumber[1]
        \setcounter{lotitem}{1}
        \begin{center}
            {\LARGE \textbf{#3 (\continuename)} }
        \end{center}  \vskip2em
        \begin{flushleft}
            \textbf{\tablename} \hfill \textbf{\pagecolumnname}
        \end{flushleft}
    }{}
}

\renewcommand\listoftables{%
    \begin{center}
        {\LARGE \textbf{\listtablename} }
    \end{center} \vskip2em
    \begin{flushleft}
        \textbf{\tablename} \hfill \textbf{\pagecolumnname}
    \end{flushleft}
    \resetlinenumber[1]
    \newcounter{lotitem}
    \@starttoc{lot}%
    \clearpage
    \cleardoublepage
}

\titlecontents{table}[0mm]{\stepcounter{lotitem}\lotheadcont{\thelinenumber}{\thelotitem}{\listftablename}}{\contentspush{\hspace{5ex}\thecontentslabel\hspace{2mm}}}{}{\hfill \contentspage}

% ##### LOF Overridden
\newcommand{\lofheadcont}[3]{
    \ifthenelse{#1>29 \OR #2>29}{
        %Should be a newpage here.
        \pagebreak[4]
        \resetlinenumber[1]
        \setcounter{lofitem}{1}
        \begin{center}
            {\LARGE \textbf{#3 (\continuename)} }
        \end{center}  \vskip2em
        \begin{flushleft}
            \textbf{\figurename} \hfill \textbf{\pagecolumnname}
        \end{flushleft}
    }{}
}

\renewcommand\listoffigures{%
    \begin{center}
        {\LARGE \textbf{\listfigurename} }
    \end{center} \vskip2em
    \begin{flushleft}
        \textbf{\figurename} \hfill \textbf{\pagecolumnname}
    \end{flushleft}
    \resetlinenumber[1]
    \newcounter{lofitem}
    \@starttoc{lof}
    \pagewiselinenumbers
    \clearpage
    \cleardoublepage
}

% Indent the next line of the entry by the width of the label with \contentspush
\titlecontents{figure}[0mm]{\stepcounter{lofitem}\lofheadcont{\thelinenumber}{\thelofitem}{\listfigurename}}{\contentspush{\hspace{5ex}\thecontentslabel\hspace{2mm}}}{}{\hfill\contentspage}

%  Newcommand each required page
\newcommand{\makecover}{
    % ปกนอก
    \thispagestyle{empty}

    \begin{center}
        \LARGE{\textbf{\ThesisTitle}} \\
        \LARGE{\textbf{\MakeUppercase{\ThesisTitleENG}}} \vfill
        \Large{\textbf{โดย}} \\[0.5cm]
        \Large{\textbf{\Author}} \\
        \Large{\textbf{\MakeUppercase{\AuthorENG}}} \\[0.5cm]
        	% TODO Hide when AuthorTwo is empty
        	\Large{\textbf{\AuthorTwo}} \\
        \Large{\textbf{\MakeUppercase{\AuthorTwoENG}}} \vfill
        \large{\textbf{ปริญญานิพนธ์นี้เป็นส่วนหนึ่งของการศึกษาตามหลักสูตรวิทยาศาสตรบัณฑิต \\
                สาขาวิชาเทคโนโลยีสารสนเทศ \\
                คณะเทคโนโลยีสารสนเทศ \\
                สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง \\
                ภาคเรียนที่~\Sem \  ปีการศึกษา~\AcaY }}
    \end{center}
}

\newcommand{\makeinnercover}{
    % ปกใน
    \newpage
    \thispagestyle{empty}
    \begin{center}
        \LARGE{\textbf{\ThesisTitle}} \\
        \LARGE{\textbf{\MakeUppercase{\ThesisTitleENG}}} \vfill
        \Large{\textbf{โดย}} \\[0.5cm]
        \Large{\textbf{\Author}}  \\[0.5cm]
        % TODO Hide when AuthorTwo is empty
        \Large{\textbf{\AuthorTwo}} \\[1.5cm]
        \Large{\textbf{อาจารย์ที่ปรึกษา}} \\
        \Large{\textbf{\Advisor}} \vfill
        \large{\textbf{ปริญญานิพนธ์นี้เป็นส่วนหนึ่งของการศึกษาตามหลักสูตรวิทยาศาสตรบัณฑิต \\
                สาขาวิชาเทคโนโลยีสารสนเทศ \\
                คณะเทคโนโลยีสารสนเทศ \\
                สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง \\
                ภาคเรียนที่~\Sem \  ปีการศึกษา~\AcaY }}
    \end{center}
}

\newcommand{\makeengcover}{
    % ปกอังกฤษ
    \newpage
    \thispagestyle{empty}
    \begin{center}
        \LARGE{\textbf{\MakeUppercase{\ThesisTitleENG}}} \vfill
        \Large{\textbf{\MakeUppercase{\AuthorENG}}} \\[0.5cm]
        \Large{\textbf{\MakeUppercase{\AuthorTwoENG}}} \vfill
        \large{\textbf{A PROJECT SUBMITTED IN PARTIAL FULFILLMENT \\
                OF THE REQUIREMENT FOR THE DEGREE OF \\
                BACHELOR OF SCIENCE PROGRAM IN INFORMATION TECHNOLOGY \\
                FACULTY OF INFORMATION TECHNOLOGY \\
                KING MONGKUT’S INSTITUTE OF TECHNOLOGY LADKRABANG \\
                \Sem /\AcaYAD}}
    \end{center}
}

\newcommand{\makecopyrightcover}{
    \newpage
    \thispagestyle{empty}
    \null\vfill
    \begin{large}
        \noindent\textbf{COPYRIGHT \CopyrightYAD \\
            FACULTY OF INFORMATION TECHNOLOGY \\
            KING MONGKUT’S INSTITUTE OF TECHNOLOGY LADKRABANG}
    \end{large}
}

\newcommand{\makeack}{
    %-- ACKNOWLEDGEMENTS Page -------------------------------------------
    \newpage
    \begin{center}
        {\LARGE \textbf{\ackname} }
    \end{center} \vskip2em
    \addcontentsline{toc}{chapter}{\ackname}

   \input{acknowledgement}

    \vskip1.5cm
    \begin{flushright}
        \begin{tabular}{c}
            \Author \\
            \AuthorTwo
        \end{tabular}
    \end{flushright}
}

\newcommand{\makeabstract}[1]{
    %-- Abstract Page ------------------------------------------
    \newpage
    \addcontentsline{toc}{chapter}{\abstractnameth}

    \begin{table}[h]
        \begin{tabularx}{\linewidth}{lX}
            \textbf{หัวข้อโครงงาน} & \ThesisTitle \\
            \textbf{นักศึกษา} & \Author \\
            & \AuthorTwo \\
            \textbf{ปริญญา} & วิทยาศาสตรบันฑิต \\
            \textbf{สาขาวิชา} & เทคโนโลยีสารสนเทศ \\
            \textbf{ปีการศึกษา} & \AcaY \\
            \textbf{อาจารย์ที่ปรึกษา} & \Advisor
        \end{tabularx}
    \end{table}

    \vskip1cm
    \begin{center}
        \textbf{\LARGE บทคัดย่อ}
    \end{center}

    #1
}

\newcommand{\makeabstracteng}[1]{
    %-- Abstract Page ------------------------------------------
    \newpage
    \addcontentsline{toc}{chapter}{\abstractnameen}

    \begin{table}[h]
        \begin{tabularx}{\linewidth}{lX}
            \textbf{Project Title} & \MakeUppercase{\ThesisTitleENG} \\
            \textbf{Student} & \AuthorENG \\
            & \AuthorTwoENG \\
            \textbf{Degree} & Bachelor of Science \\
            \textbf{Program} & Information Technology \\
            \textbf{Academic Year} & \AcaYAD \\
            \textbf{Advisor} & \AdvisorENG
        \end{tabularx}
    \end{table}

    \vskip1cm
    \begin{center}
        \textbf{\LARGE Abstract}
    \end{center}

    #1
}

\newcommand\makethesiscert{
	%-- Thesis Certificate Page --------------------------------
	\newpage
	\thispagestyle{empty}

	\begin{center}
		\LARGE{\textbf{ใบรับรองปริญญานิพนธ์ ประจำปีการศึกษา \AcaY}}

		\LARGE{\textbf{คณะเทคโนโลยีสารสนเทศ}}

		\LARGE{\textbf{สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง}}
	\end{center}

	\vskip1cm

	\begin{Large}
		\noindent
		\begin{tabular}{p{1.5cm} >{\raggedright\arraybackslash}p{12.4cm}}
			\textbf{เรื่อง} & \textbf{\ThesisTitle} \\
			\null & \textbf{\MakeUppercase{\ThesisTitleENG}}
		\end{tabular}
	\end{Large}

	\vfill

	\begin{Large}
		\noindent
		\begin{tabular}{l l}
			\textbf{ผู้จัดทำ} & \null \\
			\null & \textbf{1. \Author \ รหัสประจำตัว \SId} \\
			\null & \textbf{2. \AuthorTwo \ รหัสประจำตัว \SIdTwo}
		\end{tabular}
	\end{Large}

	\vfill

    \begin{flushright}
        \begin{tabular}{c l}
            \large{\textbf{.................................................}} & \large{\textbf{อาจารย์ที่ปรึกษา}} \\[5pt]
            \large{\textbf{\Advisor}}
        \end{tabular}
    \end{flushright}
}

\newcommand\makeprojectcert{
	%-- Project Certificate Page -------------------------------
	\newpage
	\thispagestyle{empty}

	\begin{center}
		\begin{bfseries}
			\Large{ใบรับรองโครงงาน (PROJECT)}

			\vfill

			\Large{เรื่อง \\ \ThesisTitle \\ \MakeUppercase{\ThesisTitleENG}}

			\vfill

			\Large{\Author \ รหัสประจำตัว \SId} \\
			\Large{\AuthorTwo \ รหัสประจำตัว \SIdTwo}
		\end{bfseries}

		\vfill

		ขอรับรองว่ารายงานฉบับนี้ ข้าพเจ้าไม่ได้คัดลอกมาจากที่ใด \\
		รายงานฉบับนี้ได้รับการตรวจสอบและอนุมัติให้เป็นส่วนหนึ่งของ \\
		การศึกษาวิชาโครงงาน หลักสูตรวิทยาศาสตรบัณฑิต (เทคโนโลยีสารสนเทศ) \\
		ภาคเรียนที่ \Sem \ ปีการศึกษา \AcaY
	\end{center}

	\vfill

	\begin{flushright}
        \begin{tabular}{c}
            ........................................... \\[5pt]
            \Author \\[10pt]
            ........................................... \\[5pt]
            \AuthorTwo
        \end{tabular}
    \end{flushright}

}

\newcommand\makeauthorbio{
	%-- Author Biography Page -------------------------------
	\newpage

	\begin{center}
    		{\LARGE \textbf{\biographyname} }
	\end{center} \vskip2em
	\addcontentsline{toc}{chapter}{\biographyname}

	\input{author-bio}
}

\newcommand\startappendix{
    \appendix

    \ifthai{\renewcommand{\thechapter}{\thaialph{chapter}}}

    \titlecontents{chapter}[0mm]
    {\stepcounter{tocitem}\tocheadcont{\thelinenumber}{\thetocitem}{\contentsname}}
    {\appendixname\hspace{1ex}\thecontentslabel\hspace{2mm}}
    {}{\hfill \contentspage}
}

\makeatletter

\patchcmd{\@chapter}{\addtocontents{lof}{\protect\addvspace{10\p@}}}{}{}{}% LoF
\patchcmd{\@chapter}{\addtocontents{lot}{\protect\addvspace{10\p@}}}{}{}{}% LoT
\def\bibindent{2.3em}
\let\old@biblabel\@biblabel
\def\@biblabel#1{\old@biblabel{#1}\kern\bibindent}
\let\old@bibitem\bibitem
\def\bibitem#1{\old@bibitem{#1}\leavevmode\kern-\bibindent}

\def\@cont@heading{
   \parindent \z@ \raggedright
     \normalfont
     \interlinepenalty\@M
     \centering
     \LARGE \bfseries \bibname\space(\continuename) \par\nobreak
     \vskip1.15em
}

\def\@chapter[#1]#2{
    \ifnum \c@secnumdepth >\m@ne
        \if@mainmatter
            \refstepcounter{chapter}%
            \typeout{\@chapapp\space\thechapter.}%
            \addcontentsline{toc}{chapter}%
                    {\protect\numberline{\thechapter}#1}%
        \else
            \addcontentsline{toc}{chapter}{#1}%
        \fi
    \else
        \addcontentsline{toc}{chapter}{#1}%
    \fi
    \chaptermark{#1}%
    \if@twocolumn
        \@topnewpage[\@makechapterhead{#2}]%
    \else
        \@makechapterhead{#2}%
        \@afterheading
    \fi
}

\makeatother
