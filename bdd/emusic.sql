-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3307
-- Généré le : mer. 03 déc. 2025 à 10:15
-- Version du serveur : 11.3.2-MariaDB
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `emusic`
--

-- --------------------------------------------------------

--
-- Structure de la table `accessoire`
--

DROP TABLE IF EXISTS `accessoire`;
CREATE TABLE IF NOT EXISTS `accessoire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instrument_id` int(11) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8FD026ACF11D9C` (`instrument_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `accessoire`
--

INSERT INTO `accessoire` (`id`, `instrument_id`, `libelle`) VALUES
(1, 1, 'Housse de protection'),
(2, 1, 'Kit de nettoyage cuivre'),
(3, 2, 'Métronome électronique'),
(4, 3, 'Clé d’accord'),
(5, 4, 'Câble jack premium'),
(6, 5, 'Baguettes de rechange'),
(7, 7, 'Support clavier réglable'),
(8, 8, 'Pédale de sustain'),
(9, 9, 'Étui rigide de transport'),
(10, 10, 'Embouchure supplémentaire'),
(11, 12, 'Housse velours'),
(12, 13, 'Kit de réparation jack'),
(13, 14, 'Sangle de maintien'),
(14, 17, 'Kit de nettoyage bois'),
(15, 18, 'Rosin (colophane)'),
(16, 20, 'Stand universel'),
(17, 23, 'Adaptateur audio USB'),
(18, 25, 'Pochettes anti-humidité'),
(19, 27, 'Câble MIDI'),
(20, 30, 'Mallets de percussion');

-- --------------------------------------------------------

--
-- Structure de la table `classe_instrument`
--

DROP TABLE IF EXISTS `classe_instrument`;
CREATE TABLE IF NOT EXISTS `classe_instrument` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `classe_instrument`
--

INSERT INTO `classe_instrument` (`id`, `libelle`) VALUES
(1, 'Corde'),
(2, 'Cuivre'),
(3, 'Bois'),
(4, 'Percussion'),
(5, 'Clavier'),
(6, 'Electronique'),
(7, 'Cordes pincées'),
(8, 'Vent');

-- --------------------------------------------------------

--
-- Structure de la table `contrat_pret`
--

DROP TABLE IF EXISTS `contrat_pret`;
CREATE TABLE IF NOT EXISTS `contrat_pret` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instrument_id` int(11) DEFAULT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `attestation_assurance` varchar(255) NOT NULL,
  `etat_detaille_debut` varchar(255) NOT NULL,
  `etat_detaille_retour` varchar(255) NOT NULL,
  `eleves_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1FB84C67CF11D9C` (`instrument_id`),
  KEY `IDX_1FB84C67C2140342` (`eleves_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `contrat_pret`
--

INSERT INTO `contrat_pret` (`id`, `instrument_id`, `date_debut`, `date_fin`, `attestation_assurance`, `etat_detaille_debut`, `etat_detaille_retour`, `eleves_id`) VALUES
(1, 25, '2024-03-25', '2027-06-02', 'attestation_0.pdf', 'Bon état (avant prêt)', 'Bon état (après retour)', 21),
(2, 25, '2024-03-25', '2024-06-02', 'attestation_0.pdf', 'Bon état (avant prêt)', 'Bon état (après retour)', 5),
(3, 20, '2024-04-26', '2024-06-10', 'attestation_1.pdf', 'Bon état (avant prêt)', 'Bon état (après retour)', 7),
(4, 25, '2024-03-25', '2024-06-02', 'attestation_0.pdf', 'Bon état (avant prêt)', 'Bon état (après retour)', 12),
(5, 20, '2024-04-26', '2024-06-10', 'attestation_1.pdf', 'Bon état (avant prêt)', 'Bon état (après retour)', 24),
(6, 30, '2023-10-19', '2023-12-24', 'attestation_2.pdf', 'Bon état (avant prêt)', 'Bon état (après retour)', 13),
(7, 20, '2024-09-01', '2025-01-06', 'attestation_3.pdf', 'Bon état (avant prêt)', 'Bon état (après retour)', 26),
(8, 5, '2024-06-20', '2024-10-31', 'attestation_4.pdf', 'Bon état (avant prêt)', 'Bon état (après retour)', 28),
(9, 17, '2023-11-21', '2024-01-06', 'attestation_5.pdf', 'Bon état (avant prêt)', 'Bon état (après retour)', 29),
(10, 14, '2024-02-05', '2024-03-26', 'attestation_6.pdf', 'Bon état (avant prêt)', 'Bon état (après retour)', 27),
(11, 13, '2024-01-27', '2024-03-31', 'attestation_7.pdf', 'Bon état (avant prêt)', 'Bon état (après retour)', 28),
(12, 26, '2024-02-29', '2024-08-18', 'attestation_8.pdf', 'Bon état (avant prêt)', 'Bon état (après retour)', 15),
(13, 18, '2024-04-08', '2024-09-30', 'attestation_9.pdf', 'Bon état (avant prêt)', 'Bon état (après retour)', 8),
(14, 4, '2024-02-21', '2024-04-27', 'attestation_10.pdf', 'Bon état (avant prêt)', 'Bon état (après retour)', 29),
(15, 11, '2024-02-12', '2024-08-08', 'attestation_11.pdf', 'Bon état (avant prêt)', 'Bon état (après retour)', 16),
(16, 17, '2023-12-24', '2024-01-29', 'attestation_12.pdf', 'Bon état (avant prêt)', 'Bon état (après retour)', 21),
(17, 21, '2024-05-17', '2024-09-19', 'attestation_13.pdf', 'Bon état (avant prêt)', 'Bon état (après retour)', 6),
(18, 7, '2024-09-09', '2024-10-15', 'attestation_14.pdf', 'Bon état (avant prêt)', 'Bon état (après retour)', 8),
(19, 24, '2023-12-27', '2024-06-17', 'attestation_15.pdf', 'Bon état (avant prêt)', 'Bon état (après retour)', 1),
(20, 27, '2024-05-31', '2024-08-22', 'attestation_16.pdf', 'Bon état (avant prêt)', 'Bon état (après retour)', 11),
(21, 2, '2023-11-21', '2024-05-09', 'attestation_17.pdf', 'Bon état (avant prêt)', 'Bon état (après retour)', 29),
(22, 13, '2024-07-13', '2024-11-13', 'attestation_18.pdf', 'Bon état (avant prêt)', 'Bon état (après retour)', 14),
(23, 21, '2024-08-01', '2024-12-20', 'attestation_19.pdf', 'Bon état (avant prêt)', 'Bon état (après retour)', 30),
(24, 23, '2024-08-20', '2025-02-10', 'attestation_20.pdf', 'Bon état (avant prêt)', 'Bon état (après retour)', 32),
(25, 21, '2023-11-03', '2024-01-18', 'attestation_21.pdf', 'Bon état (avant prêt)', 'Bon état (après retour)', 31),
(26, 2, '2024-09-08', '2024-12-11', 'attestation_22.pdf', 'Bon état (avant prêt)', 'Bon état (après retour)', 5),
(27, 5, '2024-03-24', '2024-06-08', 'attestation_23.pdf', 'Bon état (avant prêt)', 'Bon état (après retour)', 15),
(28, 9, '2024-10-08', '2025-03-31', 'attestation_24.pdf', 'Bon état (avant prêt)', 'Bon état (après retour)', 6),
(29, 13, '2024-06-10', '2024-08-14', 'attestation_25.pdf', 'Bon état (avant prêt)', 'Bon état (après retour)', 10),
(30, 23, '2023-12-19', '2024-03-02', 'attestation_26.pdf', 'Bon état (avant prêt)', 'Bon état (après retour)', 6),
(31, 16, '2024-07-29', '2024-12-26', 'attestation_27.pdf', 'Bon état (avant prêt)', 'Bon état (après retour)', 25),
(32, 10, '2023-10-29', '2024-01-12', 'attestation_28.pdf', 'Bon état (avant prêt)', 'Bon état (après retour)', 17),
(33, 3, '2024-06-26', '2024-08-26', 'attestation_29.pdf', 'Bon état (avant prêt)', 'Bon état (après retour)', 2);

-- --------------------------------------------------------

--
-- Structure de la table `couleur`
--

