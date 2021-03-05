# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0]
This release contains complete Cooperative Studies and Thesis Latex templates.

### Added 
- GitHub Workflow for testing the template build-ability (`.github/workflows/build.yml`)
- Full availability for Project Report
  - Latexmkrc for Project report (`Project report/.latexmkrc`)
  - Project report description in Project `report/README.md`
  - Acknowledgement for Project Report (`Project report/acknowledgement.tex`)
  - Appendix for Project Report (`Project report/appendix.tex`)
  - Author Bio for Project Report (`Project report/author-bio.tex`)
  - Chapter 1-5 for Project Report
  - Full report
  - Reference file for Project Report
- Kinnari font as Angsana font backup


### Changed
- .gitignore to include all .pdf file
- .gitignore to include `/build` and .DS_Store
- Moved Cooperative Studies description to `COOP report/README.md`
- Remove whitespace in Cooperative Studies full report (COOP report/full-report.tex)
