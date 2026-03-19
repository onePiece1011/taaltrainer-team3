-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 19 mrt 2026 om 09:23
-- Serverversie: 10.4.32-MariaDB
-- PHP-versie: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `taaltrainer_t3`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `target_language` enum('tr','ku') DEFAULT 'tr',
  `xp_points` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `users`
--

INSERT INTO `users` (`id`, `username`, `PASSWORD`, `target_language`, `xp_points`, `created_at`) VALUES
(1, 'OP_hellking', '$2y$10$bI5BvkfTduxeMhSXEX/gMefvV62cV2sJL9z8UYz77ww6Nz8P2QIEW', 'tr', 0, '2026-03-18 13:19:46');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `user_progress`
--

CREATE TABLE `user_progress` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `vocab_id` int(11) DEFAULT NULL,
  `is_learned` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `vocabulary`
--

CREATE TABLE `vocabulary` (
  `id` int(11) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `dutch_word` varchar(100) DEFAULT NULL,
  `turkish_word` varchar(100) DEFAULT NULL,
  `kurdish_word` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `vocabulary`
--

INSERT INTO `vocabulary` (`id`, `category`, `dutch_word`, `turkish_word`, `kurdish_word`) VALUES
(1, 'Woorden', 'Water', 'su', 'Av'),
(2, 'Woorden', 'Brood', 'Ekmek', 'Nan'),
(3, 'Woorden', 'Melk', 'Süt', 'Şîr'),
(4, 'Woorden', 'Appel', 'Elma', 'Sêv'),
(5, 'Woorden', 'Ei', 'Yumurta', 'Hêk'),
(6, 'Woorden', 'Kaas', 'Peynir', 'Penêr'),
(7, 'Woorden', 'Vlees', 'Et', 'Goşt'),
(8, 'Woorden', 'Rijst', 'Pirinç', 'Birinc'),
(9, 'Woorden', 'Thee', 'Çay', 'Çay'),
(10, 'Woorden', 'Koffie', 'Kahve', 'Qehve'),
(11, 'Woorden', 'Suiker', 'Şeker', 'Şekir'),
(12, 'Woorden', 'Zout', 'Tuz', 'Xwê'),
(13, 'Woorden', 'Groente', 'Sebze', 'Keskahî'),
(14, 'Woorden', 'Fruit', 'Meyve', 'Fêkî'),
(15, 'Woorden', 'Soep', 'Çorba', 'Şorbe'),
(16, 'Woorden', 'Boter', 'Tereyağı', 'Rûnê nivîşk'),
(17, 'Woorden', 'Honing', 'Bal', 'Hingiv'),
(18, 'Woorden', 'Vis', 'Balık', 'Masî'),
(19, 'Woorden', 'Kip', 'Tavuk', 'Mirîşk'),
(20, 'Woorden', 'Ui', 'Soğan', 'Pîvaz'),
(21, 'Woorden', 'Knoflook', 'Sarımsak', 'Sîr'),
(22, 'Woorden', 'Moeder', 'Anne', 'Dayik'),
(23, 'Woorden', 'Vader', 'Baba', 'Bav'),
(24, 'Woorden', 'Zoon', 'Oğul', 'Kur'),
(25, 'Woorden', 'Dochter', 'Kız evlat', 'Keç'),
(26, 'Woorden', 'Broer', 'Erkek kardeş', 'Biray'),
(27, 'Woorden', 'Zus', 'Kız kardeş', 'Xwişk'),
(28, 'Woorden', 'Oma', 'Büyükanne', 'Dapîr'),
(29, 'Woorden', 'Opa', 'Büyükbaba', 'Bapîr'),
(30, 'Woorden', 'Kind', 'Çocuk', 'Zarok'),
(31, 'Woorden', 'Baby', 'Bebek', 'Sava'),
(32, 'Woorden', 'Oom (vaderskant)', 'Amca', 'Mam'),
(33, 'Woorden', 'Oom (moederskant)', 'Dayı', 'Xal'),
(34, 'Woorden', 'Tante (vaderskant)', 'Hala', 'Met'),
(35, 'Woorden', 'Tante (moederskant)', 'Teyze', 'Xaltî'),
(36, 'Woorden', 'Neef', 'Yeğen/Kuzen', 'Kurê ap/met/xal/xaltî'),
(37, 'Woorden', 'Nicht', 'Yeğen/Kuzen', 'Keça ap/met/xal/xaltî'),
(38, 'Woorden', 'Vrouw/Echtgenote', 'Eş/Kadın', 'Jin'),
(39, 'Woorden', 'Man/Echtgenoot', 'Eş/Adam', 'Mêr'),
(40, 'Woorden', 'Vriend', 'Arkadaş', 'Heval'),
(41, 'Woorden', 'Familie', 'Aile', 'Malbat'),
(42, 'Getallen', 'Eén', 'Bir', 'Yek'),
(43, 'Getallen', 'Twee', 'İki', 'Du'),
(44, 'Getallen', 'Drie', 'Üç', 'Sê'),
(45, 'Getallen', 'Vier', 'Dört', 'Çar'),
(46, 'Getallen', 'Vijf', 'Beş', 'Pênc'),
(47, 'Getallen', 'Zes', 'Altı', 'Şeş'),
(48, 'Getallen', 'Zeven', 'Yedi', 'Heft'),
(49, 'Getallen', 'Acht', 'Sekiz', 'Heşt'),
(50, 'Getallen', 'Negen', 'Dokuz', 'Neh'),
(51, 'Getallen', 'Tien', 'On', 'Deh'),
(52, 'Getallen', 'Elf', 'On bir', 'Yazdeh'),
(53, 'Getallen', 'Twaalf', 'On iki', 'Duwazdeh'),
(54, 'Getallen', 'Twintig', 'Yirmi', 'Bîst'),
(55, 'Getallen', 'Dertig', 'Otuz', 'Sî'),
(56, 'Getallen', 'Veertig', 'Kırk', 'Çil'),
(57, 'Getallen', 'Vijftig', 'Elli', 'Pêncî'),
(58, 'Getallen', 'Honderd', 'Yüz', 'Sed'),
(59, 'Getallen', 'Duizend', 'Bin', 'Hezar'),
(60, 'Getallen', 'Eerste', 'Birinci', 'Yekem'),
(61, 'Getallen', 'Tweede', 'İkinci', 'Duwem'),
(62, 'Woorden', 'Maandag', 'Pazartesi', 'Duşem'),
(63, 'Woorden', 'Dinsdag', 'Salı', 'Sêşem'),
(64, 'Woorden', 'Woensdag', 'Çarşamba', 'Çarşem'),
(65, 'Woorden', 'Donderdag', 'Perşembe', 'Pêncşem'),
(66, 'Woorden', 'Vrijdag', 'Cuma', 'În'),
(67, 'Woorden', 'Zaterdag', 'Cumartesi', 'Şemî'),
(68, 'Woorden', 'Zondag', 'Pazar', 'Yekşem'),
(69, 'Woorden', 'Vandaag', 'Bugün', 'Îro'),
(70, 'Woorden', 'Gisteren', 'Dün', 'Duh'),
(71, 'Woorden', 'Morgen', 'Yarın', 'Sibê'),
(72, 'Woorden', 'Dag', 'Gün', 'Roj'),
(73, 'Woorden', 'Nacht', 'Gece', 'Şev'),
(74, 'Woorden', 'Ochtend', 'Sabah', 'Sibe'),
(75, 'Woorden', 'Avond', 'Akşam', 'Êvar'),
(76, 'Woorden', 'Week', 'Hafta', 'Hevte'),
(77, 'Woorden', 'Maand', 'Ay', 'Meh'),
(78, 'Woorden', 'Jaar', 'Yıl', 'Sal'),
(79, 'Woorden', 'Uur', 'Saat', 'Saet'),
(80, 'Woorden', 'Minuut', 'Dakika', 'Xulek'),
(81, 'Woorden', 'Nu', 'Şimdi', 'Niha'),
(82, 'Woorden', 'Huis', 'Ev', 'Mal'),
(83, 'Woorden', 'Auto', 'Araba', 'Erebî'),
(84, 'Woorden', 'Boek', 'Kitap', 'Pirtûk'),
(85, 'Woorden', 'Pen', 'Kalem', 'Pênûs'),
(86, 'Woorden', 'Telefoon', 'Telefon', 'Telefon'),
(87, 'Woorden', 'Sleutel', 'Anahtar', 'Mifte'),
(88, 'Woorden', 'Tafel', 'Masa', 'Mase'),
(89, 'Woorden', 'Stoel', 'Sandalye', 'Kursî'),
(90, 'Woorden', 'Deur', 'Kapı', 'Derî'),
(91, 'Woorden', 'Raam', 'Pencere', 'Pencere'),
(92, 'Woorden', 'Bed', 'Yatak', 'Cî/Nivîn'),
(93, 'Woorden', 'Kleding', 'Kıyafet', 'Cil'),
(94, 'Woorden', 'Schoenen', 'Ayakkabı', 'Pêlav'),
(95, 'Woorden', 'Tas', 'Çanta', 'Çente'),
(96, 'Woorden', 'Geld', 'Para', 'Pere'),
(97, 'Woorden', 'Krant', 'Gazete', 'Rojname'),
(98, 'Woorden', 'School', 'Okul', 'Dibistan'),
(99, 'Woorden', 'Stad', 'Şehir', 'Bajar'),
(100, 'Woorden', 'Weg', 'Yol', 'Rê'),
(101, 'Woorden', 'Licht', 'Işık', 'Ronahî'),
(102, 'Zinnen', 'Hoe gaat het?', 'Nasılsın?', 'Tu çawa yî?'),
(103, 'Zinnen', 'Met mij gaat het goed.', 'İyiyim.', 'Ez baş im.'),
(104, 'Zinnen', 'Wat is je naam?', 'Adın ne?', 'Navê te çi ye?'),
(105, 'Zinnen', 'Mijn naam is...', 'Benim adım...', 'Navê min... e.'),
(106, 'Zinnen', 'Aangenaam kennis te maken.', 'Memnun oldum.', 'Bi dîtina te şa bûm.'),
(107, 'Zinnen', 'Hoe oud ben je?', 'Kaç yaşındasın?', 'Tu çend salî yî?'),
(108, 'Zinnen', 'Waar kom je vandaan?', 'Nerelisin?', 'Tu ji kîderê yî?'),
(109, 'Zinnen', 'Ik kom uit Nederland.', 'Hollandalıyım.', 'Ez ji Hollandayê me.'),
(110, 'Zinnen', 'Waar woon je?', 'Nerede yaşıyorsun?', 'Tu li ku derê dijî?'),
(111, 'Zinnen', 'Ik begrijp het niet.', 'Anlamıyorum.', 'Ez fehm nakim.'),
(112, 'Zinnen', 'Spreek je Engels?', 'İngilizce biliyor musun?', 'Tu bi Îngilîzî dizanî?'),
(113, 'Zinnen', 'Kun je me helpen?', 'Bana yardım edebilir misiniz?', 'Tu dikarî alîkariya min bikî?'),
(114, 'Zinnen', 'Natuurlijk.', 'Tabii ki.', 'Helbet.'),
(115, 'Zinnen', 'Dank je wel.', 'Teşekkür ederim.', 'Spas dikim.'),
(116, 'Zinnen', 'Graag gedaan.', 'Rica ederim.', 'Hêja nîne / Rica dikim.'),
(117, 'Zinnen', 'Alstublieft (geven).', 'Buyurun.', 'Kerem bike.'),
(118, 'Zinnen', 'Het spijt me / Sorry.', 'Özür dilerim.', 'Bibone / Lêborîn dixwazim.'),
(119, 'Zinnen', 'Geen probleem.', 'Sorun değil.', 'Pirsgirêk nîne.'),
(120, 'Zinnen', 'Hoe laat is het?', 'Saat kaç?', 'Saet çend e?'),
(121, 'Zinnen', 'Ik heb honger.', 'Acıktım.', 'Birçî bûm.'),
(122, 'Zinnen', 'Ik heb dorst.', 'Susadım.', 'Tî bûm.'),
(123, 'Zinnen', 'Eet smakelijk.', 'Afiyet olsun.', 'Noşî gîyan be.'),
(124, 'Zinnen', 'Wat kost dit?', 'Bu ne kadar?', 'Ev bi çendê ye?'),
(125, 'Zinnen', 'Het is te duur.', 'Çok pahalı.', 'Zêde biha ye.'),
(126, 'Zinnen', 'Waar is het toilet?', 'Tuvalet nerede?', 'Destşo li ku derê ye?'),
(127, 'Zinnen', 'Ik hou van je.', 'Seni seviyorum.', 'Ez ji te hez dikim.'),
(128, 'Zinnen', 'Gefeliciteerd.', 'Tebrik ederim.', 'Pîroz be.'),
(129, 'Zinnen', 'Veel succes.', 'Başarılar dilerim.', 'Serkeftinê dixwazim.'),
(130, 'Zinnen', 'Goedenavond.', 'İyi akşamlar.', 'Êvar baş.'),
(131, 'Zinnen', 'Goedenacht.', 'İyi geceler.', 'Şev baş.'),
(132, 'Zinnen', 'Tot ziens.', 'Görüşürüz.', 'Bi xatirê te / Em ê hev bibînin.'),
(133, 'Zinnen', 'Goede reis.', 'İyi yolculuklar.', 'Rêwîtîya bi xêr.'),
(134, 'Zinnen', 'Wat doe je?', 'Ne yapıyorsun?', 'Tu çi dikî?'),
(135, 'Zinnen', 'Ik ben moe.', 'Yorgunum.', 'Ez westîyam.'),
(136, 'Zinnen', 'Ik ben ziek.', 'Hastayım.', 'Ez nexweş im.'),
(137, 'Zinnen', 'Laten we gaan.', 'Hadi gidelim.', 'De em herin.'),
(138, 'Zinnen', 'Wacht even.', 'Bir dakika bekle.', 'Hinekî bisekinin.'),
(139, 'Zinnen', 'Ik weet het niet.', 'Bilmiyorum.', 'Ez nizanim.'),
(140, 'Zinnen', 'Ik herinner het me niet.', 'Hatırlamıyorum.', 'Nayê bîra min.'),
(141, 'Zinnen', 'Maak je geen zorgen.', 'Endişelenme.', 'Xem nexwe.'),
(142, 'Zinnen', 'Het is mooi weer.', 'Hava çok güzel.', 'Hewa pir xweş e.'),
(143, 'Zinnen', 'Ik heb een vraag.', 'Bir sorum var.', 'Pirsyarek min heye.'),
(144, 'Zinnen', 'Kunt u dat herhalen?', 'Tekrar edebilir misiniz?', 'Tu dikarî dûbare bikî?'),
(145, 'Zinnen', 'Langzaam alsjeblieft.', 'Yavaşça lütfen.', 'Hêdîka ji kerema xwe.'),
(146, 'Zinnen', 'Wat betekent dit?', 'Bu ne anlama geliyor?', 'Ev tê çi wateyê?'),
(147, 'Zinnen', 'Ik ben verdwaald.', 'Kayboldum.', 'Ez winda bûm.'),
(148, 'Zinnen', 'Help me!', 'İmdat! / Yardım et!', 'Alîkarîya min bike!'),
(149, 'Zinnen', 'Gezondheid! (na niezen).', 'Çok yaşa!', 'Bijî!'),
(150, 'Zinnen', 'Welkom.', 'Hoş geldiniz.', 'Bi xêr hatî.'),
(151, 'Zinnen', 'Ik ben gelukkig.', 'Mutluyum.', 'Ez bextewar im.');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexen voor tabel `user_progress`
--
ALTER TABLE `user_progress`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `vocab_id` (`vocab_id`);

--
-- Indexen voor tabel `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `user_progress`
--
ALTER TABLE `user_progress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `vocabulary`
--
ALTER TABLE `vocabulary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `user_progress`
--
ALTER TABLE `user_progress`
  ADD CONSTRAINT `user_progress_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_progress_ibfk_2` FOREIGN KEY (`vocab_id`) REFERENCES `vocabulary` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