DROP TABLE IF EXISTS `couleur`;
CREATE TABLE IF NOT EXISTS `couleur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `couleur`
--

INSERT INTO `couleur` (`id`, `nom`) VALUES
(1, 'Noir'),
(2, 'Blanc'),
(3, 'Marron'),
(4, 'Rouge'),
(5, 'Bleu'),
(6, 'Gris'),
(7, 'Doré'),
(8, 'Argent'),
(9, 'Beige'),
(10, 'Vert');

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

DROP TABLE IF EXISTS `cours`;
CREATE TABLE IF NOT EXISTS `cours` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `professeur_id` int(11) DEFAULT NULL,
  `type_instrument_id` int(11) DEFAULT NULL,
  `libelle` varchar(80) NOT NULL,
  `age_mini` int(11) NOT NULL,
  `age_maxi` int(11) NOT NULL,
  `heure_debut` time NOT NULL,
  `heure_fin` time NOT NULL,
  `date_cours` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FDCA8C9CBAB22EE9` (`professeur_id`),
  KEY `IDX_FDCA8C9C7C1CAAA9` (`type_instrument_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cours`
--

INSERT INTO `cours` (`id`, `professeur_id`, `type_instrument_id`, `libelle`, `age_mini`, `age_maxi`, `heure_debut`, `heure_fin`, `date_cours`) VALUES
(1, 10, 1, 'Piano Débutant', 9, 13, '10:30:00', '11:00:00', 'Mardi'),
(2, 9, 8, 'Guitare Classique', 9, 15, '12:50:00', '14:00:00', 'Lundi'),
(3, 8, 7, 'Atelier Jazz', 9, 13, '15:30:00', '16:30:00', 'Jeudi'),
(4, 7, 8, 'Chorale', 7, 17, '14:25:00', '15:00:00', 'Lundi'),
(5, 6, 6, 'Musique Baroque', 8, 18, '12:00:00', '13:00:00', 'Vendredi'),
(6, 5, 1, 'Flûte Traversière', 10, 16, '10:30:00', '12:00:00', 'Mercredi'),
(7, 4, 2, 'Improvisation', 10, 14, '09:00:00', '10:00:00', 'Mercredi'),
(8, 3, 1, 'Orchestre Jeune', 8, 11, '10:00:00', '11:30:00', 'Samedi'),
(9, 2, 9, 'Solfège', 10, 12, '08:10:00', '10:00:00', 'Samedi'),
(10, 1, 8, 'Percussions', 10, 13, '08:40:00', '10:00:00', 'Lundi');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20251015062314', '2025-11-03 15:58:06', 11610),
('DoctrineMigrations\\Version20251105083118', '2025-11-05 08:31:41', 1674),
('DoctrineMigrations\\Version20251105083328', '2025-11-05 08:33:32', 443),
('DoctrineMigrations\\Version20251105083410', '2025-11-05 08:34:19', 286),
('DoctrineMigrations\\Version20251105094750', '2025-11-05 09:48:39', 600),
('DoctrineMigrations\\Version20251105104244', '2025-11-05 10:42:57', 1554),
('DoctrineMigrations\\Version20251110095900', '2025-11-10 09:59:06', 261),
('DoctrineMigrations\\Version20251110103143', '2025-11-10 10:32:06', 1602),
('DoctrineMigrations\\Version20251126084222', '2025-11-26 08:42:30', 1306),
('DoctrineMigrations\\Version20251126084712', '2025-11-26 08:47:20', 259),
('DoctrineMigrations\\Version20251201132010', '2025-12-01 13:23:48', 1118),
('DoctrineMigrations\\Version20251203081548', '2025-12-03 08:15:59', 1173),
('DoctrineMigrations\\Version20251203082224', '2025-12-03 08:22:34', 1198),
('DoctrineMigrations\\Version20251203093148', '2025-12-03 09:32:02', 614);

-- --------------------------------------------------------

--
-- Structure de la table `eleves`
--

DROP TABLE IF EXISTS `eleves`;
CREATE TABLE IF NOT EXISTS `eleves` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `responsables_id` int(11) DEFAULT NULL,
  `tranche_id` int(11) DEFAULT NULL,
  `nom` varchar(80) NOT NULL,
  `prenom` varchar(80) NOT NULL,
  `date_naiss` date NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_383B09B1592968A8` (`responsables_id`),
  KEY `IDX_383B09B1B76F6B31` (`tranche_id`),
  KEY `IDX_383B09B1D60322AC` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `eleves`
--

INSERT INTO `eleves` (`id`, `responsables_id`, `tranche_id`, `nom`, `prenom`, `date_naiss`, `role_id`) VALUES
(1, 15, 2, 'Evrard', 'René', '2011-03-19', 2),
(2, 22, 30, 'Charles', 'Bertrand', '2013-08-01', 2),
(3, 10, 8, 'Lemoine', 'Camille', '2010-02-14', 2),
(4, 17, 12, 'Durant', 'Alexandre', '2012-11-25', 2),
(5, 20, 3, 'Philippe', 'Valentine', '2013-03-07', 2),
(6, 7, 16, 'Rodriguez', 'Antoinette', '2008-09-19', 2),
(7, 5, 16, 'Teixeira', 'Thomas', '2011-05-02', 2),
(8, 6, 5, 'Perret', 'Henri', '2007-07-17', 2),
(9, 19, 23, 'Perrin', 'Marcel', '2018-08-27', 2),
(10, 6, 9, 'Michel', 'Sophie', '2018-05-26', 2),
(11, 2, 6, 'Diallo', 'Nathalie', '2007-04-04', 2),
(12, 28, 27, 'Grondin', 'Julien', '2018-01-06', 2),
(13, 12, 25, 'Gosselin', 'Georges', '2015-09-12', 2),
(14, 14, 23, 'Guillaume', 'Claudine', '2007-06-20', 2),
(15, 9, 2, 'Brunel', 'Suzanne', '2015-01-15', 2),
(16, 1, 6, 'Peltier', 'Marie', '2008-09-26', 2),
(17, 21, 14, 'Fontaine', 'Élise', '2014-09-16', 2),
(18, 28, 30, 'Parent', 'Isabelle', '2015-11-30', 2),
(19, 18, 14, 'Bourdon', 'Maryse', '2012-03-18', 2),
(20, 2, 1, 'Rodriguez', 'Gabrielle', '2012-10-14', 2),
(21, 25, 1, 'Benard', 'Diane', '2017-01-29', 2),
(22, 18, 13, 'Gauthier', 'Roland', '2011-10-05', 2),
(23, 15, 23, 'Guillou', 'Daniel', '2014-07-15', 2),
(24, 21, 4, 'Blanchet', 'Jean', '2007-09-21', 2),
(25, 19, 13, 'Cousin', 'Océane', '2017-07-27', 2),
(26, 22, 22, 'Delahaye', 'Guillaume', '2012-07-24', 2),
(27, 11, 18, 'Boucher', 'Agathe', '2008-10-22', 2),
(28, 1, 8, 'Joseph', 'Franck', '2016-09-04', 2),
(29, 29, 12, 'Pruvost', 'Michelle', '2016-01-12', 2),
(30, 26, 23, 'Duhamel', 'Diane', '2015-06-08', 2);


-- --------------------------------------------------------

--
-- Structure de la table `inscriptions`
--

DROP TABLE IF EXISTS `inscriptions`;
CREATE TABLE IF NOT EXISTS `inscriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eleves_id` int(11) DEFAULT NULL,
  `cours_id` int(11) DEFAULT NULL,
  `nombre_paiments` int(11) NOT NULL,
  `date_inscription` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_74E0281C7ECF78B0` (`cours_id`),
  KEY `IDX_74E0281CC2140342` (`eleves_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `inscriptions`
--

INSERT INTO `inscriptions` (`id`, `eleves_id`, `cours_id`, `nombre_paiments`, `date_inscription`) VALUES
(201, 1, 5, 2, '2024-09-15'),
(202, 2, 3, 1, '2024-09-20'),
(203, 5, 8, 2, '2024-09-22'),
(204, 6, 7, 1, '2024-09-25'),
(205, 7, 4, 2, '2024-09-28'),
(206, 8, 1, 1, '2024-10-01'),
(207, 9, 8, 2, '2024-10-05'),
(208, 10, 1, 2, '2024-10-08'),
(209, 11, 5, 1, '2024-10-12'),
(210, 12, 2, 2, '2024-10-15'),
(211, 13, 9, 3, '2024-10-18'),
(212, 14, 6, 1, '2024-10-22'),
(213, 15, 4, 2, '2024-10-25'),
(214, 16, 3, 2, '2024-10-28'),
(215, 17, 7, 1, '2024-11-01'),
(216, 18, 5, 3, '2024-11-05'),
(217, 19, 4, 1, '2024-11-08'),
(218, 20, 7, 2, '2024-11-12'),
(219, 21, 5, 1, '2024-11-15'),
(220, 22, 1, 3, '2024-11-18'),
(221, 23, 8, 2, '2024-11-22'),
(222, 24, 4, 2, '2024-11-25'),
(223, 25, 2, 1, '2024-11-28'),
(224, 26, 8, 3, '2024-12-02'),
(225, 27, 5, 2, '2024-12-05'),
(226, 28, 6, 2, '2024-12-09'),
(227, 29, 8, 3, '2024-12-12'),
(228, 30, 9, 1, '2024-12-16'),
(229, 31, 5, 1, '2024-12-19'),
(230, 32, 3, 2, '2024-12-23'),
(231, 1, 1, 2, '2025-01-08'),
(232, 2, 2, 3, '2025-01-12'),
(233, 6, 9, 2, '2025-01-15'),
(234, 8, 3, 1, '2025-01-19'),
(235, 9, 7, 3, '2025-01-22'),
(236, 11, 8, 2, '2025-01-26'),
(237, 14, 1, 1, '2025-01-29'),
(238, 17, 5, 3, '2025-02-02'),
(239, 18, 6, 2, '2025-02-05'),
(240, 22, 9, 3, '2025-02-09'),
(241, 23, 2, 2, '2025-02-12'),
(242, 25, 8, 1, '2025-02-16'),
(243, 26, 5, 2, '2025-02-19'),
(244, 28, 7, 1, '2025-02-23'),
(245, 29, 4, 3, '2025-02-26'),
(246, 30, 2, 1, '2025-03-02'),
(247, 32, 1, 2, '2025-03-05');

-- --------------------------------------------------------

--
-- Structure de la table `instrument`
--

DROP TABLE IF EXISTS `instrument`;
CREATE TABLE IF NOT EXISTS `instrument` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_instrument_id` int(11) DEFAULT NULL,
  `couleur_id` int(11) DEFAULT NULL,
  `marque_id` int(11) DEFAULT NULL,
  `num_serie` int(11) NOT NULL,
  `date_achat` date NOT NULL,
  `prix_achat` double NOT NULL,
  `utilisation` int(11) NOT NULL,
  `chemin_image` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3CBF69DD7C1CAAA9` (`type_instrument_id`),
  KEY `IDX_3CBF69DDC31BA576` (`couleur_id`),
  KEY `IDX_3CBF69DD4827B9B2` (`marque_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `instrument`
--

INSERT INTO `instrument` (`id`, `type_instrument_id`, `couleur_id`, `marque_id`, `num_serie`, `date_achat`, `prix_achat`, `utilisation`, `chemin_image`) VALUES
(1, 2, 7, 3, 84852, '2025-06-04', 1601.6, 180, '/img/instrument/1.jpg'),
(2, 1, 9, 1, 65867, '2023-10-17', 325.55, 117, '/img/instrument/2.jpg'),
(3, 9, 9, 11, 78952, '2024-03-13', 4384.42, 24, '/img/instrument/3.jpg'),
(4, 10, 4, 9, 66050, '2023-08-13', 2929.75, 181, '/img/instrument/4.jpg'),
(5, 5, 4, 3, 39222, '2025-06-12', 4700.65, 212, '/img/instrument/5.jpg'),
(6, 1, 1, 1, 37537, '2024-12-03', 3675.1, 186, '/img/instrument/6.jpg'),
(7, 5, 3, 1, 10733, '2022-04-16', 2282.49, 117, '/img/instrument/7.jpg'),
(8, 5, 6, 7, 60234, '2024-07-28', 974.18, 197, '/img/instrument/8.jpg'),
(9, 7, 7, 10, 66889, '2022-01-19', 5859.21, 50, '/img/instrument/9.jpg'),
(10, 8, 7, 9, 86116, '2023-07-20', 1356.63, 145, '/img/instrument/10.jpg'),
(11, 5, 4, 7, 71637, '2022-11-24', 956.61, 198, '/img/instrument/11.jpg'),
(12, 7, 8, 10, 87550, '2021-04-15', 5837.83, 171, '/img/instrument/12.jpg'),
(13, 8, 7, 6, 18735, '2022-12-19', 2227.62, 264, '/img/instrument/13.jpg'),
(14, 7, 3, 10, 36507, '2022-05-08', 3573.56, 170, '/img/instrument/14.jpg'),
(15, 6, 1, 10, 80550, '2022-02-18', 4824.35, 30, '/img/instrument/15.jpg'),
(16, 8, 3, 9, 92048, '2023-01-30', 820.51, 88, '/img/instrument/16.jpg'),
(17, 1, 1, 6, 69346, '2023-02-10', 1466.6, 195, '/img/instrument/17.jpg'),
(18, 3, 3, 1, 66026, '2021-06-01', 1121.71, 251, '/img/instrument/18.jpg'),
(19, 7, 7, 8, 94506, '2022-05-01', 4030.53, 267, '/img/instrument/19.jpg'),
(20, 1, 1, 1, 59797, '2024-04-21', 5056.02, 189, '/img/instrument/20.jpg'),
(21, 7, 7, 10, 44285, '2023-02-26', 363.19, 76, '/img/instrument/21.jpg'),
(22, 3, 8, 1, 21171, '2023-01-23', 828.25, 11, '/img/instrument/22.jpg'),
(23, 6, 6, 10, 41139, '2023-01-27', 1510.6, 45, '/img/instrument/23.jpg'),
(24, 6, 7, 10, 46796, '2023-12-12', 287.1, 212, '/img/instrument/24.jpg'),
(25, 1, 6, 5, 57798, '2021-09-11', 2978.27, 90, '/img/instrument/25.jpg'),
(26, 3, 5, 4, 32831, '2022-01-22', 520.94, 154, '/img/instrument/26.jpg'),
(27, 6, 8, 3, 59879, '2021-09-28', 1818.67, 248, '/img/instrument/27.jpg'),
(28, 4, 4, 9, 81000, '2023-05-18', 5090.85, 101, '/img/instrument/28.jpg'),
(29, 8, 8, 9, 14966, '2021-04-17', 1817.73, 253, '/img/instrument/29.jpg'),
(30, 4, 5, 2, 35480, '2023-01-17', 5372.53, 127, '/img/instrument/30.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `intervention`
--

DROP TABLE IF EXISTS `intervention`;
CREATE TABLE IF NOT EXISTS `intervention` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `professionnel_id` int(11) DEFAULT NULL,
  `instrument_id` int(11) DEFAULT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `descriptif` varchar(255) NOT NULL,
  `prix` double NOT NULL,
  `quotient` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D11814AB8A49CC82` (`professionnel_id`),
  KEY `IDX_D11814ABCF11D9C` (`instrument_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `intervention`
--

INSERT INTO `intervention` (`id`, `professionnel_id`, `instrument_id`, `date_debut`, `date_fin`, `descriptif`, `prix`, `quotient`) VALUES
(1, 1, 1, '2025-03-01', '2025-03-03', 'Reglage et vernis', 120, 1),
(2, 2, 2, '2025-03-05', '2025-03-05', 'Accord piano droit', 90, 1),
(3, 3, 3, '2025-03-10', '2025-03-11', 'Remplacement embouchure cuivre', 140, 1),
(4, 4, 4, '2025-03-15', '2025-03-16', 'Reparation circuit electronique', 180, 1),
(5, 5, 5, '2025-03-20', '2025-03-21', 'Remplacement peau percussions', 75, 1),
(6, 6, 6, '2025-03-22', '2025-03-23', 'Nettoyage complet', 50, 1),
(7, 7, 7, '2025-03-25', '2025-03-25', 'Controle general', 60, 1),
(8, 3, 8, '2025-03-28', '2025-03-28', 'Reglage piston', 70, 1),
(9, 2, 9, '2025-03-30', '2025-03-31', 'Accord piano a queue', 150, 1),
(10, 1, 10, '2025-04-01', '2025-04-02', 'Reglage chevalet et cordes', 130, 1),
(11, 11, 11, '2025-06-20', '2025-06-20', 'Diagnostic electronique', 110, 1),
(12, 12, 12, '2025-07-02', '2025-07-02', 'Reglage mecanique et verification', 65, 1),
(13, 13, 13, '2025-07-12', '2025-07-13', 'Reparation jack et soudure', 55, 1),
(14, 14, 14, '2025-07-20', '2025-07-21', 'Revision generale', 140, 1),
(15, 15, 15, '2025-08-01', '2025-08-02', 'Remplacement pieces et reglage', 180, 1),
(16, 16, 16, '2025-08-10', '2025-08-10', 'Accord et test intensif', 95, 1),
(17, 17, 17, '2025-08-22', '2025-08-22', 'Nettoyage complet et reglage', 70, 1),
(18, 18, 18, '2025-09-01', '2025-09-03', 'Reglage silencieux et nettoyage', 130, 1),
(19, 19, 19, '2025-09-10', '2025-09-12', 'Controle structurel', 200, 1),
(20, 20, 20, '2025-09-20', '2025-09-20', 'Petite reparation et verification', 50, 1),
(21, 21, 21, '2025-10-01', '2025-10-02', 'Revision electronique', 150, 1),
(22, 22, 22, '2025-10-05', '2025-10-05', 'Ajustement mecanique', 60, 1),
(23, 23, 23, '2025-10-10', '2025-10-12', 'Restoration partielle', 260, 1),
(24, 24, 24, '2025-10-15', '2025-10-16', 'Revision et accordage', 85, 1),
(25, 25, 25, '2025-10-20', '2025-10-20', 'Remplacement accessoires', 45, 1),
(26, 26, 26, '2025-10-25', '2025-10-26', 'Reglage fin et test', 95, 1),
(27, 27, 27, '2025-11-01', '2025-11-02', 'Diagnostic complet', 160, 1),
(28, 28, 28, '2025-11-05', '2025-11-05', 'Nettoyage et ajustements', 55, 1),
(29, 29, 29, '2025-11-10', '2025-11-12', 'Reparation majeure', 320, 1),
(30, 30, 30, '2025-11-20', '2025-11-21', 'Controle qualite et accordage', 105, 1);

-- --------------------------------------------------------

--
-- Structure de la table `jour`
--

DROP TABLE IF EXISTS `jour`;
CREATE TABLE IF NOT EXISTS `jour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `jour`
--

INSERT INTO `jour` (`id`, `libelle`) VALUES
(1, 'Lundi'),
(2, 'Mardi'),
(3, 'Mercredi'),
(4, 'Jeudi'),
(5, 'Vendredi'),
(6, 'Samedi'),
(7, 'Dimanche');

-- --------------------------------------------------------

--
-- Structure de la table `marque`
--

DROP TABLE IF EXISTS `marque`;
CREATE TABLE IF NOT EXISTS `marque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `marque`
--

INSERT INTO `marque` (`id`, `libelle`) VALUES
(1, 'Yamaha'),
(2, 'Fender'),
(3, 'Roland'),
(4, 'Gibson'),
(5, 'Kawai'),
(6, 'Steinway'),
(7, 'Pearl'),
(8, 'Selmer'),
(9, 'Bach'),
(10, 'Buffet Crampon'),
(11, 'Salvi');

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `metier`
--

DROP TABLE IF EXISTS `metier`;
CREATE TABLE IF NOT EXISTS `metier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `metier`
--

INSERT INTO `metier` (`id`, `libelle`) VALUES
(1, 'Luthier Bois'),
(2, 'Luthier Cuivre'),
(3, 'Accordeur Piano'),
(4, 'Reparateur Electronique'),
(5, 'Reparateur Vent'),
(6, 'Reparateur Percussions'),
(7, 'Technicien General'),
(8, 'Technicien son');

-- --------------------------------------------------------

--
-- Structure de la table `metier_professionnel`
--

DROP TABLE IF EXISTS `metier_professionnel`;
CREATE TABLE IF NOT EXISTS `metier_professionnel` (
  `metier_id` int(11) NOT NULL,
  `professionnel_id` int(11) NOT NULL,
  PRIMARY KEY (`metier_id`,`professionnel_id`),
  KEY `IDX_FA14296CED16FA20` (`metier_id`),
  KEY `IDX_FA14296C8A49CC82` (`professionnel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `metier_professionnel`
--

INSERT INTO `metier_professionnel` (`metier_id`, `professionnel_id`) VALUES
(1, 1),
(1, 5),
(1, 13),
(1, 21),
(1, 29),
(2, 2),
(2, 6),
(2, 14),
(2, 22),
(2, 30),
(3, 3),
(3, 7),
(3, 15),
(3, 23),
(4, 4),
(4, 8),
(4, 16),
(4, 24),
(5, 9),
(5, 17),
(5, 25),
(6, 10),
(6, 18),
(6, 26),
(7, 11),
(7, 19),
(7, 27),
(8, 12),
(8, 20),
(8, 28);

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

DROP TABLE IF EXISTS `paiement`;
CREATE TABLE IF NOT EXISTS `paiement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inscriptions_id` int(11) DEFAULT NULL,
  `montant` double NOT NULL,
  `date_paiement` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B1DC7A1E8E2AD382` (`inscriptions_id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `paiement`
--

INSERT INTO `paiement` (`id`, `inscriptions_id`, `montant`, `date_paiement`) VALUES
(1, NULL, 241.63, '2025-05-09'),
(2, NULL, 102.04, '2025-08-02'),
(3, NULL, 198.45, '2025-08-25'),
(4, NULL, 265.02, '2025-06-18'),
(5, NULL, 239.83, '2025-07-04'),
(6, NULL, 383.36, '2025-10-05'),
(7, NULL, 269.55, '2025-06-26'),
(8, NULL, 284.35, '2025-09-30'),
(9, NULL, 187.61, '2025-09-13'),
(13, NULL, 379.31, '2025-04-23'),
(14, NULL, 285.19, '2025-10-14'),
(15, NULL, 199.43, '2025-09-02'),
(16, NULL, 367.23, '2025-06-01'),
(17, NULL, 124.96, '2025-08-13'),
(18, NULL, 213.87, '2025-05-08'),
(19, NULL, 337.59, '2025-05-26'),
(20, NULL, 106.24, '2025-09-04'),
(21, NULL, 354.37, '2025-05-08'),
(22, NULL, 384.23, '2025-10-12'),
(23, NULL, 224.07, '2025-10-04'),
(24, NULL, 152.86, '2025-06-09'),
(25, NULL, 186.43, '2025-04-21'),
(26, NULL, 397.15, '2025-08-08'),
(27, NULL, 78.22, '2025-07-21'),
(28, NULL, 276.84, '2025-06-04'),
(29, NULL, 253.43, '2025-08-29'),
(30, NULL, 59.95, '2025-05-07'),
(31, NULL, 241.63, '2025-05-09'),
(32, NULL, 102.04, '2025-08-02'),
(33, NULL, 198.45, '2025-08-25'),
(34, NULL, 265.02, '2025-06-18'),
(35, NULL, 239.83, '2025-07-04'),
(36, NULL, 383.36, '2025-10-05'),
(37, NULL, 269.55, '2025-06-26'),
(38, NULL, 284.35, '2025-09-30'),
(39, NULL, 187.61, '2025-09-13'),
(43, NULL, 379.31, '2025-04-23'),
(44, NULL, 285.19, '2025-10-14'),
(45, NULL, 199.43, '2025-09-02'),
(46, NULL, 367.23, '2025-06-01'),
(47, NULL, 124.96, '2025-08-13'),
(48, NULL, 213.87, '2025-05-08'),
(49, NULL, 337.59, '2025-05-26'),
(50, NULL, 106.24, '2025-09-04'),
(51, NULL, 354.37, '2025-05-08'),
(52, NULL, 384.23, '2025-10-12'),
(53, NULL, 224.07, '2025-10-04'),
(54, NULL, 152.86, '2025-06-09'),
(55, NULL, 186.43, '2025-04-21'),
(56, NULL, 397.15, '2025-08-08'),
(57, NULL, 78.22, '2025-07-21'),
(58, NULL, 276.84, '2025-06-04'),
(59, NULL, 253.43, '2025-08-29'),
(60, NULL, 59.95, '2025-05-07'),
(63, NULL, 379.31, '2025-04-23'),
(64, NULL, 285.19, '2025-10-14'),
(65, NULL, 199.43, '2025-09-02'),
(66, NULL, 367.23, '2025-06-01'),
(67, NULL, 124.96, '2025-08-13'),
(68, NULL, 213.87, '2025-05-08'),
(69, NULL, 337.59, '2025-05-26'),
(70, NULL, 106.24, '2025-09-04'),
(71, NULL, 354.37, '2025-05-08'),
(72, NULL, 384.23, '2025-10-12'),
(73, NULL, 224.07, '2025-10-04'),
(74, NULL, 152.86, '2025-06-09'),
(75, NULL, 186.43, '2025-04-21'),
(76, NULL, 397.15, '2025-08-08'),
(77, NULL, 78.22, '2025-07-21'),
(78, NULL, 276.84, '2025-06-04'),
(79, NULL, 253.43, '2025-08-29'),
(80, NULL, 59.95, '2025-05-07'),
(82, NULL, 379.31, '2025-04-23'),
(83, NULL, 285.19, '2025-10-14'),
(84, NULL, 199.43, '2025-09-02'),
(85, NULL, 367.23, '2025-06-01'),
(86, NULL, 124.96, '2025-08-13'),
(87, NULL, 213.87, '2025-05-08'),
(88, NULL, 337.59, '2025-05-26'),
(89, NULL, 106.24, '2025-09-04'),
(90, NULL, 354.37, '2025-05-08'),
(91, NULL, 384.23, '2025-10-12'),
(92, NULL, 224.07, '2025-10-04'),
(93, NULL, 152.86, '2025-06-09'),
(94, NULL, 186.43, '2025-04-21'),
(95, NULL, 397.15, '2025-08-08'),
(96, NULL, 78.22, '2025-07-21'),
(97, NULL, 276.84, '2025-06-04'),
(98, NULL, 253.43, '2025-08-29'),
(99, NULL, 59.95, '2025-05-07'),
(100, NULL, 379.31, '2025-04-23'),
(101, NULL, 285.19, '2025-10-14'),
(102, NULL, 199.43, '2025-09-02'),
(103, NULL, 367.23, '2025-06-01'),
(104, NULL, 124.96, '2025-08-13'),
(105, NULL, 213.87, '2025-05-08'),
(106, NULL, 337.59, '2025-05-26'),
(107, NULL, 106.24, '2025-09-04'),
(108, NULL, 354.37, '2025-05-08'),
(109, NULL, 384.23, '2025-10-12'),
(110, NULL, 224.07, '2025-10-04'),
(111, NULL, 152.86, '2025-06-09'),
(112, NULL, 186.43, '2025-04-21'),
(113, NULL, 397.15, '2025-08-08'),
(114, NULL, 78.22, '2025-07-21'),
(115, NULL, 276.84, '2025-06-04'),
(116, NULL, 253.43, '2025-08-29'),
(117, NULL, 59.95, '2025-05-07');

-- --------------------------------------------------------

--
-- Structure de la table `professeur`
--

DROP TABLE IF EXISTS `professeur`;
CREATE TABLE IF NOT EXISTS `professeur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `num_rue` int(11) NOT NULL,
  `rue` varchar(255) NOT NULL,
  `copos` int(11) NOT NULL,
  `ville` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `mail` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_17A55299D60322AC` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `professeur`
--

INSERT INTO `professeur` (`id`, `nom`, `prenom`, `num_rue`, `rue`, `copos`, `ville`, `tel`, `role_id`, `mail`) VALUES
(1, 'Lefèvre', 'Antoinette', 71, 'avenue de Gallet', 23041, 'Saint Noémi-les-Bains', '0644920074', NULL, 'lefevre@gmail.com'),
(2, 'Prévost', 'Martine', 287, 'boulevard Ramos', 35408, 'Sainte Gilbert', '0650506589', NULL, 'prevost@gmail.com'),
(3, 'Pires', 'Françoise', 145, 'boulevard de Gillet', 57341, 'Buisson', '0615346354', NULL, 'pires@gmail.com'),
(4, 'Moulin', 'Jean', 114, 'rue de Renault', 33619, 'Duval', '0674464670', NULL, 'moulin@gmail.com'),
(5, 'Maillard', 'Philippine', 155, 'chemin Leblanc', 31603, 'Bousquet-sur-Caron', '0614606474', NULL, 'maillard@gmail.com'),
(6, 'Renault', 'Aurore', 274, 'rue Hoareau', 63472, 'Saint Alice-la-Forêt', '0623436012', NULL, 'aurore@gmail.com');


-- --------------------------------------------------------

--
-- Structure de la table `professeur_type_instrument`
--

DROP TABLE IF EXISTS `professeur_type_instrument`;
CREATE TABLE IF NOT EXISTS `professeur_type_instrument` (
  `professeur_id` int(11) NOT NULL,
  `type_instrument_id` int(11) NOT NULL,
  PRIMARY KEY (`professeur_id`,`type_instrument_id`),
  KEY `IDX_1E1989D6BAB22EE9` (`professeur_id`),
  KEY `IDX_1E1989D67C1CAAA9` (`type_instrument_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `professionnel`
--

DROP TABLE IF EXISTS `professionnel`;
CREATE TABLE IF NOT EXISTS `professionnel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `num_rue` int(11) NOT NULL,
  `rue` varchar(255) NOT NULL,
  `copos` int(11) NOT NULL,
  `ville` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `professionnel`
--

INSERT INTO `professionnel` (`id`, `nom`, `num_rue`, `rue`, `copos`, `ville`, `tel`, `mail`) VALUES
(1, 'Atelier Musique Nord', 12, 'Rue Beethoven', 75001, 'Paris', '0601020304', 'contact@ateliermusiquenord.fr'),
(2, 'Accords Services', 5, 'Rue Mozart', 75002, 'Paris', '0605060708', 'info@accords-services.fr'),
(3, 'Bois et Cuivre', 18, 'Avenue Debussy', 75003, 'Paris', '0611223344', 'contact@boisetcuivre.fr'),
(4, 'Repare Sound', 22, 'Rue Chopin', 75004, 'Paris', '0622334455', 'service@reparesound.com'),
(5, 'Percu Fix', 14, 'Rue Liszt', 75005, 'Paris', '0633445566', 'atelier@percufix.fr'),
(6, 'Techno Music', 30, 'Boulevard Bach', 75006, 'Paris', '0644556677', 'support@technomusic.fr'),
(7, 'Orchestre Services', 8, 'Rue Schubert', 75007, 'Paris', '0655667788', 'contact@orchestreservices.fr'),
(8, 'Hoareau', 233, 'chemin Tanguy', 13234, 'Menard', '0698091167', 'hoareau.menard@outlook.fr'),
(9, 'Roy', 101, 'boulevard Hoarau', 36897, 'Duval', '0633300345', 'roy.duval@gmail.com'),
(10, 'Marty', 163, 'avenue Michèle Léger', 53309, 'Pelletier-sur-Besnard', '0675009346', 'marty.pelletier@wanadoo.fr');


-- --------------------------------------------------------

--
-- Structure de la table `responsables`
--

DROP TABLE IF EXISTS `responsables`;
CREATE TABLE IF NOT EXISTS `responsables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tranche_id` int(11) DEFAULT NULL,
  `nom` varchar(80) NOT NULL,
  `prenom` varchar(80) NOT NULL,
  `adresse` varchar(120) NOT NULL,
  `ville` varchar(80) NOT NULL,
  `code_postal` int(11) NOT NULL,
  `email` varchar(80) NOT NULL,
  `quotient_famillial` int(11) NOT NULL,
  `tel1` int(11) NOT NULL,
  `tel2` int(11) NOT NULL,
  `tel3` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_853808A5B76F6B31` (`tranche_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `responsables`
--

INSERT INTO `responsables` (`id`, `tranche_id`, `nom`, `prenom`, `adresse`, `ville`, `code_postal`, `email`, `quotient_famillial`, `tel1`, `tel2`, `tel3`) VALUES
(1, 24, 'Dufour', 'Camille', '71, boulevard Benoît Lenoir', 'Robin-sur-Mer', 93088, 'camille.dufour@neuf.fr', 2572, 672956671, 602086975, 613660243),
(2, 20, 'Normand', 'Suzanne', '61, rue William Jacquot', 'Munoznec', 80017, 'suzanne.normand@posteo.net', 506, 654831212, 605048945, 686546622),
(3, 2, 'Gomes', 'Benoît', 'rue de Camus', 'Charlesboeuf', 69651, 'benoit.gomes@orange.fr', 2698, 683653855, 664009903, 672566345),
(4, 3, 'Blondel', 'Nicolas', '97, rue Nicolas', 'Blin', 80482, 'nicolas.blondel@free.fr', 1345, 635894481, 619961877, 633605581),
(5, 12, 'Renaud', 'Julien', '6, chemin de Boulay', 'Teixeira-sur-Rolland', 88609, 'julien.renaud@laposte.net', 1916, 608443859, 694524084, 654270546),
(6, 30, 'Techer', 'Maurice', '27, rue Susan Benoit', 'Laroche', 79053, 'maurice.techer@wanadoo.fr', 1217, 635285526, 629649724, 674687430),
(7, 24, 'Lopes', 'Élise', '5, rue Claire Gros', 'Sauvage-les-Bains', 62614, 'elise.lopes@gmail.com', 1033, 617680842, 684090450, 621700313),
(8, 12, 'Aubert', 'Antoine', '85, boulevard de Gosselin', 'Roger-sur-Da Costa', 62199, 'antoine.aubert@outlook.fr', 2401, 651431540, 661185611, 687631955),
(9, 13, 'Lejeune', 'Suzanne', '95, rue Dias', 'Sainte Jacques', 73507, 'suzanne.lejeune@icloud.com', 2997, 657456399, 639707899, 686638876),
(10, 16, 'Leroy', 'Michelle', '80, chemin de Germain', 'TraoreVille', 18328, 'michelle.leroy@sfr.fr', 1234, 694314243, 629869957, 635677993),
(11, 16, 'Rodriguez', 'Dominique', '4, rue Andre', 'Poulain-sur-Costa', 16051, 'dominique.rodriguez@bbox.fr', 2272, 659025170, 606394776, 697089166),
(12, 25, 'Guyon', 'Andrée', '135, rue Rousset', 'Rivière-sur-Da Costa', 20746, 'andree.guyon@free.fr', 1495, 694400854, 650841882, 693961988),
(13, 27, 'Boyer', 'Camille', '301, rue Vaillant', 'Gaillard', 78656, 'camille.boyer@hotmail.fr', 1971, 687470398, 646487072, 698879424),
(14, 17, 'Mallet', 'Léon', '3, boulevard Dupuy', 'Gros', 61142, 'leon.mallet@protonmail.com', 743, 664173379, 612829155, 688620056),
(15, 6, 'Rémy', 'Andrée', '783, chemin de Roche', 'Leroy', 34656, 'andree.remy@wanadoo.fr', 1762, 603692334, 602042792, 648072178),
(16, 20, 'Collin', 'Aimé', 'boulevard Dupuy', 'Sainte Nicolas', 63176, 'aime.collin@laposte.net', 2320, 679871773, 603024170, 682739135),
(17, 4, 'David', 'Benoît', 'avenue Rousseau', 'Saint Dominique', 44752, 'benoit.david@orange.fr', 573, 653784832, 621819994, 656919647),
(18, 23, 'Mahe', 'Timothée', '446, chemin Morvan', 'Gonzalez', 80211, 'timothee.mahe@neuf.fr', 2626, 670495599, 625469535, 658601227),
(19, 2, 'Brun', 'André', '75, avenue de Tanguy', 'Sainte BenoîtVille', 52147, 'andre.brun@sfr.fr', 2408, 622384932, 621934903, 602252304),
(20, 4, 'Dumas', 'Étienne', '67, avenue Jacqueline Chauvin', 'Guyon-sur-Mer', 57635, 'etienne.dumas@laposte.net', 1459, 690157258, 603103432, 661738278),
(21, 7, 'Gaudin', 'Hugues', '48, rue Margaux Laine', 'Saint Camille', 76378, 'hugues.gaudin@gmail.com', 2746, 608333144, 689185928, 632858499),
(22, 1, 'Mathieu', 'Yves', '368, rue Anastasie Guyot', 'Lebreton', 58883, 'yves.mathieu@wanadoo.fr', 2344, 658799828, 629462246, 642607974),
(23, 3, 'Clerc', 'Catherine', '63, chemin Lenoir', 'Chauveau-la-Forêt', 42517, 'catherine.clerc@orange.fr', 2629, 626870323, 655912088, 691731505),
(24, 4, 'Carlier', 'Anastasie', '48, avenue Faure', 'David', 79344, 'anastasie.carlier@outlook.fr', 2735, 680603596, 686777339, 602487966),
(25, 28, 'Legrand', 'Brigitte', '47, avenue Adèle Laine', 'Sainte Patricia', 62710, 'brigitte.legrand@laposte.net', 962, 612050548, 655743841, 672164387),
(26, 17, 'Collin', 'Luc', '3, avenue de Guyon', 'Saint MatthieuBourg', 89074, 'luc.collin@free.fr', 2849, 620669229, 671833925, 615117658),
(27, 19, 'Roux', 'Alexandrie', 'rue Dos Santos', 'Da Costa-sur-Pages', 80093, 'alexandrie.roux@neuf.fr', 2348, 615884543, 610352062, 649881522),
(28, 11, 'Camus', 'Aimé', '77, avenue Rémy Benard', 'Perrot-sur-Delattre', 27873, 'aime.camus@orange.fr', 1530, 670286626, 603236135, 651605680),
(29, 16, 'Bourdon', 'Édith', '41, chemin Lebreton', 'Vallée', 43407, 'edith.bourdon@sfr.fr', 1051, 648028763, 644204485, 657094706),
(30, 4, 'Gautier', 'Nicole', '24, boulevard Leconte', 'Nguyen', 27045, 'nicole.gautier@protonmail.com', 670, 645973487, 682908362, 626984074);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_57698A6A77153098` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `code`) VALUES
(2, 'ROLE_ADHERENT'),
(1, 'ROLE_ADMIN'),
(3, 'ROLE_GESTION');

-- --------------------------------------------------------

--
-- Structure de la table `tranche`
--

DROP TABLE IF EXISTS `tranche`;
CREATE TABLE IF NOT EXISTS `tranche` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) NOT NULL,
  `quotient_mini` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `tranche`
--

INSERT INTO `tranche` (`id`, `libelle`, `quotient_mini`) VALUES
(1, 'Tranche 1', 1691),
(2, 'Tranche 2', 590),
(3, 'Tranche 3', 963),
(4, 'Tranche 4', 989),
(5, 'Tranche 5', 1522),
(6, 'Tranche 6', 569),
(7, 'Tranche 7', 1247),
(8, 'Tranche 8', 895),
(9, 'Tranche 9', 176),
(10, 'Tranche 10', 1352),
(11, 'Tranche 11', 1809),
(12, 'Tranche 12', 1540),
(13, 'Tranche 13', 1957),
(14, 'Tranche 14', 366),
(15, 'Tranche 15', 1278),
(16, 'Tranche 16', 1710),
(17, 'Tranche 17', 172),
(18, 'Tranche 18', 360),
(19, 'Tranche 19', 702),
(20, 'Tranche 20', 417),
(21, 'Tranche 21', 392),
(22, 'Tranche 22', 1124),
(23, 'Tranche 23', 965),
(24, 'Tranche 24', 1657),
(25, 'Tranche 25', 1092),
(26, 'Tranche 26', 819),
(27, 'Tranche 27', 537),
(28, 'Tranche 28', 1628),
(29, 'Tranche 29', 1676),
(30, 'Tranche 30', 493);

-- --------------------------------------------------------

--
-- Structure de la table `tranche_type`
--

DROP TABLE IF EXISTS `tranche_type`;
CREATE TABLE IF NOT EXISTS `tranche_type` (
  `tranche_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`tranche_id`,`type_id`),
  KEY `IDX_F98E49B2B76F6B31` (`tranche_id`),
  KEY `IDX_F98E49B2C54C8C93` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `tranche_type`
--

INSERT INTO `tranche_type` (`tranche_id`, `type_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 1),
(5, 4),
(6, 2),
(7, 5),
(8, 6),
(9, 7),
(10, 1),
(11, 2),
(12, 3),
(13, 4),
(14, 5),
(15, 6),
(16, 7),
(17, 8),
(18, 9),
(19, 10),
(20, 1),
(21, 2),
(22, 3),
(23, 4),
(24, 5),
(25, 6),
(26, 7),
(27, 8),
(28, 9),
(29, 10),
(30, 1);

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE IF NOT EXISTS `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `type`
--

INSERT INTO `type` (`id`, `nom`) VALUES
(1, 'Individuel'),
(2, 'Collectif'),
(3, 'Atelier'),
(4, 'Saison Enfants'),
(5, 'Saison Adultes'),
(6, 'Stage Intensif'),
(7, 'Cours Hebdomadaire'),
(8, 'Cours Mensuel'),
(9, 'Masterclass'),
(10, 'Enseignement Amateur');

-- --------------------------------------------------------

--
-- Structure de la table `type_instrument`
--

DROP TABLE IF EXISTS `type_instrument`;
CREATE TABLE IF NOT EXISTS `type_instrument` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_instru_id` int(11) DEFAULT NULL,
  `libelle` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_21BCBFF8B3B774A5` (`class_instru_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `type_instrument`
--

INSERT INTO `type_instrument` (`id`, `class_instru_id`, `libelle`) VALUES
(1, 5, 'Piano'),
(2, 1, 'Guitare'),
(3, 1, 'Violon'),
(4, 3, 'Flûte'),
(5, 4, 'Batterie'),
(6, 3, 'Clarinette'),
(7, 3, 'Saxophone'),
(8, 8, 'Trompette'),
(9, 1, 'Harpe'),
(10, 1, 'Contrebasse');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`),
  KEY `IDX_8D93D649D60322AC` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=333 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `role_id`, `nom`, `prenom`) VALUES
(7, 'admin@gmail.com', '$2y$13$FjlfLzntJqeuCpSVeamQpeGsuZEcbILPbxrCROVXqPLbWl5no96n.', 1, 'admin', 'admin\r\n'),
(8, 'gestionnaire@gmail.com', '$2y$13$w41Kypcc/QduXJbaYrEWF.WhMvK/QnXZ/0m9frmm0rZzw59QjBLy6', 3, 'gestionnaire', 'gestionnaire'),
(9, 'adherent@gmail.com', '$2y$13$Mq2tWPWeU4sLSDfPmAkGguTuxvUg2p3ai0jV9.OrfEYJGDUQW0Wgq', 2, 'adherent', 'adherent'),
(44, 'adam@gmail.com', '$2y$13$yYCF9X/To1rsyLuMTb90ZeDuM7x0R9UWZYHUKJypYRbzFbIcqKspi', 2, 'Adam', 'Emmanuelle'),
(45, 'albert@gmail.com', '$2y$13$AR0hQo4WVktWYMcDokOjN.DJqT9qWbQcGY4rtsAjrC6KZmXc6fvXW', 2, 'Albert', 'Antoine'),
(46, 'allain@gmail.com', '$2y$13$KlAyZaKoDyWZDleHEAqjkuZ/WIphzOp1C3D41AsQemOfQ8l2Q0gA2', 2, 'Allain', 'Corinne'),
(47, 'alves@gmail.com', '$2y$13$KLJlJNej0foeueLsT8aEUuj4cFSaJDY9KEmljaUu/cMb0LASPMZzG', 2, 'Alves', 'Édith'),
(48, 'arnaud@gmail.com', '$2y$13$GW9qka8s..KAM40WJqUF2ONrUvASCsHAteKIqeE4hEQT2u404BflS', 2, 'Arnaud', 'Xavier'),
(49, 'aubry@gmail.com', '$2y$13$4VhE6xjSIt.KfSLW13ATvOQw7JvVzr.phnOvtXyV/WtF3ZLqCDtWG', 2, 'Aubry', 'Eugène'),
(50, 'auger@gmail.com', '$2y$13$XM2bHha/7eSdId2ui6R0ieiuSKHj/FRhoMPLt/0gHatfTuKu8cUfa', 2, 'Auger', 'Margaret'),
(51, 'bailly@gmail.com', '$2y$13$wdcGv7cAqLLfhcJIxEPcn.eHH2y9oKD8l5VZ6qy5y/7LaoniBuUdK', 2, 'Bailly', 'Timothée'),
(52, 'baron@gmail.com', '$2y$13$fswWlXgf7kKgNrH/qQUQfueAsM5UXeOquw8HVOo7kdMm0Szafh8Ka', 2, 'Baron', 'Zoé'),
(53, 'barthelemy@gmail.com', '$2y$13$b5S7vxtQNmf9IqzAsIu5ceBjHIK5FeAu2i5bgtC0gHcsFXYG0dKyO', 2, 'Barthelemy', 'Alain'),
(54, 'bazin@gmail.com', '$2y$13$JnRacN560DDfqGcvzY.4sORIKGUgRHcXPmo/0kO7YYA4r/1gUYbY.', 2, 'Bazin', 'Martin'),
(55, 'becker@gmail.com', '$2y$13$uWbj9zbHQRksHpKx398mE.wrSvSk8uAQwPaQSwk4T0CEa50.jaqSC', 2, 'Becker', 'Margaud'),
(56, 'benard@gmail.com', '$2y$13$QqsvDEH9WN9LmAStAWVC9OfRbeSZkgfmw3lbC/C6b0JtnLtgdTwXm', 2, 'Benard', 'Diane'),
(57, 'berger@gmail.com', '$2y$13$ENd7NMAZaPLoFU91dvAE4ulFZqvl4zVMOKCIKVNH7xku.RDz8Msnm', 2, 'Berger', 'Luce'),
(58, 'bernard@gmail.com', '$2y$13$6TAipTQv0J2CczUJzBXNge/87DqB0SXOEUc5KnoDRdlClC8CPi7wW', 2, 'Bernard', 'Françoise'),
(59, 'besnard@gmail.com', '$2y$13$STzMNp1hLD4tVowH61E10uEAa62uSvWDRVN0uEyEKfGcOKsjJswU.', 2, 'Besnard', 'Gabrielle'),
(60, 'besson@gmail.com', '$2y$13$TD6uLWiW5jhMUdQasqvifeTech5iYlL5C0NprPScMkplMsjr//xnC', 2, 'Besson', 'Josette'),
(61, 'bigot@gmail.com', '$2y$13$HozlHkEeCa1hMmp815HpC.em2SsxdYZB3/KA7AviWYfR40WsmoWeS', 2, 'Bigot', 'Brigitte'),
(62, 'blanchet@gmail.com', '$2y$13$fQ8XeFWRZhLRI2eFAJcK6e.CUI67tVgvMnCYAG71W3y5WnGTLvjjO', 2, 'Blanchet', 'Jean'),
(63, 'blin@gmail.com', '$2y$13$24doHAQM9A7DT39Ub/f4du4VzX.VSBOdZObHn5b/l9touKSGopRSm', 2, 'Blin', 'Alexandria'),
(64, 'blondel@gmail.com', '$2y$13$g2X7oO2K42rMR8RtVjcud.lvlNYrKKcTmEV9q0VlT71wIVS4pgqgm', 2, 'Blondel', 'Christiane'),
(65, 'blot@gmail.com', '$2y$13$a.5izQr4Zfg142v1I7hMBOLch4rt/5ByW5hkaxFoq1OPll/V0aZce', 2, 'Blot', 'Audrey'),
(66, 'bodin@gmail.com', '$2y$13$6zU191Wv3fZ0SizPFY6EJuUc.DX5dbesgIZR0876AYd2YHJK2IZqy', 2, 'Bodin', 'Cécile'),
(67, 'bonnet@gmail.com', '$2y$13$WhXclWXXqnC/RM0CnfE56uf6jeUCQyxKU.MaaZXyDuvpQ/7DmhuUu', 2, 'Bonnet', 'Claude'),
(68, 'boucher@gmail.com', '$2y$13$06.kBfUyBZeoTyBkQj66TO7X3qmvuUW90baSvqfg8FN9cddrvhZLK', 2, 'Boucher', 'Agathe'),
(69, 'boulanger@gmail.com', '$2y$13$jsEUEcf0PzvqUTiyMA/dSeYP2sQa12rBEqhUKjNsSKp63ETTpNBxS', 2, 'Boulanger', 'Élisabeth'),
(70, 'boulay@gmail.com', '$2y$13$kKloBha1fgUERoFhmnTMNuAk70wHK1mdBf70PB14A7a/mzqxr4DoG', 2, 'Boulay', 'Pierre'),
(71, 'bourdon@gmail.com', '$2y$13$PN2rKUHjYPNXCNG4ni3N2.svqgnFIELWhKtTesZG2P9jWVmwc4u1.', 2, 'Bourdon', 'Maryse'),
(72, 'bousquet@gmail.com', '$2y$13$wGkM6kz3dFv/EkPZGgBaSu/DXRchZLpShaj25Ftoez70pMwRhGncy', 2, 'Bousquet', 'Mathilde'),
(73, 'bouvet@gmail.com', '$2y$13$fLX0BCQ8AMc61NjPKfoRlOfGeaAKfhsbC05AXWUuG.w7SKuKlkOUq', 2, 'Bouvet', 'Richard'),
(74, 'bouvier@gmail.com', '$2y$13$K6cNH.m.QZSr5TMAShmHN.13J3h6436OFMCvWRB8tOJjbOrvk.KbG', 2, 'Bouvier', 'Arthur'),
(75, 'briand@gmail.com', '$2y$13$NF1G/W6VoWg9yDyebuwg6OKlnisTGHIeAIsJw7uIUKDl4iPKPnq4.', 2, 'Briand', 'Antoine'),
(76, 'bruneau@gmail.com', '$2y$13$ALW3Hpa042aeABcircpUP.zGpSCsck4V3CUTQe7ZG1Mu/ifAOqRwu', 2, 'Bruneau', 'Zacharie'),
(77, 'brunel@gmail.com', '$2y$13$cU8prYqGbU8Wyheet2GsY.K4AbreODHiUz4pqgB/SJW1ozRAOT306', 2, 'Brunel', 'Suzanne'),
(78, 'camus@gmail.com', '$2y$13$Wg9mzkxTG2e/xrazfeK34e7FdBYFhGSYwuUGrTe64f5NhfE.umUp.', 2, 'Camus', 'Alexandrie'),
(79, 'carpentier@gmail.com', '$2y$13$H98Pth3lv2rHnlrASQIHZ.spZGAu/YD.zcZvgw7wimZAFpO6rCwxS', 2, 'Carpentier', 'Hélène'),
(80, 'charles@gmail.com', '$2y$13$fkUZULJoAQrHDRMH5FfzeeAlEn8TEPsSX1sc0cfLlQsEZkcaBA0Dq', 2, 'Charles', 'Bertrand'),
(81, 'charpentier@gmail.com', '$2y$13$WEDa4mv57lAH6aoZOMNfQebgOHCVmBEIFroemoM1/aPOIXF/P9hHa', 2, 'Charpentier', 'Roger'),
(82, 'charrier@gmail.com', '$2y$13$tZVtrv4YsO.AbhPjV56euek6U6dB2/2nhQCFnm0T4YSuRGJ0HZjaO', 2, 'Charrier', 'Timothée'),
(83, 'chauveau@gmail.com', '$2y$13$HSl79OeYFvOUIdO/yLQWkOx.DmUP.4Yq/JmLYieuYErxOXPqcSGn6', 2, 'Chauveau', 'Hortense'),
(84, 'chauvet@gmail.com', '$2y$13$ERxSzqLZRFw.JLj2z64ZZ.WinRRVaPm8s4ycYA.i9Oosb7baTDIh2', 2, 'Chauvet', 'Benoît'),
(85, 'chevalier@gmail.com', '$2y$13$co2yXiaiGUUneu7plc9zXuHdJaDTFNMWdNiTg5dNDy.CO1xfdFhL.', 2, 'Chevalier', 'Adrienne'),
(86, 'chevallier@gmail.com', '$2y$13$DRB60bKNgGMtIW/vN3QSwO2RcaJnHn5QgjiWwJxsarw.y6VF1ZaMu', 2, 'Chevallier', 'Marc'),
(87, 'clément@gmail.com', '$2y$13$P/qpZdLQUBroAHkoJMidde9E0uNWJ1NqeCmkEe/.jMauZSXO.rck2', 2, 'Clément', 'Alexandrie'),
(88, 'colin@gmail.com', '$2y$13$eYrLWfuQg.CqLHbcKUHSueBL91Oyo1vR8PxC6nolW/139juMudcBu', 2, 'Colin', 'Yves'),
(89, 'collin@gmail.com', '$2y$13$Le2wUeujFEzyzIeiQwByv.Hh6HHk0s8KiFLtCzM1I6zaPN34k62p6', 2, 'Collin', 'Marianne'),
(90, 'cordier@gmail.com', '$2y$13$97xOIGPcBKuQfCg4zY3GrumizbnspwBFm9/Aeye6pGyIzTSafgnGW', 2, 'Cordier', 'Gabrielle'),
(91, 'coste@gmail.com', '$2y$13$/VyQsS6L/Ck3cylEj4uIf.7MmOiwC38ghQX0hmhYxlpDN5EbGh3Ey', 2, 'Coste', 'Michelle'),
(92, 'courtois@gmail.com', '$2y$13$Wes9IIWPuYYfQIE8dNBHz.p7LFpaLLbIF..u7IlvFSyQmD/N8vKqu', 2, 'Courtois', 'Laurent'),
(93, 'cousin@gmail.com', '$2y$13$r6Bh062puTO5YDvQNPtT/uI3TR1D3VSbW/ePWZv2wRKfTf1mk0iAm', 2, 'Cousin', 'Océane'),
(94, 'couturier@gmail.com', '$2y$13$ibqO3SRlmcH85cAKggCy5.j5Z1RE1p5GFy8fLhGhdHkPe2TdN/lOC', 2, 'Couturier', 'Jérôme'),
(95, 'david@gmail.com', '$2y$13$.bTRf5H9GrtG/lA5LbI/A.cboNObyWdEyozlswD5Ut4OukpcRJ/Ba', 2, 'David', 'Inès'),
(96, 'de oliveira@gmail.com', '$2y$13$Bmb.C5Ap7JmFuf702xZQCusDbYS2hGI3q3BKTQO0uGpE/zB39Sg5u', 2, 'De Oliveira', 'William'),
(97, 'de sousa@gmail.com', '$2y$13$dEHV4OEKL72SywicR0GPbOopqhNAYYhj1WtHA.56BHnEEWklLJwJa', 2, 'De Sousa', 'Matthieu'),
(98, 'delahaye@gmail.com', '$2y$13$fJ/hvoqayShxG6.FYsLABuNfD/kl8A1hSjSrRIqkAXdcZtHb0hgvS', 2, 'Delahaye', 'Guillaume'),
(99, 'delannoy@gmail.com', '$2y$13$wVSUxZaIEz1.mRUMDyVpR.MoSFvm6exLa9VfUFXf9R4HaTix2dO9O', 2, 'Delannoy', 'Isaac'),
(100, 'delattre@gmail.com', '$2y$13$IZs/k4QTwz9AvxGDHR.GL.S.pCpmT3A/CsVSoSQ27.CvaPJ9u9tVW', 2, 'Delattre', 'Julie'),
(101, 'delmas@gmail.com', '$2y$13$g5ZzXA6Olyjrda8WiUK3juY4iIYLfs.crkD.7qpsA0YaKF7bAdy82', 2, 'Delmas', 'Claude'),
(102, 'delorme@gmail.com', '$2y$13$EZqVqXGxdsxGViYAn8kOP.ddH7KfXVyw3Qc9uDy7qKSF2ueJFxn/i', 2, 'Delorme', 'Édith'),
(103, 'denis@gmail.com', '$2y$13$c0ue72aIMMjruvDx.xptdOtJ.25EHFt9J4PNiW6wy8X8vQ8IyH7De', 2, 'Denis', 'Adèle'),
(104, 'descamps@gmail.com', '$2y$13$RHzbhN.OEIs2KiXdAWiTquKEyNFweIy6WUSxhXb4NzuNXA24zcld.', 2, 'Descamps', 'Timothée'),
(105, 'devaux@gmail.com', '$2y$13$drTy1Dm362Lwu34YU08X7.WsESYDJ9ZwtPfLmZ4p9mpZgPSjboo52', 2, 'Devaux', 'Louis'),
(106, 'diallo@gmail.com', '$2y$13$R37pzqF8DIn63sZcFh3KGOUas9ntwqiihYxB9JnNiBx4oB/01HAza', 2, 'Diallo', 'Nathalie'),
(107, 'diaz@gmail.com', '$2y$13$xyF7tR4/xb93JUeocN01Me/ohzyJD4.hQNO/q1G18J4cget/GCEC2', 2, 'Diaz', 'Matthieu'),
(108, 'duhamel@gmail.com', '$2y$13$af5XJcjUqNUfXFfHDe.7quGnWBZ.9gmngJz71Fry6/4D4twUCFaxu', 2, 'Duhamel', 'Diane'),
(109, 'dumont@gmail.com', '$2y$13$IX3Y61RniBunjz9Al023nO7ZTpPLf3uuRlY6NRwDHMcyZUVjn5VBq', 2, 'Dumont', 'Jeannine'),
(110, 'dupuis@gmail.com', '$2y$13$VFhxOeOvGD5HWcV9XQZtpOV1oP3FW3l9fL7bYaLZpUszBNTBVEpuK', 2, 'Dupuis', 'Édouard'),
(111, 'dupuy@gmail.com', '$2y$13$wURXz0VvDU042X5LnHyFo.dqPBDfi0G0LOflQuktvpgggFRpVhcrC', 2, 'Dupuy', 'Aimée'),
(112, 'durant@gmail.com', '$2y$13$6B8XxtlpBqq3rCXjVDjmrOOXzHK4/3YJlYh2U857MDnb6AdVIq8wm', 2, 'Durant', 'Alexandre'),
(113, 'duval@gmail.com', '$2y$13$R7zuNqbqwBnc.LYzUmYkxerlu2RKZD1uupZWwh5bsEI2HfnZ9k9K2', 2, 'Duval', 'Paul'),
(114, 'étienne@gmail.com', '$2y$13$7h0BOP.UGBuk/97uoUfMROsao.oRUpMfZKedyh4y/BZArfdONKU72', 2, 'Étienne', 'Luc'),
(115, 'evrard@gmail.com', '$2y$13$MsHma91ZsD6/2uaOfn9VJOeDpeO13MLwsSr1QjCGLtqxmmNn9ZgsK', 2, 'Evrard', 'René'),
(116, 'fabre@gmail.com', '$2y$13$dLI/gC5vb41e2pQdXDlFdOCs3mpfozQfJEfihgYSKnse7zt1T5ZtS', 2, 'Fabre', 'Georges'),
(117, 'faivre@gmail.com', '$2y$13$O6KEdMqXE9J0fM.eYInP1u1AogxuLpuWL2MxDgA1TiMA/A0X4p/Bu', 2, 'Faivre', 'Amélie'),
(118, 'fernandes@gmail.com', '$2y$13$hvqwDbql43dxEqNjZhMfIuRPFKSBMCftJJQjPVCO4ODaO5qH48uoS', 2, 'Fernandes', 'Aurore'),
(119, 'ferrand@gmail.com', '$2y$13$o.F3AlanvRoSN1Fkmmm8qeBC7h2t0CwQEXAWZYLU8rstL4hT9sLoW', 2, 'Ferrand', 'Émile'),
(120, 'fischer@gmail.com', '$2y$13$RAj.YQS16taba041Cjf2JeMDxaV8zIrI4wYmlQHCQ36MsPyMfXQc2', 2, 'Fischer', 'Tristan'),
(121, 'fontaine@gmail.com', '$2y$13$uYzOC2q0TAJjBOVY639kGOLK24DUfgLriTrgjunEC9.S44UsY7y1e', 2, 'Fontaine', 'Élise'),
(122, 'gaudin@gmail.com', '$2y$13$n9irK1F3nU2uQRiqRPo9Mu0smtVd4T6gAFzKdWepK5zK.jJbLI3qG', 2, 'Gaudin', 'Joséphine'),
(123, 'gauthier@gmail.com', '$2y$13$xvcDuGp1w/skmNvvAQzRduuSgQDqQStMOavv/rRZvOhaHk6D5vxf.', 2, 'Gauthier', 'Roland'),
(124, 'gautier@gmail.com', '$2y$13$lQLAB2rxyL3loxosnQo5XOXIQ9XJgyZvSD0KW6dDmbhKpF9mfpHCG', 2, 'Gautier', 'Thérèse'),
(125, 'georges@gmail.com', '$2y$13$F2gpHvlRdpjU5coFGYVsJuPN3odkayJkaiTSOvNg/bJ5vNF3GnvXm', 2, 'Georges', 'Isabelle'),
(126, 'gilles@gmail.com', '$2y$13$vWnqARv.9Y4KZNgmrscAr.ktUh2npHiEJPbcNPo0vwf6n.CO5ggMm', 2, 'Gilles', 'Xavier'),
(127, 'gimenez@gmail.com', '$2y$13$QLiyQSqPSwQ2z19aqsQePuFqVY3mvGxDp316VOP77Vx306lVocBLy', 2, 'Gimenez', 'Suzanne'),
(128, 'girard@gmail.com', '$2y$13$WgFrviDyv7U7ARB3nQJgveoHJ5r1s7jQvgmvEbJxglNRgNuHIkPxe', 2, 'Girard', 'Michel'),
(129, 'godard@gmail.com', '$2y$13$4vVtKBjMnL0M.8vTrWTkCuCoXm2e0gTqB9lEaMkGM791i.IoqwwF2', 2, 'Godard', 'Aimée'),
(130, 'gomes@gmail.com', '$2y$13$5lZ1SwuXDjI2QNa.RKj9MexFHmOEZcQ0UojyOtQFcZ3gdkg3OuDuG', 2, 'Gomes', 'Louis'),
(131, 'gomez@gmail.com', '$2y$13$YhZG.WwUE.617BVBKAQ9.OcMhlC3JwJXn70DSF.AJuDLRHrHSoIba', 2, 'Gomez', 'Célina'),
(132, 'gosselin@gmail.com', '$2y$13$65Nsjc/8f8wJSMfRtEZuJudpx/Vnin1Be8fCfepBa.NQ.MU4Oq7nO', 2, 'Gosselin', 'Georges'),
(133, 'grondin@gmail.com', '$2y$13$zRe.8.PtJFj0ZoMNnwRbROSWIb7I1OVKKSaLjrbZxkwWZ4XEpUpIm', 2, 'Grondin', 'Julien'),
(134, 'guérin@gmail.com', '$2y$13$N2h5wxTtDx1vezy9w4L4K.on88JTO3y6tRqqsHV2KxBiqUO6MAZOS', 2, 'Guérin', 'Christiane'),
(135, 'guichard@gmail.com', '$2y$13$ExMDkIX4ZCkfLRvMJxv/Kuxtva7osI/zSs/2hjWB3PYLMrCWvskvq', 2, 'Guichard', 'Frédérique'),
(136, 'guilbert@gmail.com', '$2y$13$3hH/jlXXFZ.A95oBzljQVe8RUiNzty.Y8fxzC.9nJe.5LIfYJ/Vs.', 2, 'Guilbert', 'Étienne'),
(137, 'guillaume@gmail.com', '$2y$13$WVq8vEc6trgdkKQaRzCyKuTpvPR6kJ7XY/cJoISw.V5aKzhcjuHMq', 2, 'Guillaume', 'Claudine'),
(138, 'guillou@gmail.com', '$2y$13$NAOc9MFk41rg7janTtjzM.NHY0TyLe3wY5/uZqYyCCWSHxvOdnHje', 2, 'Guillou', 'Daniel'),
(139, 'guyot@gmail.com', '$2y$13$syAsp7YetzbpBJLRJ9RBLubRfD0SiCv8IHpMRWCutrfywji4VInHa', 2, 'Guyot', 'Lucas'),
(140, 'hamel@gmail.com', '$2y$13$gxHqbDVcu2SGbqXMrswtHeCUdSplvWVXB6f3/iGOBYGmxakwAfhHi', 2, 'Hamel', 'Philippine'),
(141, 'hamon@gmail.com', '$2y$13$UHzi.gOOJme94bCwAF9t6OS1RF./UyyKpNs/BcnAUtO.3eKILvcDG', 2, 'Hamon', 'Juliette'),
(142, 'hardy@gmail.com', '$2y$13$ByEuIFoa0eHfMAUEvH8PnefIJv/g4NbYOHJ/92K0lcKgVRXL/gQxy', 2, 'Hardy', 'Jeanne'),
(143, 'henry@gmail.com', '$2y$13$Cf2Y0CBD4cnXAjBO.aDhCOC2TIsVhSApIHiOMdRkcAqbFanCUPDLW', 2, 'Henry', 'Paul'),
(144, 'hoarau@gmail.com', '$2y$13$kFgluPToNDq4n3dpmBj60erAdQqV5JWVI/cl/RUmRnZGhvdhOt6rm', 2, 'Hoarau', 'Aurore'),
(145, 'hubert@gmail.com', '$2y$13$eRj0YW85aTL42leH5iqN6OWTpGFVoCp8yr3h/JUiBNm2NTu.6kNpC', 2, 'Hubert', 'Henri'),
(146, 'huet@gmail.com', '$2y$13$a9eoZdxjzM0sCURsLZpyged1Z1XKA85pNqs6/6aGakHs8OsEY0D9W', 2, 'Huet', 'Denis'),
(147, 'humbert@gmail.com', '$2y$13$dmaVFueLj/WK9csjgLdPr.xNL8nD/Y0gQI7JCqEjZb1m/GdlMdyie', 2, 'Humbert', 'Jacqueline'),
(148, 'jacquet@gmail.com', '$2y$13$ffmR4uQY4h.XJgQktCIrTOnGnkTjcxjPqsHO34TN452tSEkb4IOwu', 2, 'Jacquet', 'Martin'),
(149, 'jean@gmail.com', '$2y$13$3ZFiqJoPg6jx1M7VHXvqUeumrz7Jl6ZngP8iGPOp3qOKV4UIFPAtu', 2, 'Jean', 'Capucine'),
(150, 'joly@gmail.com', '$2y$13$Y2V.PM1nlSBIz5wbwGsFt.XSAS1L67EnisdV2EZSStvEnQr/w80dO', 2, 'Joly', 'Geneviève'),
(151, 'joseph@gmail.com', '$2y$13$82rlytgIWz2fG6bFAJs/0unoPJyIQelZGLtcTQYLy1eZLBg1oUcD.', 2, 'Joseph', 'Franck'),
(152, 'jourdan@gmail.com', '$2y$13$Bc0bsgoIsgTXDeOTOSi9PuPQtoVubUi9xpHCjJbGBwLlQqSN4St4.', 2, 'Jourdan', 'Suzanne'),
(153, 'julien@gmail.com', '$2y$13$T6xgKvuojmeRsdzk7JyPnemiZd8Pm06wbIh6Mi1xgCNHJ1gDARHs2', 2, 'Julien', 'Marianne'),
(154, 'klein@gmail.com', '$2y$13$NSKhaI33fb4wYsH96aeQ3O5KGN80Ev9V5jwI3qK3xcX5m6DuZ98H2', 2, 'Klein', 'Victor'),
(155, 'lacroix@gmail.com', '$2y$13$g0.dyQwkicIK10DXOaOlIeElHLmNYQOHmJv/DzInrdH7EbDasSv9q', 2, 'Lacroix', 'Capucine'),
(156, 'lagarde@gmail.com', '$2y$13$.2ag9ep6cUQUHKYhAlrpK.eg8MV4AH98MxlA0rqJv5y9ji95JNUI6', 2, 'Lagarde', 'Gilbert'),
(157, 'laine@gmail.com', '$2y$13$uL1fL9BY3e/0DAMlWgoXvuLG4fPccjefgmTg3Mb2TlS5gCROYIPQO', 2, 'Laine', 'Jacqueline'),
(158, 'lambert@gmail.com', '$2y$13$.fQDSaJ7Ycpxp7TixymZ3Owxs.VufVOHRRd.M058LTFXdOGNDyrB6', 2, 'Lambert', 'Aurore'),
(159, 'lamy@gmail.com', '$2y$13$YTjtSmUO7kUkZQTMDNcfLuxNAItUsoZ2WfW2lqoSRLQHGz7ZIHBP2', 2, 'Lamy', 'Olivier'),
(160, 'laporte@gmail.com', '$2y$13$SOuvrY3/59yNJZ8iPQpVEuFU1insgA7FiHN4GGzx0B7EDTI5jXIJ.', 2, 'Laporte', 'Océane'),
(161, 'laroche@gmail.com', '$2y$13$iv0Ij5dVjZEhDsF8aVmJcuf3Msg2lBh4UuHRHKNNeyYASCuEuaJZK', 2, 'Laroche', 'Noémi'),
(162, 'laurent@gmail.com', '$2y$13$aqcVY59bJeb.JDoWmJCvt.5hoBZr.M.DIH6dcbfH7hr6z2ukOGhwi', 2, 'Laurent', 'Antoine'),
(163, 'leblanc@gmail.com', '$2y$13$LnC9CG0w8R63.DXU8xh0EuhzwbIbd50k/GPOy6gc6pYIj8a3Uwe16', 2, 'Leblanc', 'Édouard'),
(164, 'lebon@gmail.com', '$2y$13$z8FihtLTctxfI11pDmR4rekqzVY3qACAXbp.NWa/HZOVlW2Mu8xi.', 2, 'Lebon', 'Guy'),
(165, 'leclercq@gmail.com', '$2y$13$qaP2DiZeoVhdUHefXekVUOIbfCCkU1pRel9Fxb4h8eB1BTvO0nLJG', 2, 'Leclercq', 'Thomas'),
(166, 'leconte@gmail.com', '$2y$13$pHXDL/F7tx38wi3QxszY/.WjDFGpIPXEcKH70n9CwBaAjhEdZ7R.y', 2, 'Leconte', 'Adèle'),
(167, 'lecoq@gmail.com', '$2y$13$diaIRMNaDg12C2eVxWjtKOXxM0DwTTvv5BOTUKpBaUu4qKoC/g/d6', 2, 'Lecoq', 'Charles'),
(168, 'lejeune@gmail.com', '$2y$13$H.sLfeVH57DKPJlCOteYlOajl.1NdSgV7.tlYkdb.mM00Vs7iTN0q', 2, 'Lejeune', 'Céline'),
(169, 'leleu@gmail.com', '$2y$13$T.MR3om4g8v/Et.TwPAVn.IFJjOaVOZGXNFw6L0cw/iNFa5wdeJvO', 2, 'Leleu', 'Louis'),
(170, 'lemaire@gmail.com', '$2y$13$4fT.Cm7S6QAW9aviwjG7EujG982rvq91/swUI6eNARxrhZlsf21ni', 2, 'Lemaire', 'Gabriel'),
(171, 'lemoine@gmail.com', '$2y$13$hhWbh3jsO/f7OI5Oz.TfGOixlWqzKsSNhYN1auJOK3SMp8dUqpJLq', 2, 'Lemoine', 'Camille'),
(172, 'leroux@gmail.com', '$2y$13$3XcaxpEiK4Iar.Htm948jeIw28cs0sKzqKPTXrmKLgex2rFVKtDVy', 2, 'Leroux', 'Sylvie'),
(173, 'letellier@gmail.com', '$2y$13$yi6NT3nosk6wEkkbJgYhouSV3ENdwJ.6CQpMffsgGYg5jrBOYsdDq', 2, 'Letellier', 'Lucy'),
(174, 'lévêque@gmail.com', '$2y$13$0UcJg2aeauQZG12KVlQN9eeHO1wZmo6Y0cC2BC.h3y54zxjy.6P82', 2, 'Lévêque', 'Andrée'),
(175, 'loiseau@gmail.com', '$2y$13$zE3i6qtLaoLMqI5jLYb7HuRCRPPYkT34yLXgP6pVWjc95ffXsChX.', 2, 'Loiseau', 'Amélie'),
(176, 'maillard@gmail.com', '$2y$13$67RI2FSHyXytF7eLNEGboO41YmkJfSLMEyBA6PbUaeUxEpfGQX/8m', 2, 'Maillard', 'Thibaut'),
(177, 'maillet@gmail.com', '$2y$13$YL85VYiDrAU22M/GiAFODuiaCwVmiDsJKzpNbdoI4ndL8Jm2dFqhW', 2, 'Maillet', 'Marthe'),
(178, 'maillot@gmail.com', '$2y$13$P2Bf6imuCAHiDY32ChalCeqmabFO.KLinTaTatqCEHxE1k4CavZji', 2, 'Maillot', 'Constance'),
(179, 'mallet@gmail.com', '$2y$13$a.IU8qMIaRAni0xWKZqgRuN0eJARbJCEZSDewWHKztlQQploL25mi', 2, 'Mallet', 'Suzanne'),
(180, 'marchal@gmail.com', '$2y$13$Fqeqlc/gXK7aGXokmeVv.umyIGyfZNTVWqFL9J8nRGYQFSScHHO4i', 2, 'Marchal', 'Bernard'),
(181, 'marchand@gmail.com', '$2y$13$iIETesWMMmYRhwqz46eIt.UoeOsbZZbBGD7GWIKih1F0tyRQ4Qs9e', 2, 'Marchand', 'Daniel'),
(182, 'maréchal@gmail.com', '$2y$13$6SQ3/UaHF2SvU5Y0gFhdS.2SFGf4A7RfY9YloY/GlJh5TtYpr9SZ.', 2, 'Maréchal', 'Xavier'),
(183, 'marie@gmail.com', '$2y$13$yCXn/IAg9Gmh3Suh7UDLxuU4MLIW/oIr2mHVmWEAUC9w0wFqfLGqS', 2, 'Marie', 'Adélaïde'),
(184, 'marques@gmail.com', '$2y$13$rwnn/wMGViD6FOhOHmd2neXOuE7RGU0I2q/Ja5n8R2pYov.tfGZwy', 2, 'Marques', 'Marguerite'),
(185, 'martin@gmail.com', '$2y$13$reUMH7MnStCWi9HzS1iV7On3LVlvncBAJ57a1nVHC/1OqkO7YALxe', 2, 'Martin', 'Capucine'),
(186, 'martinez@gmail.com', '$2y$13$CTsFPADHy3Pd5yOy0SudYO.MmSqwM4OedC5Y61mCmtauz0qWiAywy', 2, 'Martinez', 'Susanne'),
(187, 'mary@gmail.com', '$2y$13$IuXiWsvB4GvkJcWQuHC3Mumb1/234Bb1V5iyHpVBvVh99t4FwNCHS', 2, 'Mary', 'David'),
(188, 'masse@gmail.com', '$2y$13$XlHF7s9N/NwfKP6VWQC8X.v26iJ1tGrlg/pWWE3dW7LF5RzSM485O', 2, 'Masse', 'Céline'),
(189, 'mercier@gmail.com', '$2y$13$yB6c4ia4c6xPz4USlclRWuumiPSndYkaw5HN8U/4HOxpcc809lKPy', 2, 'Mercier', 'Martine'),
(190, 'meyer@gmail.com', '$2y$13$XUqL/AI3ux52iuTXwxzXZegDMVqPMTWMpZmDVPruZeebTAP39qxyS', 2, 'Meyer', 'Patricia'),
(191, 'michaud@gmail.com', '$2y$13$QW/NI9v0cviQfZhuyoP4KeqIvF0eI6OX.1AaU4h.Cd.6KAVe7GYpy', 2, 'Michaud', 'Thibault'),
(192, 'michel@gmail.com', '$2y$13$X5ji0emu9qldHw9LcQXS9OoJrVN2HuBj19GizvhcLzqNcU/sz8qr.', 2, 'Michel', 'Sophie'),
(193, 'millet@gmail.com', '$2y$13$beQuvdemqb3AgoC0gRWeU.4oMXJyEV64tW11elMehfX.lvRR10I1G', 2, 'Millet', 'Colette'),
(194, 'morel@gmail.com', '$2y$13$Vy6rW3fDvanX9X9HSlwp7ezY4Z9.witQoVX.F4iWceh05GlrljLsu', 2, 'Morel', 'Georges'),
(195, 'moreno@gmail.com', '$2y$13$kaXTI1Fm4otqpmANM2wgd./QZS/qVHYVZH2P2TJMrMt8C24AZdg4W', 2, 'Moreno', 'Honoré'),
(196, 'morin@gmail.com', '$2y$13$PzNWuNUptgVHERcvVrc7nO7A2N/feikz5mgBZRtwjvsX1JMLmIxoa', 2, 'Morin', 'Jean'),
(197, 'moulin@gmail.com', '$2y$13$MaY87Cm8wXbqF71BGEsaNubh2AhlJwWXHa4k3gAcmNzDlhb2IFn7S', 2, 'Moulin', 'Édith'),
(198, 'muller@gmail.com', '$2y$13$nS2EzmEjlXkWXeTJfIeLQ.wrw6UVLXvjA4CBxzWWi9N6xmoiqd/mW', 2, 'Muller', 'Hortense'),
(199, 'navarro@gmail.com', '$2y$13$MtlPJc1Bxeu7XzmGt99hsOubfPb5l6/5POly3WrVwfjjyPfR8UKj2', 2, 'Navarro', 'Marianne'),
(200, 'nicolas@gmail.com', '$2y$13$OhYGzLsur7CmUQjkKrGZsuTpY4VW6Hp5X8Na.d3lFK5bmUpYpr2fG', 2, 'Nicolas', 'Pénélope'),
(201, 'olivier@gmail.com', '$2y$13$dy24SpUP85rX5ll/UDZCvOCcD3WpaPblWUj1/GbD48/wSHGOlyXci', 2, 'Olivier', 'Joseph'),
(202, 'ollivier@gmail.com', '$2y$13$Ue/yS/D9MnjNXLcgMlYlxOum3.IET5vmmMmPdQFfEM2S8VZZDnBqy', 2, 'Ollivier', 'Joséphine'),
(203, 'pages@gmail.com', '$2y$13$NpSM4.5CIcqgAve3kkdgEuG6/H/3I7DSU2H/QcQF7P0.E8ptPfNWC', 2, 'Pages', 'Benoît'),
(204, 'parent@gmail.com', '$2y$13$EVC8cmfGEhoI0Li/7doureyJQ9292yDOA6fZNRJKoMf96F8IZFO0q', 2, 'Parent', 'Isabelle'),
(205, 'payet@gmail.com', '$2y$13$XDHouDuccSLtvs4HJdezWOcFBqJPRD44nwOEr1eJW8tslck6OHXBG', 2, 'Payet', 'Éléonore'),
(206, 'pelletier@gmail.com', '$2y$13$cPSNnaM.czM2DAZ5oMQgjOTZ5j4iKHxrBNvfBHXUzRrXEzok6wZOC', 2, 'Pelletier', 'Thérèse'),
(207, 'peltier@gmail.com', '$2y$13$O1n9cZ4S0CZeYeTMbWN36ugaKfhnH8Mn2JoSJtr.TunVUz5zqqRcC', 2, 'Peltier', 'Marie'),
(208, 'peron@gmail.com', '$2y$13$FpzN85yuMQ1xuZMuO8lSpupDe6ischvucXKgBjtpU/USUcYqQ1iP.', 2, 'Peron', 'Sébastien'),
(209, 'perret@gmail.com', '$2y$13$mJnQ4CdR97D9Zf0MY9c1RurjTVD7fJoITnWjQEOqEpHP2zl0CsbcO', 2, 'Perret', 'Henri'),
(210, 'perrier@gmail.com', '$2y$13$CZKB/s.WwoCdWEfOlQeS6uYY.2I/9oxyhDzIGOiu9MWwZoKd68TCO', 2, 'Perrier', 'Yves'),
(211, 'perrin@gmail.com', '$2y$13$rw/2znwgUIJg3LJWEaHore78.FjBXOL8yohUwHsRXtSpm.1BHOrAW', 2, 'Perrin', 'Marcel'),
(212, 'petitjean@gmail.com', '$2y$13$BTuRi8ohlYSJ/mgqQOy8Zuoz6L5QgHBcu.oER1kHJz9ZSxaBccQ1i', 2, 'Petitjean', 'Stéphanie'),
(213, 'philippe@gmail.com', '$2y$13$7eaaDS7AqY.E9xIY5xi0DOLZfqH0pszoVJqrOC/D0wx3R2foqaADC', 2, 'Philippe', 'Valentine'),
(214, 'pierre@gmail.com', '$2y$13$YjaAmWd0DAw9TuUH/OcqpuIc47Auhj2T1CLMTMuUx6ahR7X9pIRr.', 2, 'Pierre', 'Océane'),
(215, 'pineau@gmail.com', '$2y$13$Yfxrjn2MFv2d9fOeDrdgHOYeYPCAu88LJEoaMWOUko9rd8Vkl/cb6', 2, 'Pineau', 'Adrienne'),
(216, 'pinto@gmail.com', '$2y$13$5bApfV7Xuv8B1/PPOqCfCOqp2CEPUoKdoDUh73Ru0kKDro45GFpuq', 2, 'Pinto', 'Aimé'),
(217, 'poirier@gmail.com', '$2y$13$59WS4VYjdaYwoinZ43MqduaogpMm/e.7Knds8uZ.D6pldE8GCAb6i', 2, 'Poirier', 'Auguste'),
(218, 'pons@gmail.com', '$2y$13$UpHJZI900NLpAN0wb4tPZOzGxo2qb7FdEwusSPX5ApoKrpzfAiqpy', 2, 'Pons', 'Manon'),
(219, 'potier@gmail.com', '$2y$13$rXQNiqajEru3VoE29dOCfOpjklu9knaFhZlISZSGthl/uJEMAOKsK', 2, 'Potier', 'Pénélope'),
(220, 'pruvost@gmail.com', '$2y$13$/o376Ra8BkUTmjpxuv2biOgcafm2b3RouM6Tgo0EhdyfKngxJOGeu', 2, 'Pruvost', 'Michelle'),
(221, 'ramos@gmail.com', '$2y$13$Y42QeH2X5WK8GOfPqFGKzupZe5aUPEX9nEoHrfqdkF49PYBLM1mDm', 2, 'Ramos', 'Luce'),
(222, 'renault@gmail.com', '$2y$13$AErHWJ.YBighOmEsranQ8u6v3JwI0QKtLWkK0aZvLSQocpNeVBRj6', 2, 'Renault', 'Bernard'),
(223, 'reynaud@gmail.com', '$2y$13$6GKCBZuAJ/Ar94Mog9HkYOfKwmRS6y6plF2IIzt0qxWKwT76dJHCW', 2, 'Reynaud', 'Nathalie'),
(224, 'richard@gmail.com', '$2y$13$uKjkrK/OxW8KSl1s8qhd1uCFoTF2clZa44guOcJPX3EmLu6Ep7POa', 2, 'Richard', 'Stéphanie'),
(225, 'robert@gmail.com', '$2y$13$/t78E4gkqPUmw.n3VHqZDu1FPLHICJInrzXPKfcDjRzFiOOcsQgv.', 2, 'Robert', 'Alexandria'),
(226, 'rocher@gmail.com', '$2y$13$Zu2eMfFPSUCZkN1fkCbbGuWC5Pu31seuPem8rV0JLimpvXHcE.Fii', 2, 'Rocher', 'Sylvie'),
(227, 'rodriguez@gmail.com', '$2y$13$yvYPlJDhaKidCVndkQYVY.wNqyG2zFiTat4H3CIeVqxqKrFkQbjUa', 2, 'Rodriguez', 'Antoinette'),
(228, 'rousseau@gmail.com', '$2y$13$qD5fzuK7jXvXqostlGvqvejCX7sS3ErkV5Vqdk0BuPYDGT7BvtIlm', 2, 'Rousseau', 'Suzanne'),
(229, 'rousset@gmail.com', '$2y$13$5MlCLpfOWkMkCStpUtxg0OTXm.7hxd57A2XkSlE2lRqb1P53irlIm', 2, 'Rousset', 'Édith'),
(230, 'roux@gmail.com', '$2y$13$qZNtQDz0Y.x6YIwETZTEoOngZADRbQqAnNaSWMf9mrEuPp9ldrgzu', 2, 'Roux', 'Guillaume'),
(231, 'royer@gmail.com', '$2y$13$ATBG0Vs5ti3jD.8HUWr4cOCGMWxm70NzNNlswT1XDKU3mbhvS3cM2', 2, 'Royer', 'Charles'),
(232, 'salmon@gmail.com', '$2y$13$FhZ4GTU0mmMqfIQue.AJje6/GfjCdkl.Vf0c/QR/t7Z5EbDWMLmqa', 2, 'Salmon', 'Dominique'),
(233, 'samson@gmail.com', '$2y$13$VRNsNm9x6eRkMCdmoRm1VORuRow1uAS4LvitwhVJfmH4.isv4w8PO', 2, 'Samson', 'Paulette'),
(234, 'sanchez@gmail.com', '$2y$13$vVT0Wm6q4PunKpX6Fes51.mDyCmcfbCZmeMDXhaijLM0dGVAvMRJC', 2, 'Sanchez', 'Édith'),
(235, 'schmitt@gmail.com', '$2y$13$6tya9Ts1wfOjMOFBypcIdOlaplnMJ1u5KrdIiGEYmfVOneEdkfALq', 2, 'Schmitt', 'Jeanne'),
(236, 'seguin@gmail.com', '$2y$13$023ZXy9lsxXXg1X6G2yf9ObwzQkORWS0Efg8VyGcqSf09Uw7V2wi2', 2, 'Seguin', 'Claudine'),
(237, 'simon@gmail.com', '$2y$13$/KWiez9eYq85fvGUAzINKeiYeHArl5ztjILEFl4o6epfdRY.uU..6', 2, 'Simon', 'Frédéric'),
(238, 'teixeira@gmail.com', '$2y$13$wfPDE6sM8bJ7lx5HFKGx5.Xzhi0ZXv9cGnHi3sN27XJFqa4ozEOOG', 2, 'Teixeira', 'Thomas'),
(239, 'thibault@gmail.com', '$2y$13$stAxGixwzo73H.JKDhZhF.at3y9/TEHimV3WcDeGFPVX6I3PeQ3I.', 2, 'Thibault', 'Philippe'),
(240, 'thierry@gmail.com', '$2y$13$SH01ixG9SHoFZHY8Dex0pOsQXsK840plEZ/2rBGfnb.8USkilRXW.', 2, 'Thierry', 'Astrid'),
(241, 'torres@gmail.com', '$2y$13$h8QZpfuVNm6DMz/lkEoYAe/IQHmw9jcqjQHIiAKi6ELRGAuManAu.', 2, 'Torres', 'Louis'),
(242, 'toussaint@gmail.com', '$2y$13$bkp0j.fjJ0QH36iibXl7N.xOq/rw2HKlxflT/CYfz6/CIxmi1RWnq', 2, 'Toussaint', 'Laurence'),
(243, 'traore@gmail.com', '$2y$13$ma618ic959WDQ.zF4mP0O.bGZGg1tlsgM2UP9iXujHuh2uvDmMVfS', 2, 'Traore', 'Maggie'),
(244, 'vaillant@gmail.com', '$2y$13$oGp5Cw6Z3mgY.RgY8OPhSuLOF4n2/8ED6CbDbb7Jct/6uVoIlvDR6', 2, 'Vaillant', 'Claude'),
(245, 'vallée@gmail.com', '$2y$13$nMqEPwFTm7hQdBmJbefyKedraU1/tcx7lukjbcjidYu1eDTfx4U7q', 2, 'Vallée', 'Louise'),
(246, 'vasseur@gmail.com', '$2y$13$mupXKptTWTpwtZm.65CtOOo.SgVcLZ41WFjWG4NgETlA8L9mvbFy.', 2, 'Vasseur', 'Olivie'),
(247, 'wagner@gmail.com', '$2y$13$4iKNqMbDgY5STXosZunUa.zxVrXhx8jXUB.V62ixaCDs12WZdpaGW', 2, 'Wagner', 'Bernard'),
(248, 'weber@gmail.com', '$2y$13$cu0qTwXX.slsQzXx3DA42OCkkZFn1jkzK.axHIa/OoAAMbUFPyX1q', 2, 'Weber', 'Laure'),
(302, 'le goff@gmail.com', '$2y$13$aNcrRUUqKMmvWsLqQ3n49uvp4Ebeb5gygR9UyIGJUVMik1rr1y/2S', 2, 'Le Goff', 'Aimée'),
(303, 'anne.peltier@profmail.org', '$2y$13$fs2GZhdyP8/4wJ7YEnRlye0atTVjNhJ1wdePBsPGi1bVh/vsaGJ3G', 2, 'Peltier', 'Anne'),
(304, 'lefèvre@gmail.com', '$2y$13$O/EU5BYnEmUQqKgQUxRq4.qCoKM3sEQDCPbQpwEbkJoLoN7N.8Bfy', 2, 'Lefèvre', 'Antoinette'),
(305, 'arthur.vallee@educatif.org', '$2y$13$RCNgQ.GYebkQhDoXmX3TOeXBGAm1N29gOzcevYuzawwWxYosClWQS', 2, 'Vallée', 'Arthur'),
(306, 'aurore.renault@pedago.org', '$2y$13$xQJzfhUGgE2fQinYOu5oyOAy0N6OhKdxY/855..3qS7jn6CNo.HKW', 2, 'Renault', 'Aurore'),
(307, 'legendre@gmail.com', '$2y$13$V8DeC6TCVev2Y9xJIzegf.uUPJScem/CNWGb5MEAad.TSd37/BBT.', 2, 'Legendre', 'Caroline'),
(308, 'christophe.denis@professeurs.org', '$2y$13$efsAyDfthMlYWj8QPZib1.n5esbfNoRKSM6zr03lCke4GwXluEKc6', 2, 'Denis', 'Christophe'),
(309, 'hernandez@gmail.com', '$2y$13$/KIoCV3feJcv9VWDrn1oneHCVQU8bcY/SF9Jw2NzfafkeArKSPWEq', 2, 'Hernandez', 'Clémence'),
(310, 'denis.laporte@profmail.com', '$2y$13$9BrxpQsmV6qa1zZcJz3wlOQJc3eGpbxpMQwMnrtJrWif4ipU7ijJy', 2, 'Laporte', 'Denis'),
(311, 'sauvage@gmail.com', '$2y$13$9jo4UBMzQ/8aHPC14gVTcOySzYASqGtWXX6eNDAkq4kwYMWOLh/pi', 2, 'Sauvage', 'Dominique'),
(312, 'pires@gmail.com', '$2y$13$aO.RZjHvuq.i.l5.Wrmv0uEVfKgkrtN885A7wn1CKnvYkxJdOqCC6', 2, 'Pires', 'Françoise'),
(313, 'maury@gmail.com', '$2y$13$1Etfu.ZCeJ/l8cPrjTQOo.stDCDhNeDM3SX9gCcc3/BtsM0ISrCp2', 2, 'Maury', 'Frédérique'),
(314, 'guy.fontaine@enseignement.fr', '$2y$13$zeH6TAwTmvVctGlpVKcIS.iHwSEUkqGo.goxVWfoWEC7pG4H5mEne', 2, 'Fontaine', 'Guy'),
(315, 'jean.moulin@enseignant.fr', '$2y$13$pWQyLlXkwB3vR3Kgnf6NK.0C/qS6zrxO.I9ZMC2A7PfkrNPXfGLb.', 2, 'Moulin', 'Jean'),
(316, 'louis.delmas@enseignant.org', '$2y$13$QBuosXv.JT0julYMpFDXXeaO2UwC9nXtUKNri0ZRHt6aVLvU3xgVi', 2, 'Delmas', 'Louis'),
(317, 'bertrand@gmail.com', '$2y$13$VOBFpvbolPo03LTOMuX8nuYWatVdA/.F9A3Uyvnze.fQSuta91TcG', 2, 'Bertrand', 'Margaud'),
(318, 'rossi@gmail.com', '$2y$13$wfSJ9emlpPxfM8KnwyUzkuNnDoweG8amIcd693zTK3pnCyKvSmV4S', 2, 'Rossi', 'Margaud'),
(319, 'prévost@gmail.com', '$2y$13$EPLIpAsIcGq0uNYgh8Jbsevo/ebmvzAY7Y75PnZtC0vvFnklO1duO', 2, 'Prévost', 'Martine'),
(320, 'noël@gmail.com', '$2y$13$V4lp6q0ZUjhGKm8Un5oYjehId5gYZvhp8N0wQvhmddIbDI1Hz39AS', 2, 'Noël', 'Nicolas'),
(321, 'blanchard@gmail.com', '$2y$13$Y6HwAXCGdMfmR6Jw.L.oL.6WZT7FiLmuPWJASE9XdAGMQJ4sEbk6y', 2, 'Blanchard', 'Patrick'),
(322, 'philippine.maillard@lyceenet.fr', '$2y$13$l7JkZOPVWuXOqRoPQOQQtO1K4RaC48faHqG/7oEUzM/hNBBt8mXEK', 2, 'Maillard', 'Philippine'),
(323, 'philippine.pelletier@formation.net', '$2y$13$vV8ACdeNWkrHDy7oBd/BJ.EpLwgM5KPue.TJacFEAbJns71ezcAse', 2, 'Pelletier', 'Philippine'),
(324, 'imbert@gmail.com', '$2y$13$ObsnXGabCcJGwyRQvjcVqeC.MXlqsxXoTFS2OKN4TGkL.oFoelFY.', 2, 'Imbert', 'Robert'),
(325, 'benoit@gmail.com', '$2y$13$JisWPxpds/m88fEag1E1we.jtPTWJR25VJBlEzUM8sCn3yKUcX3Ou', 2, 'Benoit', 'Susanne'),
(326, 'theophile.maillet@ecolepro.net', '$2y$13$Ebmhnv3YJw.cO8cJqmJQ6eHn0VbQSZzf2seZhraPPIhnrGWtoxqTy', 2, 'Maillet', 'Théophile'),
(327, 'thomas.bazin@ecoleconnect.fr', '$2y$13$IaRRTzVR1NySuTOLPSr4ZuXLg.D8m6oHmICWtHQhnBOrdlFRK6..W', 2, 'Bazin', 'Thomas'),
(328, 'thomas.grondin@formationmail.com', '$2y$13$cR3FqPA6DGH/XVruaI.DtuDKAJy1b/h9zFE9IPApN01l.eJxVsb0K', 2, 'Grondin', 'Thomas'),
(329, 'alexandre@gmail.com', '$2y$13$eJVjC7yGt0.9/6kGf5Io/uuNgAKu27v8M5xL2sKLaY39fQLK62LXq', 2, 'Alexandre', 'Timothée'),
(330, 'lebreton@gmail.com', '$2y$13$U1jkvcW4h839F1k1iAwm/e19FFUVl83TzhVnfnzyW2Nn1OS0.6.5a', 2, 'Lebreton', 'Vincent'),
(331, 'lévy@gmail.com', '$2y$13$GnPfi2Eut4YtYQeCwo27jOWAoi.btWL7/rlo0bIIf8PtFKoyQyV1e', 2, 'Lévy', 'Zacharie');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `accessoire`
--
ALTER TABLE `accessoire`
  ADD CONSTRAINT `FK_8FD026ACF11D9C` FOREIGN KEY (`instrument_id`) REFERENCES `instrument` (`id`);

--
-- Contraintes pour la table `contrat_pret`
--
ALTER TABLE `contrat_pret`
  ADD CONSTRAINT `FK_1FB83C67CF11D9C` FOREIGN KEY (`eleves_id`) REFERENCES `eleves` (`id`),
  ADD CONSTRAINT `FK_1FB84C67CF11D9C` FOREIGN KEY (`instrument_id`) REFERENCES `instrument` (`id`);

--
-- Contraintes pour la table `cours`
--
ALTER TABLE `cours`
  ADD CONSTRAINT `FK_FDCA8C9C7C1CAAA9` FOREIGN KEY (`type_instrument_id`) REFERENCES `type_instrument` (`id`),
  ADD CONSTRAINT `FK_FDCA8C9CBAB22EE9` FOREIGN KEY (`professeur_id`) REFERENCES `professeur` (`id`);

--
-- Contraintes pour la table `eleves`
--
ALTER TABLE `eleves`
  ADD CONSTRAINT `FK_383B09B1592968A8` FOREIGN KEY (`responsables_id`) REFERENCES `responsables` (`id`),
  ADD CONSTRAINT `FK_383B09B1B76F6B31` FOREIGN KEY (`tranche_id`) REFERENCES `tranche` (`id`),
  ADD CONSTRAINT `FK_383B09B1D60322AC` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Contraintes pour la table `inscriptions`
--
ALTER TABLE `inscriptions`
  ADD CONSTRAINT `FK_74E0281C7ECF78B0` FOREIGN KEY (`cours_id`) REFERENCES `cours` (`id`),
  ADD CONSTRAINT `FK_74E0281CC2140342` FOREIGN KEY (`eleves_id`) REFERENCES `eleves` (`id`);

--
-- Contraintes pour la table `instrument`
--
ALTER TABLE `instrument`
  ADD CONSTRAINT `FK_3CBF69DD4827B9B2` FOREIGN KEY (`marque_id`) REFERENCES `marque` (`id`),
  ADD CONSTRAINT `FK_3CBF69DD7C1CAAA9` FOREIGN KEY (`type_instrument_id`) REFERENCES `type_instrument` (`id`),
  ADD CONSTRAINT `FK_3CBF69DDC31BA576` FOREIGN KEY (`couleur_id`) REFERENCES `couleur` (`id`);

--
-- Contraintes pour la table `intervention`
--
ALTER TABLE `intervention`
  ADD CONSTRAINT `FK_D11814AB8A49CC82` FOREIGN KEY (`professionnel_id`) REFERENCES `professionnel` (`id`),
  ADD CONSTRAINT `FK_D11814ABCF11D9C` FOREIGN KEY (`instrument_id`) REFERENCES `instrument` (`id`);

--
-- Contraintes pour la table `metier_professionnel`
--
ALTER TABLE `metier_professionnel`
  ADD CONSTRAINT `FK_FA14296C8A49CC82` FOREIGN KEY (`professionnel_id`) REFERENCES `professionnel` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_FA14296CED16FA20` FOREIGN KEY (`metier_id`) REFERENCES `metier` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD CONSTRAINT `FK_B1DC7A1E8E2AD382` FOREIGN KEY (`inscriptions_id`) REFERENCES `inscriptions` (`id`);

--
-- Contraintes pour la table `professeur`
--
ALTER TABLE `professeur`
  ADD CONSTRAINT `FK_17A55299D60322AC` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Contraintes pour la table `professeur_type_instrument`
--
ALTER TABLE `professeur_type_instrument`
  ADD CONSTRAINT `FK_1E1989D67C1CAAA9` FOREIGN KEY (`type_instrument_id`) REFERENCES `type_instrument` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1E1989D6BAB22EE9` FOREIGN KEY (`professeur_id`) REFERENCES `professeur` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `responsables`
--
ALTER TABLE `responsables`
  ADD CONSTRAINT `FK_853808A5B76F6B31` FOREIGN KEY (`tranche_id`) REFERENCES `tranche` (`id`);

--
-- Contraintes pour la table `tranche_type`
--
ALTER TABLE `tranche_type`
  ADD CONSTRAINT `FK_F98E49B2B76F6B31` FOREIGN KEY (`tranche_id`) REFERENCES `tranche` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_F98E49B2C54C8C93` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `type_instrument`
--
ALTER TABLE `type_instrument`
  ADD CONSTRAINT `FK_21BCBFF8B3B774A5` FOREIGN KEY (`class_instru_id`) REFERENCES `classe_instrument` (`id`);

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_8D93D649D60322AC` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

