-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 29 Ara 2021, 11:09:03
-- Sunucu sürümü: 8.0.21
-- PHP Sürümü: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `websitesivt`
--
DROP DATABASE IF EXISTS `websitesivt`;
CREATE DATABASE IF NOT EXISTS `websitesivt` DEFAULT CHARACTER SET utf8 COLLATE utf8_turkish_ci;
USE `websitesivt`;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanicitablosu`
--

DROP TABLE IF EXISTS `kullanicitablosu`;
CREATE TABLE IF NOT EXISTS `kullanicitablosu` (
  `kullanicino` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `kullaniciadi` varchar(20) COLLATE utf8_turkish_ci NOT NULL,
  `kullanicisifre` varchar(128) COLLATE utf8_turkish_ci NOT NULL,
  `soru` varchar(35) COLLATE utf8_turkish_ci NOT NULL,
  `cevap` varchar(128) COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`kullanicino`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `kullanicitablosu`
--

INSERT INTO `kullanicitablosu` (`kullanicino`, `kullaniciadi`, `kullanicisifre`, `soru`, `cevap`) VALUES
(1, 'mmyo', '81dc9bdb52d04dc20036dbd8313ed055', 'nedir?', '8ac7ee3023648790ec67636ca0e0fb10'),
(2, 'bip', '81dc9bdb52d04dc20036dbd8313ed055', 'ne nedir?', '8ac7ee3023648790ec67636ca0e0fb10');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sayfalartablosu`
--

