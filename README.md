# IT-KMITL-Latex
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
- `reference.bib` ไฟล์ bibtex 
- `example.pdf` ไฟล์ตัวอย่างเล่มที่สร้างจาก `itkmitlcoop.cls` 
- `full-report.pdf` ไฟล์ pdf output
- `itkmitlcoop.cls` ไฟล์ class

## Thesis

> ไฟล์ class สำหรับ thesis นั้นยังไม่ถูกพัฒนาขึ้นในตอนนี้ หากใครพอมีเวลาว่างก็สามารถ folk โปรเจกนี้ไปช่วยสร้างขึ้นมา แต่รบกวนช่วย pull request กลับมาเพื่อเป็นประโยชน์แก่นักศึกษาในคณะเทคโนโลยีสาสนเทศต่อไปด้วยนะครับ


## ผู้พัฒนา

นาย บุญฤทธิ์ พิริย์โยธินกุล

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



