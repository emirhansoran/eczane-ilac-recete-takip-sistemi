CREATE DATABASE Eczane;
USE Eczane;

CREATE TABLE Hasta (
    hasta_id INT IDENTITY(1,1) PRIMARY KEY,
    ad VARCHAR(20) NOT NULL,
    soyad VARCHAR(20) NOT NULL,
    telefon VARCHAR(12) UNIQUE NOT NULL,
    dogum_tarihi DATE NULL
);

CREATE TABLE Ilac (
    ilac_id INT IDENTITY(1,1) PRIMARY KEY,
    ilac_adi VARCHAR(50) NOT NULL UNIQUE,
    fiyat DECIMAL(10,2) NOT NULL CHECK (fiyat > 0),
    stok INT NOT NULL DEFAULT 0 CHECK (stok >= 0)
);

CREATE TABLE Recete (
    recete_id INT IDENTITY(1,1) PRIMARY KEY,
    hasta_id INT NOT NULL,
    recete_tarihi DATE NOT NULL,
    FOREIGN KEY (hasta_id) REFERENCES Hasta(hasta_id)
);

CREATE TABLE ReceteDetay (
    recete_detay_id INT IDENTITY(1,1) PRIMARY KEY,
    recete_id INT NOT NULL,
    ilac_id INT NOT NULL,
    adet INT NOT NULL CHECK (adet > 0),
    FOREIGN KEY (recete_id) REFERENCES Recete(recete_id),
    FOREIGN KEY (ilac_id) REFERENCES Ilac(ilac_id)
);

INSERT INTO Hasta (ad, soyad, telefon, dogum_tarihi) VALUES
('Ahmet', 'Yılmaz', '05320000001', '1985-04-12'),
('Ayşe', 'Kaya', '05320000002', '1990-09-23'),
('Mehmet', 'Demir', '05320000003', '2001-01-15'),
('Seda', 'Çelik', '05320000004', '1978-06-30'),
('Can', 'Aydın', '05320000005', '1995-12-08');

INSERT INTO Ilac (ilac_adi, fiyat, stok) VALUES
('Parol', 45.50, 100),
('Aspirin', 32.75, 80),
('Augmentin', 120.00, 30),
('Minoset', 40.00, 60),
('Majezik', 55.25, 50);

INSERT INTO Recete (hasta_id, recete_tarihi) VALUES
(1, '2025-12-01'),
(2, '2025-12-02'),
(3, '2025-12-03'),
(4, '2025-12-04'),
(5, '2025-12-05');

INSERT INTO ReceteDetay (recete_id, ilac_id, adet) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 1),
(3, 4, 2),
(4, 5, 1);

SELECT * FROM Hasta;
SELECT * FROM Ilac;
SELECT * FROM Recete;
SELECT * FROM ReceteDetay;

SELECT * FROM Hasta WHERE dogum_tarihi >= '2000-01-01';
SELECT * FROM Ilac WHERE fiyat > 50;

UPDATE Ilac SET fiyat = 50 WHERE ilac_adi = 'Parol';
DELETE FROM Ilac WHERE stok < 50;

SELECT COUNT(*) AS ToplamHasta FROM Hasta;
SELECT SUM(adet) AS ToplamIlacAdedi FROM ReceteDetay;
SELECT AVG(fiyat) AS OrtalamaFiyat FROM Ilac;
SELECT MIN(fiyat) AS EnUcuzIlac, MAX(fiyat) AS EnPahaliIlac FROM Ilac;

SELECT * FROM Hasta WHERE soyad LIKE '%Yılmaz';
SELECT * FROM Ilac WHERE ilac_adi LIKE '%Parol%';

SELECT * FROM Hasta ORDER BY ad, soyad;
SELECT * FROM Ilac ORDER BY fiyat DESC;

SELECT hasta_id, COUNT(recete_id) AS ReceteSayisi
FROM Recete
GROUP BY hasta_id
HAVING COUNT(recete_id) >= 1;

EXEC sp_rename 'Hasta.telefon', 'telefon_no';

SELECT h.ad, h.soyad, r.recete_tarihi
FROM Hasta h
JOIN Recete r ON h.hasta_id = r.hasta_id;

SELECT h.ad, h.soyad, r.recete_tarihi, i.ilac_adi, rd.adet
FROM Hasta h
JOIN Recete r ON h.hasta_id = r.hasta_id
JOIN ReceteDetay rd ON r.recete_id = rd.recete_id
JOIN Ilac i ON rd.ilac_id = i.ilac_id;
