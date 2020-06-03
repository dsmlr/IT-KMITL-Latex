![CI](https://github.com/dobakung/IT-KMITL-Latex/workflows/CI/badge.svg)

# IT@KMITL Latex Template
The latex class for writing a thesis and a cooperation report.

## Build tools

- `Xelatex`
- `Bibtex`

## COOP Report

Latex class `itkmitlcoop.cls` นั้นถูกสร้างสำหรับการจัดทำรูปเล่มรายงานสหกิจ

ภายในโฟลเดอร์ COOP Report นั้นจัดเตรียม Latex สำหรับจัดทำรูปเล่มรายงานสหกิจซึ่งสามารถใช้งานได้ในทันทีเพียงแค่แก้ไขข้อมูลพื้นฐานของผู้เขียน, บทคัดย่อ, และห้าบท โดยไฟล์ของทั้งห้าบทนั้นถูกแยกและใช้วิธีการ `\include` เข้าไปในไฟล์หลัก `full-report.tex` ดังนั้นผู้ใช้สามารถเขียนแต่ละบทแยกลงไปในไฟล์ที่จัดเตรียมไว้ให้ได้ทันที

### Files & Folder

ภายในประกอบด้วย

- `/images` สำหรับใส่ภาพเพื่อใช้แทรกรูปประกอบลงในเล่มรายงาน
- `full-report.tex` ไฟล์หลักที่ใช้สำหรับ `run & build` และสำหรับข้อมูลพื้นฐานของผู้เขียน รวมถึงบทคัดย่อ, กิติกรรมประกาศ, และอื่น ๆ
- `chapter[1-5].tex` ไฟล์สำหรับแก้ไขข้อมูลในแต่ละบท
- `appendix.tex` ไฟล์ภาคผนวก
- `reference.bib` ไฟล์ bibtex 
- `example.pdf` ไฟล์ตัวอย่างเล่มที่สร้างจาก `itkmitlcoop.cls` 
- `full-report.pdf` ไฟล์ pdf output
- `itkmitlcoop.cls` ไฟล์ class

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
More options with `latexmk -help`

## ผู้พัฒนา

นาย บุญฤทธิ์ พิริย์โยธินกุล และผู้พัฒนาเพิ่มเติมในหน้า Collaborators

## MIT License

Copyright (c) 2018 dsmlr

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
