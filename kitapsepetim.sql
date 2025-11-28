--CREATE DATABASE KitapSepetiDB;
use KitapSepetiDB
CREATE TABLE Musteri (
    MusteriID INT IDENTITY(1,1) PRIMARY KEY,
    MusteriAdi NVARCHAR(150),not null,
    MustTelefon VARCHAR(20),not null,
    MustAdres NVARCHAR(300),not null,
);
CREATE TABLE Kitap (
    KitapID INT IDENTITY(1,1) PRIMARY KEY,
    KitapAdi NVARCHAR(200),not null,
    YazarAdi NVARCHAR(150),not null,
    Kategori NVARCHAR(100),not null,
    
);

CREATE TABLE Kargo (
    KargoID INT IDENTITY(1,1) PRIMARY KEY,
    KargoFirma NVARCHAR(100),not null,
    KargoTakipNo VARCHAR(100),not null,
    TeslimDurumu NVARCHAR(50),not null,
);
CREATE TABLE Kampanya (
    KampanyaID INT IDENTITY(1,1) PRIMARY KEY,
    KampanyaKodu VARCHAR(50),not null,
    KampanyaIndirim INT(20),not null,
);

CREATE TABLE Siparis (
    SiparisID INT IDENTITY(1,1) PRIMARY KEY,
    SiparisNo VARCHAR(50) UNIQUE,not null,
    SiparisTarihi DATE,not null,
    MusteriID INT not null,
    KargoID INT not null,
    KampanyaID INT not null,
	BirimFiyat DECIMAL(10,2),not null,
    OdemeTipi NVARCHAR(50),not null,
    FOREIGN KEY (MusteriID) REFERENCES Musteri(MusteriID),
    FOREIGN KEY (KargoID) REFERENCES Kargo(KargoID),
    FOREIGN KEY (KampanyaID) REFERENCES Kampanya(KampanyaID)
);

-- SIPARIS_DETAY (bir sipariþte birden fazla kitap olabilir)
CREATE TABLE SiparisDetay (
    SiparisID INT NOT NULL,
    KitapID INT NOT NULL,
    Adet INT NOT NULL DEFAULT 1,
    ToplamTutar DECIMAL(12,2),
    PRIMARY KEY (SiparisID, KitapID),
    FOREIGN KEY (SiparisID) REFERENCES Siparis(SiparisID),
    FOREIGN KEY (KitapID) REFERENCES Kitap(KitapID)
);

-- YORUM
CREATE TABLE Yorum (
    YorumID INT IDENTITY(1,1) PRIMARY KEY,
    SiparisID INT NOT NULL,
    YorumMetni NVARCHAR(1000),
    YorumPuani TINYINT, -- 0-5 arasý
    FOREIGN KEY (SiparisID) REFERENCES Siparis(SiparisID)
);
