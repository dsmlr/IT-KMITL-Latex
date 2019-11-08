# ITKMITL Latex Template for Co-operative Studies & Thesis Report

The Latex class for creating your own thesis or cooperative studies report for 4th year Undergraduate student<br>
เทมเพลทคลาสเลเท็กซ์สำหรับการจัดทำรูปเล่มรายงานสหกิจฯ และวิทยานิพนธ์สำหรับนักศึกษาปีที่ 4

If you liked to contribute to this project, you may fork and create a pull request to this repository, for the benefits of education<br>
หากท่านอยากที่จะมีส่วนช่วยในโปรเจ็กต์นี้ ก็สามารถ fork โปรเจ็กต์นี้ และสร้าง pull request กลับมาเพื่อการศึกษาสำหรับนักศึกษารุ่นต่อ ๆ ไป

## Build tools

To create a report, choose `xelatex` as Latex builder.<br>
เพื่อสร้างรายงาน ให้ท่านเลือกตัว build `xelatex` เพื่อสร้างไฟล์รายงาน

> `xelatex` will be automatically available after installation of Miktex<br> > `xelatex` จะพร้อมใช้งานอย่างอัตโนมัติหลังจากท่านติดตั้ง Miktex แล้ว

## Files & Folders

ภายในโฟลเดอร์ `COOP Report` นั้นจัดเตรียม Latex สำหรับจัดทำรูปเล่มรายงานสหกิจซึ่งสามารถใช้งานได้ในทันทีเพียงแค่แก้ไขข้อมูลพื้นฐานของผู้เขียน, บทคัดย่อ, และเนื้อหา 5 บท โดยไฟล์ของทั้งห้าบทนั้นถูกแยกและใช้วิธีการ `\include` เข้าไปในไฟล์หลัก `full-report.tex` ดังนั้นผู้ใช้สามารถเขียนแต่ละบทแยกลงไปในไฟล์ที่จัดเตรียมไว้ให้ได้ทันที

- `/images` สำหรับใส่ภาพเพื่อใช้แทรกรูปประกอบลงในเล่มรายงาน
- `full-report.tex` ไฟล์หลักที่ใช้สำหรับ `run & build` และสำหรับข้อมูลพื้นฐานของผู้เขียน รวมถึงบทคัดย่อ, กิติกรรมประกาศ, และอื่น ๆ
- `chapter[1-5].tex` ไฟล์สำหรับแต่ละบท
- `appendix.tex` ไฟล์ภาคผนวก
- `reference.bib` ไฟล์ bibtex (บรรณานุกรม)
- `itkmitlcoop.cls` ไฟล์ class
- `example.pdf` ไฟล์ตัวอย่างเล่มที่สร้างจาก `itkmitlcoop.cls`
- `full-report.pdf` ไฟล์ output หลังจากการ compile

Currently, thesis template is not available for use. If you like to support us, please contribute to the repository by creating the pull request.<br>
สำหรับเทมเพลท Thesis ในขณะนี้ยังไม่ได้ถูกพัฒนาขึ้น แต่หากท่านอยากที่จะช่วยสนับสนุนในด้านการทำเทมเพลท ท่านสามารถช่วยเหลือเราโดยการสร้าง Pull Request มาที่ repository นี้

## License

This project is licensed as MIT License. Please checkout [LICENSE.md](https://github.com/dsmlr/IT-KMITL-Latex/blob/master/LICENSE) for more detail.<br>
โปรเจ็กต์นี้มีข้อตกลงการใช้งานประเภท MIT License ท่านสามารถอ่านต่อได้ที่ไฟล์ [LICENSE.md](https://github.com/dsmlr/IT-KMITL-Latex/blob/master/LICENSE)

## Developer

นาย บุญฤทธิ์ พิริย์โยธินกุล

---

[![forthebadge](https://forthebadge.com/images/badges/built-with-love.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/powered-by-responsibility.svg)](https://forthebadge.com)
