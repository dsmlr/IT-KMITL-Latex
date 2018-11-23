\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{itkmitlcoop}[2018/11/09]

\LoadClass[12pt, a4paper, oneside]{book}

\RequirePackage[top=1in, bottom=1in, left=1.5in, right=1in]{geometry}
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

% ##### new command for Roman number
\newcommand{\rNum}[1]{\lowercase\expandafter{\romannumeral #1\relax}}

% ##### Font and Typing
\XeTeXlinebreaklocale "th_TH" %สำหรับตัดคำ
\XeTeXlinebreakskip = 0pt plus 1pt
\setmainfont[Scale=1.3]{Angsana New}
\linespread{1.3}

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

% ##### Re-define word
\renewcommand{\bibname}{บรรณานุกรม}
\renewcommand{\contentsname}{สารบัญ}
\renewcommand{\chaptername}{บทที่}
\renewcommand{\figurename}{รูปที่}
\renewcommand{\tablename}{ตารางที่}
\renewcommand{\listfigurename}{สารบัญภาพ}
\renewcommand{\listtablename}{สารบัญตาราง}

% ##### Set a pagination style to be on top right of page
\pagestyle{fancy}
\fancyhf{} 
\renewcommand{\headrulewidth}{0pt}
\lhead{}\rhead{\thepage}\chead{}
\lfoot{}\cfoot{}\rfoot{}

% ##### Override the plain style to make the first chapter page same with other pages
\fancypagestyle{plain}{
    \renewcommand{\headrulewidth}{0pt}
    \lhead{}\rhead{\thepage}\chead{}
    \lfoot{}\cfoot{}\rfoot{}
}

% ##### TOC Overrided 
% อ้างอิงจาก http://kt-linux.blogspot.com/2011/01/latex.html
%ตั้งค่าความลึกของหน้าสารบัญใหม่เป็น 1 (คือลงลึกแค่ชั้นเดียว) และตั้งค่าคำสั่ง \tableofcontents ใหม่
\setcounter{tocdepth}{1}
\renewcommand\tableofcontents{
    \begin{center}
        {\LARGE \textbf{สารบัญ} }
    \end{center} \vskip2em
    \begin{flushright}
        \textbf{หน้า}
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

%สร้างคำสั่งใหม่สำหรับตรวจสอบว่าบรรทัดปัจจุบัน หรือ จำนวนหัวข้อที่แสดงในสารบัญเกินค่าทึ่กำหนดหรือยัง หากเกินแล้วให้ตัดขึ้นหน้าใหม่ รีเซตตัวนับ tocitem รีเซตตัวนับบรรทัดใหม่ และเขียนหัวของหน้าสารบัญใหม่ (เช่น สารบัญ (ต่อ) ในกรณีนี้)
\newcommand{\tocheadcont}[3]{
    \ifthenelse{#1>32 \OR #2>32}{
        %Should be a newpage here.
        \pagebreak[4]
        \resetlinenumber[1]
        \setcounter{tocitem}{0}
        \begin{center}
            {\LARGE \textbf{#3 (ต่อ)} }
        \end{center}  \vskip2em
        \begin{flushright}
            \textbf{หน้า}
        \end{flushright}
    }{}
}

% tocitem format for chapter
\titlecontents{chapter}[0mm]
{\stepcounter{tocitem}\tocheadcont{\thelinenumber}{\thetocitem}{สารบัญ}}
{\chaptername\hspace{1ex}\thecontentslabel\hspace{2mm}}
{}{\hfill \contentspage}

% tocitem format for section
\titlecontents{section}[0mm]
{\stepcounter{tocitem}\tocheadcont{\thelinenumber}{\thetocitem}{สารบัญ}}
{\hspace{6ex}\thecontentslabel\hspace{2mm}}{\hspace{6ex}\thecontentslabel\hspace{2mm}}
{\hfill \contentspage}

\renewcommand\listoftables{%
    \begin{center}
        {\LARGE \textbf{\listtablename} }
    \end{center} \vskip2em
    \begin{flushright}
        \textbf{หน้า}
    \end{flushright}
    \resetlinenumber[1]
    \setcounter{tocitem}{0}
    \@starttoc{lot}%
    \setcounter{tocitem}{0}
    \clearpage
    \pagewiselinenumbers
    \cleardoublepage
}

\titlecontents{table}[0mm]{\stepcounter{tocitem}\tocheadcont{\thelinenumber}{\thetocitem}{\listftablename}}{\contentspush{\tablename\hspace{1ex}\thecontentslabel\hspace{2mm}}}{}{\hfill \contentspage}

\renewcommand\listoffigures{%
    \begin{center}
        {\LARGE \textbf{\listfigurename} }
    \end{center} \vskip2em
    \begin{flushright}
        \textbf{หน้า}
    \end{flushright}
    \resetlinenumber[1]
    \setcounter{tocitem}{0}
    \@starttoc{lof}%
    \setcounter{tocitem}{0}
    \clearpage
    \pagewiselinenumbers
    \cleardoublepage
}

% Indent the next line of the entry by the width of the label with \contentspush
\titlecontents{figure}[0mm]{\stepcounter{tocitem}\tocheadcont{\thelinenumber}{\thetocitem}{\listfigurename}}{\contentspush{\figurename\hspace{1ex}\thecontentslabel\hspace{2mm}}}{}{\hfill \contentspage}

%  Newcommand each required page
\newcommand{\makecover}{
    % ปกนอก
    \thispagestyle{empty}
    \begin{center}
        \Large{\textbf{รายงานการปฏิบัติงานสหกิจศึกษา}} \\
        \LARGE{\textbf{เรื่อง \ThesisTiTle}} \vskip4cm
        \Large{\textbf{ปฎิบัติงาน ณ \Company}} \vskip1cm
        \Large{\textbf{โดย}} \vskip1cm
        \Large{\textbf{\AuName}}  \\
        \Large{\textbf{รหัสประจำตัว \SId}} \null \vfill
        \large{\textbf{รายงานนี้เป็นส่วนหนึ่งของการศึกษารายวิชา สหกิจศึกษา \\
                สาขาวิชา\Department คณะเทคโนโลยีสารสเนทศ \\
                ภาคเรียนที่~\Sem \  ปีการศึกษา~\AcaY\\ 
                สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง }}
    \end{center}
}

\newcommand{\makeinnercover}{
    % ปกใน
    \newpage
    \thispagestyle{empty}
    \begin{center}
        \Large{\textbf{รายงานการปฏิบัติงานสหกิจศึกษา}} \\
        \LARGE{\textbf{เรื่อง \ThesisTiTle}} \vskip4cm
        \Large{\textbf{ปฎิบัติงาน ณ \Company}} \vskip1cm
        \Large{\textbf{โดย}} \vskip1cm
        \Large{\textbf{\AuName}}  \\
        \Large{\textbf{รหัสประจำตัว \SId}} \null \vfill
        \large{\textbf{ปฏิบัติงาน ณ มหาลัยวิทยาลัยฮอกไกโด \\
                Hokkaido University Kita 8, Nishi 5, Kita-ku, \\
                Sapporo, Hokkaido, 060-0808 Japan \\ 
                Web site : www.global.hokudai.ac.jp }}
    \end{center}
}

\newcommand{\makeletter}{
    %-- หนังสือส่งรายงานการปฏิบัติงานสหกิจศึกษา -------------------------------------------
    \setcounter{page}{0}
    \newpage
    \addcontentsline{toc}{chapter}{หนังสือส่งรายงานการปฏิบัติงานสหกิจศึกษา}
    \begin{flushright}
        วันที่ \SubD
    \end{flushright}
    
    \noindent เรื่อง ขอส่งรายงานการปฏิบัติงานสหกิจศึกษา \\
    เรียน \Advisor \vskip0.1cm
    
    \hskip0.2cm ที่ปรึกษาสหกิจศึกษาในสาขา \Department \vskip1cm
    
    ตามที่ข้าพเจ้า \AuName \ นักศึกษาสาขาวิชา \Department คณะเทคโนโลยีสารสนเทศ สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง ได้ปฏิบัติงานสหกิจศึกษาระหว่างวันที่ \StartDWork \ ถึงวันที่ \EndDWork \ ในตำแหน่ง ผู้ช่วยนักวิจัย ณ สถานประกอบการชื่อ \Company \ และได้รับมอบหมายจากพนักงานที่ปรึกษาให้ศึกษาและจัดทำรายงาน เรื่อง \ThesisTiTle
    
    บัดนี้ การปฏิบัติงานสหกิจศึกษาได้สิ้นสุดลงแล้ว จึงใคร่ขอส่งรายงานการปฏิบัติงาน สหกิจศึกษาดังกล่าวมาพร้อมนี้ จำนวน 1 เล่ม เพื่อขอรับคำปรึกษาต่อไป 
    
    จึงเรียนมาเพื่อโปรดพิจารณา 
    
    \vskip1.5cm
    \begin{flushright}    
        \begin{tabular}{c}
            ขอแสดงความนับถือ \\ \\
            .............................................................. \\
            (\AuName ) 
        \end{tabular}
    \end{flushright}
}

\newcommand{\makeack}[1]{
    %-- ACKNOWLEDGEMENTS Page -------------------------------------------
    \newpage
    \chapter*{กิตติกรรมประกาศ}
    \addcontentsline{toc}{chapter}{กิตติกรรมประกาศ}
    
    ตามที่ข้าพเจ้า \AuName \ ได้มาปฏิบัติงานสหกิจศึกษา ณ \Company \ ตั้งแต่วันที่ \StartDWork \ ถึงวันที่ \EndDWork \ ทำให้ข้าพเจ้าได้รับความรู้และประสบการณ์ต่าง ๆ ที่มีคุณค่ามากมาย สำหรับรายงานสหกิจศึกษาฉบับนี้สำเร็จลงได้ด้วยดี จากความช่วยเหลือและความร่วมมือสนับสนุนของหลายฝ่าย ดังนี้ 
    
    #1
    
    นอกจากนี้ยังมีบุคคลท่านอื่น ๆ อีกที่ไม่ได้กล่าวไว้ ณ ที่นี้ ซึ่งให้ความกรุณาแนะนำในจัดทำรายงานสหกิจศึกษาฉบับนี้ ข้าพเจ้าจึงใคร่ขอขอบพระคุณทุกท่านที่ได้มีส่วนร่วมในการให้ข้อมูลและให้ความเข้าใจเกี่ยวกับชีวิตของการปฏิบัติงาน รวมถึงเป็นที่ปรึกษาในการจัดทำรายงานฉบับนี้จนเสร็จสมบูรณ์ 
    
    \vskip1.5cm
    \begin{flushright}    
        \begin{tabular}{c}
            \AuName \\
            ผู้จัดทำรายงาน \\
            วันที่ \SubD
        \end{tabular}
    \end{flushright}
}

\newcommand{\makeapproveletter}{
    %-X- หน้าอนุมัติรายงาน -X------------------------------------------
    % Do NOT EDIT this page
    \newpage
    \addcontentsline{toc}{chapter}{หน้าอนุมัติรายงาน}
    \begin{table}[h]
        \begin{tabularx}{\linewidth}{lX}
            \textbf{ชื่อรายงานการปฏิบัติงานสหกิจศึกษา} & \ThesisTiTle \\
            \textbf{ผู้รายงาน} & \AuName \\\
            \textbf{คณะ} & เทคโนโลยีสารสนเทศ \\
            \textbf{สาขาวิชา} & \Department
        \end{tabularx}
    \end{table} \vskip3cm
    
    
    \begin{center}
        ...................................................................... \\
        (\Advisor ) \\
        อาจารย์ที่ปรึกษาสหกิจศึกษา \vskip2.5cm
        
        ...................................................................... \\
        (\Exami) \\
        พนักงานที่ปรึกษา \null \vfill
        
        คณะเทคโนโลยีสารสนเทศ สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง	\\
        อนุมัติให้นับรายงานการปฏิบัติงานสหกิจศึกษาฉบับนี้ เป็นส่วนหนึ่งของการศึกษา \\
        ตามหลักสูตรวิทยาศาสตรบัณฑิต สาขาวิชา\Department
        
    \end{center}
}

\newcommand{\makeabstract}[1]{
    %-- Abstract Page ------------------------------------------
    \newpage
    \addcontentsline{toc}{chapter}{บทคัดย่อ}
    
    \begin{table}[h]
        \begin{tabularx}{\linewidth}{lX}
            \textbf{ชื่อนักศึกษา} & \ThesisTiTle \\
            \textbf{รหัสนักศึกษา} & \AuName \\
            \textbf{สาขาวิชา} & \Department \\
            \textbf{อาจารย์ที่ปรึกษา} & \Advisor \\
            \textbf{ปีการศึกษา} & \AcaY
        \end{tabularx}
    \end{table}
    
    
    \vskip1cm
    \begin{center}
        \textbf{\large บทคัดย่อ}
    \end{center}
    
    #1
}

\newcommand\startappendix{
    \appendix
    \renewcommand*{\appendixname}{ภาคผนวก}
    \renewcommand{\thechapter}{\thaialph{chapter}}
    
    \titlecontents{chapter}[0mm]
    {\stepcounter{tocitem}\tocheadcont{\thelinenumber}{\thetocitem}{สารบัญ}}
    {ภาคผนวก\hspace{1ex}\thecontentslabel\hspace{2mm}}
    {}{\hfill \contentspage}
}