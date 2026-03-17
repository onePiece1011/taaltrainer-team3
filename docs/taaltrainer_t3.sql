-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 17 mrt 2026 om 09:29
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
  `email` varchar(100) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `target_language` enum('tr','ku') DEFAULT 'tr',
  `xp_points` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'Eten & Drinken', 'Water', 'su', 'Av'),
(2, 'Eten & Drinken', 'Brood', 'Ekmek', 'Nan'),
(3, 'Eten & Drinken', 'Melk', 'Süt', 'Şîr'),
(4, 'Eten & Drinken', 'Appel', 'Elma', 'Sêv'),
(5, 'Eten & Drinken', 'Ei', 'Yumurta', 'Hêk'),
(6, 'Eten & Drinken', 'Kaas', 'Peynir', 'Penêr'),
(7, 'Eten & Drinken', 'Vlees', 'Et', 'Goşt'),
(8, 'Eten & Drinken', 'Rijst', 'Pirinç', 'Birinc'),
(9, 'Eten & Drinken', 'Thee', 'Çay', 'Çay'),
(10, 'Eten & Drinken', 'Koffie', 'Kahve', 'Qehve'),
(11, 'Eten & Drinken', 'Suiker', 'Şeker', 'Şekir'),
(12, 'Eten & Drinken', 'Zout', 'Tuz', 'Xwê'),
(13, 'Eten & Drinken', 'Groente', 'Sebze', 'Keskahî'),
(14, 'Eten & Drinken', 'Fruit', 'Meyve', 'Fêkî'),
(15, 'Eten & Drinken', 'Soep', 'Çorba', 'Şorbe'),
(16, 'Eten & Drinken', 'Boter', 'Tereyağı', 'Rûnê nivîşk'),
(17, 'Eten & Drinken', 'Honing', 'Bal', 'Hingiv'),
(18, 'Eten & Drinken', 'Vis', 'Balık', 'Masî'),
(19, 'Eten & Drinken', 'Kip', 'Tavuk', 'Mirîşk'),
(20, 'Eten & Drinken', 'Ui', 'Soğan', 'Pîvaz'),
(21, 'Eten & Drinken', 'Knoflook', 'Sarımsak', 'Sîr'),
(22, 'Familie', 'Moeder', 'Anne', 'Dayik'),
(23, 'Familie', 'Vader', 'Baba', 'Bav'),
(24, 'Familie', 'Zoon', 'Oğul', 'Kur'),
(25, 'Familie', 'Dochter', 'Kız evlat', 'Keç'),
(26, 'Familie', 'Broer', 'Erkek kardeş', 'Biray'),
(27, 'Familie', 'Zus', 'Kız kardeş', 'Xwişk'),
(28, 'Familie', 'Oma', 'Büyükanne', 'Dapîr'),
(29, 'Familie', 'Opa', 'Büyükbaba', 'Bapîr'),
(30, 'Familie', 'Kind', 'Çocuk', 'Zarok'),
(31, 'Familie', 'Baby', 'Bebek', 'Sava'),
(32, 'Familie', 'Oom (vaderskant)', 'Amca', 'Mam'),
(33, 'Familie', 'Oom (moederskant)', 'Dayı', 'Xal'),
(34, 'Familie', 'Tante (vaderskant)', 'Hala', 'Met'),
(35, 'Familie', 'Tante (moederskant)', 'Teyze', 'Xaltî'),
(36, 'Familie', 'Neef', 'Yeğen/Kuzen', 'Kurê ap/met/xal/xaltî'),
(37, 'Familie', 'Nicht', 'Yeğen/Kuzen', 'Keça ap/met/xal/xaltî'),
(38, 'Familie', 'Vrouw/Echtgenote', 'Eş/Kadın', 'Jin'),
(39, 'Familie', 'Man/Echtgenoot', 'Eş/Adam', 'Mêr'),
(40, 'Familie', 'Vriend', 'Arkadaş', 'Heval'),
(41, 'Familie', 'Familie', 'Aile', 'Malbat'),
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
(62, 'Tijd & Dagen', 'Maandag', 'Pazartesi', 'Duşem'),
(63, 'Tijd & Dagen', 'Dinsdag', 'Salı', 'Sêşem'),
(64, 'Tijd & Dagen', 'Woensdag', 'Çarşamba', 'Çarşem'),
(65, 'Tijd & Dagen', 'Donderdag', 'Perşembe', 'Pêncşem'),
(66, 'Tijd & Dagen', 'Vrijdag', 'Cuma', 'În'),
(67, 'Tijd & Dagen', 'Zaterdag', 'Cumartesi', 'Şemî'),
(68, 'Tijd & Dagen', 'Zondag', 'Pazar', 'Yekşem'),
(69, 'Tijd & Dagen', 'Vandaag', 'Bugün', 'Îro'),
(70, 'Tijd & Dagen', 'Gisteren', 'Dün', 'Duh'),
(71, 'Tijd & Dagen', 'Morgen', 'Yarın', 'Sibê'),
(72, 'Tijd & Dagen', 'Dag', 'Gün', 'Roj'),
(73, 'Tijd & Dagen', 'Nacht', 'Gece', 'Şev'),
(74, 'Tijd & Dagen', 'Ochtend', 'Sabah', 'Sibe'),
(75, 'Tijd & Dagen', 'Avond', 'Akşam', 'Êvar'),
(76, 'Tijd & Dagen', 'Week', 'Hafta', 'Hevte'),
(77, 'Tijd & Dagen', 'Maand', 'Ay', 'Meh'),
(78, 'Tijd & Dagen', 'Jaar', 'Yıl', 'Sal'),
(79, 'Tijd & Dagen', 'Uur', 'Saat', 'Saet'),
(80, 'Tijd & Dagen', 'Minuut', 'Dakika', 'Xulek'),
(81, 'Tijd & Dagen', 'Nu', 'Şimdi', 'Niha'),
(82, 'Dagelijkse Voorwerpen', 'Huis', 'Ev', 'Mal'),
(83, 'Dagelijkse Voorwerpen', 'Auto', 'Araba', 'Erebî'),
(84, 'Dagelijkse Voorwerpen', 'Boek', 'Kitap', 'Pirtûk'),
(85, 'Dagelijkse Voorwerpen', 'Pen', 'Kalem', 'Pênûs'),
(86, 'Dagelijkse Voorwerpen', 'Telefoon', 'Telefon', 'Telefon'),
(87, 'Dagelijkse Voorwerpen', 'Sleutel', 'Anahtar', 'Mifte'),
(88, 'Dagelijkse Voorwerpen', 'Tafel', 'Masa', 'Mase'),
(89, 'Dagelijkse Voorwerpen', 'Stoel', 'Sandalye', 'Kursî'),
(90, 'Dagelijkse Voorwerpen', 'Deur', 'Kapı', 'Derî'),
(91, 'Dagelijkse Voorwerpen', 'Raam', 'Pencere', 'Pencere'),
(92, 'Dagelijkse Voorwerpen', 'Bed', 'Yatak', 'Cî/Nivîn'),
(93, 'Dagelijkse Voorwerpen', 'Kleding', 'Kıyafet', 'Cil'),
(94, 'Dagelijkse Voorwerpen', 'Schoenen', 'Ayakkabı', 'Pêlav'),
(95, 'Dagelijkse Voorwerpen', 'Tas', 'Çanta', 'Çente'),
(96, 'Dagelijkse Voorwerpen', 'Geld', 'Para', 'Pere'),
(97, 'Dagelijkse Voorwerpen', 'Krant', 'Gazete', 'Rojname'),
(98, 'Dagelijkse Voorwerpen', 'School', 'Okul', 'Dibistan'),
(99, 'Dagelijkse Voorwerpen', 'Stad', 'Şehir', 'Bajar'),
(100, 'Dagelijkse Voorwerpen', 'Weg', 'Yol', 'Rê'),
(101, 'Dagelijkse Voorwerpen', 'Licht', 'Işık', 'Ronahî');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `user_progress`
--
ALTER TABLE `user_progress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `vocabulary`
--
ALTER TABLE `vocabulary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

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
