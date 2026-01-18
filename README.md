# Eczane İlaç ve Reçete Takip Sistemi

Bu proje, bir eczanenin ilaç, hasta ve reçete süreçlerini takip edebilmesi amacıyla
MSSQL kullanılarak geliştirilmiş ilişkisel bir veritabanı projesidir.

## Kullanılan Teknolojiler
- MSSQL
- SQL

## Veri Tabanı Yapısı
Projede aşağıdaki tablolar bulunmaktadır:
- Hasta
- Ilac
- Recete
- ReceteDetay

Tablolar arasında Primary Key ve Foreign Key ilişkileri kurulmuştur.

## Özellikler
- Hasta kayıtlarının tutulması
- İlaç stok ve fiyat takibi
- Hastalara ait reçetelerin listelenmesi
- Reçetelerde yer alan ilaç ve adet bilgilerinin görüntülenmesi

## Kullanılan SQL Yapıları
- CREATE TABLE
- PRIMARY KEY / FOREIGN KEY
- UNIQUE, NOT NULL, CHECK, DEFAULT
- INSERT, SELECT, UPDATE, DELETE
- WHERE, LIKE
- GROUP BY, HAVING
- JOIN
- COUNT, SUM, AVG, MIN, MAX

## Örnek Sorgu
```sql
SELECT h.ad, h.soyad, r.recete_tarihi, i.ilac_adi, rd.adet
FROM Hasta h
JOIN Recete r ON h.hasta_id = r.hasta_id
JOIN ReceteDetay rd ON r.recete_id = rd.recete_id
JOIN Ilac i ON rd.ilac_id = i.ilac_id;