DROP TABLE IF EXISTS `sayfalartablosu`;
CREATE TABLE IF NOT EXISTS `sayfalartablosu` (
  `sayfano` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `sayfabaslik` varchar(300) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `anahtarkelimeler` varchar(350) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `sayfalink` varchar(350) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `sayfaicerik` mediumtext CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `yayinlamatarihi` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `guncellemetarihi` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `dil` varchar(3) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL DEFAULT 'TR',
  PRIMARY KEY (`sayfano`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `sayfalartablosu`
--

INSERT INTO `sayfalartablosu` (`sayfano`, `sayfabaslik`, `anahtarkelimeler`, `sayfalink`, `sayfaicerik`, `yayinlamatarihi`, `guncellemetarihi`, `dil`) VALUES
(1, 'Merhaba', 'merhaba', 'merhaba', 'Bu <b>bilgi </b><font size=\"4\"><u>form</u></font> ile<b><font color=\"#990000\"> eklendi</font></b>.', '2021-12-08 13:57:00', '2021-12-08 13:57:00', 'TR'),
(2, 'BÖLÜM HAKKINDA', 'bölüm hakkında', 'bolum_hakkinda', '<div style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: center;\">MUĞLA SITKI KOÇMAN ÜNİVERSİTESİ<br>MUĞLA MESLEK YÜKSEKOKULU<br>BİLGİSAYAR TEKNOLOJİLERİ BÖLÜMÜ<br>BİLGİSAYAR PROGRAMCILIĞI PROGRAMI</div><span style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\">ALINAN UNVAN</span><br style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\">Öğrenciler müfredat programındaki tüm şartları ve mezuniyet gerekliliklerini başarıyla tamamladıktan sonra, “Bilgisayar Programcılığı” alanında Ön lisans derecesi ile mezun olurlar.</span><br style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\">ÖZEL KABUL ŞARTLARI</span><br style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\">Yükseköğretime Öğrenci kabulü için ülke çapında yapılan Yüksek Öğretime Geçiş Sınavı (YGS) girmiş olması veya sınavsız geçiş sınavına başvuru yapmak zorundadır. Yüksek Öğretime Geçiş Sınavı (YGS) yılda bir kez Öğrenci Seçme ve Yerleştirme Merkezi (ÖSYM) tarafından yapılmaktadır. Öğrenci Yüksek Öğretime Geçiş Sınavı (YGS)’den alınan puan ve lise not ortalamalarına göre Yüksek Öğretim kurumlarındaki bölümlere yerleştirilir.</span><br style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\">YETERLİLİK ŞARTLAR</span><br style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\">Ön lisans Derecesi almak için azami öğrenim süresinde sınırlama yoktur.</span><br style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\">&nbsp;ÖNCEKİ ÖĞRENİMLERİN TANINMASI</span><br style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\">Yüksek Öğretim kurumlarına kayıt yaptırmış öğrencilerin farklı üniversiteler de önceden tamamlamış oldukları öğrenimlerinin tanınmasını talep etme hakkına sahiptir. Yeni kayıt yaptıran öğrencilerin öğrenimlerinin tanınması için, kayıt yılının ilk haftası içinde ilgili birimine kendi transkript ve ders içeriklerini sunmalıdırlar.</span><br style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\">TARİHÇE</span><br style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\">Muğla Meslek Yüksekokulu, Bilgisayar Teknolojileri Bölümü Bilgisayar Programı. Bilgisayar Programı&nbsp; okulumuzda 1999 yılında eğitim vermeye başlamıştır. Programımız Normal öğretime 40, İkinci öğretime 40 olmak üzere toplam 80 öğrenci almaktadır.</span><br style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\">&nbsp;</span><br style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\">PROGRAM PROFİLİ</span><br style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\">Programın amacı, kamu ve özel sektör işletmelerine teknik alanda ara eleman yetiştirmektir. Öğrencilere öğrenim süreleri boyunca temel mesleki bilgilerin yanı sıra teknolojiyi kullanma bilgi ve becerisi kazandırmaktır.</span><br style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\">&nbsp;</span><br style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\">&nbsp;</span><br style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\">PROGRAM ÇIKTILARI</span><br style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\">Bilgisayar sistemlerinde yeterli altyapıya sahip olma; bu alandaki kuramsal ve uygulamalı bilgileri bilgisayar sistemlerinde kullanabilme becerisi, Bilgisayar sistemindeki problemleri saptama, tanımlama ve çözme becerisi; bu amaçla uygun yöntemler ve tekniklerini seçme ve uygulama becerisi. Bir sistemi, sistem bileşenini ya da süreci analiz etme ve istenen gereksinimleri karşılamak üzere gerçekçi kısıtlar altında tasarlama becerisi; bu doğrultuda modern tasarım yöntemlerini uygulama becerisi, Bilgisayar programında gerekli olan teknik araçları seçme ve kullanma becerisi; bilişim teknolojilerini etkin kullanma becerisi. Bireysel olarak ve çok disiplinli takımlarda etkin çalışabilme becerisi, sorumluluk alma özgüveni. Bilgiye erişebilmeye bu amaçla kaynak araştırması yapabilme, veri tabanları ve diğer bilgi kaynaklarını kullanabilme becerisi, Yaşam boyu öğrenmenin gerekliliği bilinci; bilim ve teknolojideki gelişmeleri izleme ve kendini sürekli yenileme becerisi. Bilgisayar Programlama alanında tanımı iyi yapılmış problemlerin çözümü için gerekli olan verileri tanımlama, toplama ve kullanmayı etkin bir biçimde yapabilmek; pratik uygulamalarda gereken teorik bilgileri, el ve/veya düşünsel becerileri kullanabildiğini göstermek. Kendi alanında bağımsız olarak öğrenmeyi ve öğrendiklerini uygulayabildiğini göstermek. Kendi alanı ile ilgili çalışmalarda öngörülmeyen durumlarla ilgili sorunları belirleme ve çözüm arama yeteneğini kazandığını göstermek. Sorumluluğu altında çalışanların performanslarını objektif olarak değerlendirmek ve denetlemek. Alanı ile ilgili konularda, sosyal sorumluluk, etik değerler ve sosyal güvenlik hakları bilgisi ve bilincine sahip olmak. Türkçe sözlü ve yazılı etkin iletişim kurma becerisi; en az bir yabancı dil bilgisi.</span><br style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\">&nbsp;SINAVLAR, ÖLÇME VE DEĞERLENDİRME</span><br style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\">Öğrencinin başarı notunun hesaplanmasında dersin niteliğine göre sınavlar yazılı, sözlü, ödev, proje ya da laboratuar çalışması olarak değerlendirilmektedir. Sınavları değerlendirmede; ders başına bir ara sınav % 40 ve/veya ara sınav yerine geçen diğer çalışmaların başarı notuna katkısı % 40, yarıyıl sonu sınavından alınan (final sınavı) notunun başarı notuna katkısı % 60’dır. Öğrencilere kendi gelişimleri için, eğitim almakta oldukları alanla ilgili araştırmaya yönelik projeler öğretim elemanları danışmanlığında yürütülmektedir.</span><br style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\">Mazeret sınavı, mazeretlerle ilgili belgelerini, bir dilekçeyle birlikte sınavların bitimini takip eden ilk iş günü mesai bitimine kadar birimine ulaştırmaları gerekir.</span><br style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\">MEZUNİYET KOŞULLARI</span><br style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\">Bilgisayar alanında ön lisans derecesi elde edebilmek için öğrencilerin programda alması gereken zorunlu ve seçimlik derslerin (toplam 120 AKTS karşılığı) tümünü başarıyla tamamlamak ve genel ağırlıklı not ortalamasının 4.00 üzerinden en az 2.0 olması gerekir.</span><br style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\">MEZUNLARIN İSTİHDAM PROFİLLERİ</span><br style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\">Mezunlarımız başta iletişim ve finans kuruluşları olmak üzere &nbsp;tüm kurum ve kuruluşların bilgi teknolojileri ve alt yapısının projelendirilmesinde, kurulumunda, işletilmesinde, teknik servis hizmetlerinde, yazılım ve web tasarım şirketlerinde; tekniker, teknik destek uzmanı, sistem uzmanı, satış uzmanı, yazılımcı uzman ve orta kademe yönetici olarak çalışmaktadırlar.</span><br style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\">İLERİ ÇALIŞMALARA ERİŞİM</span><br style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\">Ön Lisans eğitimini başarı ile tamamlayan adaylar DGS sınavından geçerli not almaları koşuluyla lisans programlarında öğrenim görebilirler. Mezunlarımız DGS sınavı ile 4 yıllık fakültelerin; Bilgisayar Mühendisliği, Bilgisayar Öğretmenliği, Bilgisayar Sistemleri Öğretmenliği, Bilgisayar Teknolojisi ve Bilişim Sistemleri, Bilgisayar ve Enformasyon Sistemleri, Bilgisayar ve Kontrol Öğretmenliği, Bilgisayar ve Öğretim Teknolojileri Öğretmenliği, Bilgisayar – Enformatik, Bilişim Sistemleri Mühendisliği, Bilişim Sistemleri ve Teknolojileri, Elektronik ve Bilgisayar Öğretmenliği, Enformasyon Teknolojileri, Fizik, İstatistik, İstatistik ve Bilgisayar Bilimleri, Kontrol Mühendisliği, Matematik-Bilgisayar, Meteoroloji Mühendisliği, Uygulamalı Matematik ve Bilgisayar, Uzay Mühendisliği, Yazılım Mühendisliği Lisans Programları\'na dikey geçiş yapabilirler.</span><br style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\">ÇALIŞMA ŞEKLİ</span><br style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\">Tam Zamanlı</span><br style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\">PROGRAM BAŞKANI</span><br style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\">Öğr. Gör. Mehmet KARAKAŞ</span>                        ', '2021-12-08 13:59:00', '2021-12-08 13:59:00', 'TR'),
(3, 'Aday Öğrenci', 'aday öğrenci', 'aday_ogrenci', '<span style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify;\">Programımız ve Özel Koşulları:</span><table align=\"center\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" width=\"0\" style=\"border-spacing: 0px; color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; width: 500px; text-align: initial !important;\"><tbody><tr><td style=\"padding: 0px; width: 203px; height: 17px;\">Program Adı</td><td nowrap=\"nowrap\" style=\"padding: 0px; width: 28px; height: 17px;\">Süre</td><td nowrap=\"nowrap\" style=\"padding: 0px; width: 30px; height: 17px;\">Puan Türü</td><td style=\"padding: 0px; width: 81px; height: 17px;\">Özel Koşulları</td></tr><tr><td style=\"padding: 0px; width: 203px; height: 17px;\">&nbsp; Bilgisayar Programcılığı</td><td nowrap=\"nowrap\" style=\"padding: 0px; width: 28px; height: 17px;\">2</td><td nowrap=\"nowrap\" style=\"padding: 0px; width: 30px; height: 17px;\">TYT</td><td style=\"padding: 0px; width: 81px; height: 17px;\">2</td></tr><tr><td style=\"padding: 0px; width: 203px; height: 17px;\">&nbsp; Bilgisayar Programcılığı (İÖ)</td><td nowrap=\"nowrap\" style=\"padding: 0px; width: 28px; height: 17px;\">2</td><td nowrap=\"nowrap\" style=\"padding: 0px; width: 30px; height: 17px;\">TYT</td><td style=\"padding: 0px; width: 81px; height: 17px;\">1, 2</td></tr></tbody></table><div style=\"color: rgb(51, 51, 51); font-family: &quot;Source Sans Pro&quot;, sans-serif; text-align: justify; clear: both;\">1. İkinci öğretim öğrencileri okulda okudukları öğrenim süresi boyunca her yarıyıl YÖK tarafından belirlenen miktarda harç ücreti ödemekle yükümlüdürler.<br>2. İsteyen öğrencilere kontenjan dahilinde (bazı üniversiteler için kontenjana bağlı olmaksızın) bir yıl süreli yabancı dil hazırlık programı uygulanır. Hazırlık programı süresi, öğretim süresi sütununda gösterilen yıllara dahil değildir.</div>                        ', '2021-12-08 14:00:00', '2021-12-08 14:00:00', 'TR'),
(4, 'Seydikemer', 'seydikemer', 'seydikemer', 'Muğla\'nın en son ilçe olan yeri.', '2021-12-08 14:01:00', '2021-12-08 14:01:00', 'TR'),
(5, 'Fethiye', 'fethiye', 'fethiye', 'Ölüdeniz, yamaç paraşütü ve Göcek koyları ile ünlü yer', '2021-12-08 14:02:00', '2021-12-08 14:02:00', 'TR'),
(6, 'Dalaman', 'dalaman', 'dalaman', 'Hava limanı bulunan ilçelerden biri.', '2021-12-08 14:03:00', '2021-12-08 14:03:00', 'TR'),
(7, 'Ortaca', 'ortaca', 'ortaca', 'Ortaca sonradan ilçe olan yerlerden biri daha', '2021-12-08 14:03:00', '2021-12-08 14:03:00', 'TR');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;