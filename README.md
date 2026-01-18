# Eczane İlaç ve Reçete Takip Sistemi

Bu proje, bir eczanede hastalar, ilaçlar ve reçetelerin Microsoft SQL Server
üzerinden yönetilmesini sağlayan örnek bir veritabanı uygulamasıdır.

## 🎯 Proje Amacı
- Hasta bilgilerini saklamak
- İlaç stoklarını ve fiyatlarını takip etmek
- Reçete ve reçete detaylarını yönetmek
- SQL sorguları ile veri analizi yapmak

## 🗂️ Veritabanı Yapısı
Projede aşağıdaki tablolar bulunmaktadır:
- **Hasta**
- **Ilac**
- **Recete**
- **ReceteDetay**

Tablolar arasında birincil anahtar (PRIMARY KEY) ve yabancı anahtar (FOREIGN KEY)
ilişkileri kurulmuştur.

## ⚙️ Kullanılan Teknolojiler
- Microsoft SQL Server (MSSQL)
- SQL (DDL, DML, JOIN, GROUP BY)

## ▶️ Nasıl Çalıştırılır?
1. Microsoft SQL Server Management Studio (SSMS) açılır.
2. `database/eczane_ilac_recete.sql` dosyası açılır.
3. Script çalıştırılarak veritabanı ve tablolar oluşturulur.
4. Örnek veriler otomatik olarak eklenir.
5. Sorgular çalıştırılarak sistem test edilebilir.

## 📌 Notlar
- Proje eğitim ve portföy amaçlıdır.
- Gerçek kişi bilgileri içermemektedir.
- Web veya mobil uygulama ile entegre edilebilir yapıdadır.

## 🔮 Gelecek Geliştirmeler
- Web tabanlı arayüz (HTML, CSS, JavaScript)
- Backend ile MSSQL bağlantısı
- Mobil uygulama entegrasyonu
