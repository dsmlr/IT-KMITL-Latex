# ITKMITL Latex Template for Co-operative Studies & Thesis Report

![CI](https://github.com/dobakung/IT-KMITL-Latex/workflows/CI/badge.svg)

The Latex class for creating your own thesis or cooperative studies report for 4th year Undergraduate student<br>
If you liked to contribute to this project, you may fork and create a pull request to this repository, for the benefits of education

เทมเพลทคลาสเลเท็กซ์สำหรับการจัดทำรูปเล่มรายงานสหกิจฯ และวิทยานิพนธ์สำหรับนักศึกษาปีที่ 4<br>
หากท่านอยากที่จะมีส่วนช่วยในโปรเจ็กต์นี้ ก็สามารถ fork โปรเจ็กต์นี้ และสร้าง pull request กลับมาเพื่อการศึกษาสำหรับนักศึกษารุ่นต่อ ๆ ไป

## Build tools

To create a report, choose `xelatex` and `bibtex` as Latex builder.<br>
เพื่อสร้างรายงาน ให้ท่านใช้ `xelatex` และ `bibtex` เพื่อสร้างไฟล์รายงาน

> `xelatex` will be automatically available after installation of Miktex<br> > `xelatex` จะพร้อมใช้งานอย่างอัตโนมัติหลังจากท่านติดตั้ง Miktex แล้ว

## Files & Folders

### Cooperative Studies

ภายในโฟลเดอร์ `COOP Report` นั้นจัดเตรียม Latex สำหรับจัดทำรูปเล่มรายงานสหกิจซึ่งสามารถใช้งานได้ในทันทีเพียงแค่แก้ไขข้อมูลพื้นฐานของผู้เขียน, บทคัดย่อ, และเนื้อหา 5 บท โดยไฟล์ของทั้งห้าบทนั้นถูกแยกและใช้วิธีการ `\include` เข้าไปในไฟล์หลัก `full-report.tex` ดังนั้นผู้ใช้สามารถเขียนแต่ละบทแยกลงไปในไฟล์ที่จัดเตรียมไว้ให้ได้ทันที

- `/images` สำหรับใส่ภาพเพื่อใช้แทรกรูปประกอบลงในเล่มรายงาน
- `full-report.tex` ไฟล์หลักที่ใช้สำหรับ `run & build` และสำหรับข้อมูลพื้นฐานของผู้เขียน รวมถึงบทคัดย่อ, กิติกรรมประกาศ, และอื่น ๆ
- `chapter[1-5].tex` ไฟล์สำหรับแต่ละบท
- `appendix.tex` ไฟล์ภาคผนวก
- `reference.bib` ไฟล์ bibtex (บรรณานุกรม)
- `itkmitlcoop.cls` ไฟล์ class
- `example.pdf` ไฟล์ตัวอย่างเล่มที่สร้างจาก `itkmitlcoop.cls`
- `full-report.pdf` ไฟล์ output หลังจากการ compile

## Project Report

คลาสสำหรับรูปเล่มโปรเจ็กต์ (`itkmitlproject.cls`) ถูกดัดแปลงจากคลาสของ COOP Report ในส่วนเนื้อหาและโครงสร้างเล็กน้อย
รวมทั้งเลือกใช้ฟอนต์โอเพ่นซอร์ส Kinnari (เนื่องจากคอมพิวเตอร์บางเครื่องอาจไม่มี Angsana New)
พร้อมปรับขนาดตัวอักษรในรูปเล่มให้เทียบ x-height เดิมของ COOP Report

หากต้องการใช้ฟอนต์ Angsana New ให้แก้ไขการตั้งค่าฟอนต์ใน `itkmitlproject.cls` ด้วยการเปลี่ยน 11pt -> 12pt ใน `\LoadClass`
และเพิ่ม `Scale=1.2` ใน `\setmainfont`

- `/images` สำหรับใส่ภาพเพื่อใช้แทรกรูปประกอบลงในเล่มรายงาน
- `/fonts` ฟอนต์ที่ใช้ในรูปเล่ม
- `full-report.tex` ไฟล์หลักที่ใช้สำหรับ `run & build` และสำหรับข้อมูลพื้นฐานของผู้เขียน รวมถึงบทคัดย่อ และอื่น ๆ
- `chapter[1-5].tex` ไฟล์สำหรับแก้ไขข้อมูลในแต่ละบท
- `acknowledgement.tex` ไฟล์กิตติกรรมประกาศ (เฉพาะส่วนเนื้อหา)
- `appendix.tex` ไฟล์ภาคผนวก
- `author-bio.tex` ไฟล์ประวัติผู้เขียน
- `reference.bib` ไฟล์ bibtex 
- `full-report.pdf` ไฟล์ pdf output
- `itkmitlcoop.cls` ไฟล์ class

คลาสสำหรับรูปเล่มโปรเจ็กต์ถูกออกแบบมาสำหรับโปรเจ็กต์ที่มีผู้จัดทำสองท่าน และอาจารย์ที่ปรึกษาหนึ่งท่าน หากมีจำนวนต่างจากนี้ จำเป็นต้องแก้ไขในไฟล์คลาส
ซึ่งจุดนี้ควรได้รับการปรับปรุงในอนาคตให้ตั้งค่าจากไฟล์ `full-report.tex` ได้ในตัว

สำหรับผู้ที่ต้องการทำรูปแบบรายงานภาษาอังกฤษ สามารถใช้ `\useEnglish` แทน `\useThai` ใน `full-report.tex`

## Installation

### Ubuntu / Debian
```
sudo apt install latexmk
sudo apt install texlive-xetex
```

## Usage
Build
```
latexmk
```
Build and preview continuously
```
latexmk -pvc
```
Clean all regeneratable files
```
latexmk -c
```
More options with `latexmk -help` or `man latexmk`

Currently, thesis template is not available for use. If you like to support us, please contribute to the repository by creating the pull request.<br>
สำหรับเทมเพลท Thesis ในขณะนี้ยังไม่ได้ถูกพัฒนาขึ้น แต่หากท่านอยากที่จะช่วยสนับสนุนในด้านการทำเทมเพลท ท่านสามารถช่วยเหลือเราโดยการสร้าง Pull Request มาที่ repository นี้

นาย บุญฤทธิ์ พิริย์โยธินกุล และผู้พัฒนาเพิ่มเติมในหน้า Collaborators

## MIT License

Copyright (c) 2018 dsmlr

This project is licensed as MIT License. Please checkout [LICENSE.md](https://github.com/dsmlr/IT-KMITL-Latex/blob/master/LICENSE) for more detail.<br>
โปรเจ็กต์นี้มีข้อตกลงการใช้งานประเภท MIT License ท่านสามารถอ่านต่อได้ที่ไฟล์ [LICENSE.md](https://github.com/dsmlr/IT-KMITL-Latex/blob/master/LICENSE)

## Developer

นาย บุญฤทธิ์ พิริย์โยธินกุล

---

[![forthebadge](https://forthebadge.com/images/badges/built-with-love.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/powered-by-responsibility.svg)](https://forthebadge.com)
