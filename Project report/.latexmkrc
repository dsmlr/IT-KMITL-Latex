$pdflatex = "xelatex %O %S -interaction=nonstopmode";
$pdf_mode = 1;
$dvi_mode = $postscript_mode = 0;

$aux_dir = "build/aux/";
$out_dir = "build/";

@default_files = ('full-report.tex');
