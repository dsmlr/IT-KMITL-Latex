$pdflatex = "xelatex %O %S -interaction=nonstopmode -synctex=1";
$pdf_mode = 1;
$dvi_mode = $postscript_mode = 0;

$out_dir = "build/";

@default_files = ('full-report.tex');
