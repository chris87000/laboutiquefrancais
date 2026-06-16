-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : mysql
-- Généré le : mar. 16 juin 2026 à 20:01
-- Version du serveur : 9.7.0
-- Version de PHP : 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `laboutiquefrancaise`
--
CREATE DATABASE IF NOT EXISTS `laboutiquefrancaise` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `laboutiquefrancaise`;

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `postal` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D4E6F81A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `address`
--

INSERT INTO `address` (`id`, `firstname`, `lastname`, `address`, `postal`, `city`, `country`, `phone`, `user_id`) VALUES(6, 'Chris', 'Schmitt', '11 rue de la plage', '87015', 'Limoges', 'FR', '0663457896', 14);
INSERT INTO `address` (`id`, `firstname`, `lastname`, `address`, `postal`, `city`, `country`, `phone`, `user_id`) VALUES(7, 'Chros', 'Schmott', '12 rue des platanes', '87016', 'Limoges', 'FR', '0555457879', 14);

-- --------------------------------------------------------

--
-- Structure de la table `carrier`
--

DROP TABLE IF EXISTS `carrier`;
CREATE TABLE IF NOT EXISTS `carrier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `carrier`
--

INSERT INTO `carrier` (`id`, `name`, `description`, `price`) VALUES(1, 'Chronopost', 'livraison en 3 jours ouvrés', 7.89);
INSERT INTO `carrier` (`id`, `name`, `description`, `price`) VALUES(2, 'Colis privé', 'service pas terrible', 5.99);
INSERT INTO `carrier` (`id`, `name`, `description`, `price`) VALUES(3, 'Collisimo', 'rapide en 3 jours ouvrés', 6.99);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`, `slug`) VALUES(1, 'Sacs', 'sacs');
INSERT INTO `category` (`id`, `name`, `slug`) VALUES(2, 'Bijoux', 'bijoux');
INSERT INTO `category` (`id`, `name`, `slug`) VALUES(3, 'Casquettes', 'casquettes');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES('DoctrineMigrations\\Version20260523210254', '2026-05-23 21:26:49', 16);
INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES('DoctrineMigrations\\Version20260524132457', '2026-05-24 13:25:45', 14);
INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES('DoctrineMigrations\\Version20260530202912', '2026-05-30 20:30:24', 6);
INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES('DoctrineMigrations\\Version20260530211105', '2026-05-30 21:11:18', 24);
INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES('DoctrineMigrations\\Version20260531130724', '2026-05-31 13:07:50', 13);
INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES('DoctrineMigrations\\Version20260607163014', '2026-06-07 16:30:39', 24);
INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES('DoctrineMigrations\\Version20260614131555', '2026-06-14 13:16:55', 8);
INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES('DoctrineMigrations\\Version20260614133453', '2026-06-14 13:41:53', 6);
INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES('DoctrineMigrations\\Version20260614134140', '2026-06-14 13:45:21', 23);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `carrier_name` varchar(255) NOT NULL,
  `carrier_price` double NOT NULL,
  `delivery` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE IF NOT EXISTS `order_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `product_illustration` varchar(255) NOT NULL,
  `product_quantity` int NOT NULL,
  `product_price` double NOT NULL,
  `product_tva` double NOT NULL,
  `my_order_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_ED896F46BFCDF877` (`my_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `illustration` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `tva` double NOT NULL,
  `category_id` int DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D34A04AD12469DE2` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `illustration`, `price`, `tva`, `category_id`, `slug`) VALUES(2, 'Sac noir', '<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</div>', '2026-05-31-08a3353127957ecce6ef9be661a1f3023ec32875.jpg', 29.9, 20, 1, 'sac-noir');
INSERT INTO `product` (`id`, `name`, `description`, `illustration`, `price`, `tva`, `category_id`, `slug`) VALUES(3, 'Sac beige', '<div>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem</div>', '2026-05-31-0eef65221307596acd822de6e7974df6a0748367_1.jpg', 49.9, 20, 1, 'sac-beige');
INSERT INTO `product` (`id`, `name`, `description`, `illustration`, `price`, `tva`, `category_id`, `slug`) VALUES(4, 'Sac crème', '<div>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae</div>', '2026-05-31-4b7ce8c3471247e7f4e10fc9e35a1883539233ea_1.jpg', 77.9, 20, 1, 'sac-creme');
INSERT INTO `product` (`id`, `name`, `description`, `illustration`, `price`, `tva`, `category_id`, `slug`) VALUES(5, 'Sac nuit', '<div>On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.</div>', '2026-05-31-8b47a9853fe0e0f14a148a945177a76349b0d05d.jpg', 59.9, 20, 1, 'sac-nuit');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `firstname`, `lastname`) VALUES(1, 'toot@g.fr', '[]', 'sds', 'chris', 'schmitt');
INSERT INTO `user` (`id`, `email`, `roles`, `password`, `firstname`, `lastname`) VALUES(2, 'toto@gmail.fr', '[]', '123', 'toto', 'schmitt');
INSERT INTO `user` (`id`, `email`, `roles`, `password`, `firstname`, `lastname`) VALUES(5, 'albert@g.fr', '[]', '$2y$13$GMZOoV6KqCg4p9hlJDSxLO8mzkvazkqg0C4Pg8clC9jYLccoeW9bu', 'albert', 'X');
INSERT INTO `user` (`id`, `email`, `roles`, `password`, `firstname`, `lastname`) VALUES(10, 'r@gt.fr', '[]', '$2y$13$Q5nnWczonaLmOHoD6tpT4ubqN3A3tTErt3xXg8HdNa3TqSbGnmcPq', 'chris', 'schmitt');
INSERT INTO `user` (`id`, `email`, `roles`, `password`, `firstname`, `lastname`) VALUES(12, 'ri@gt.fr', '[]', '$2y$13$HCvvt4aHv6Yy5FSLuLBY4u.NGVstuRu96Ai.dCejWI.ePrfXsPE6C', 'chros', 'schmitt');
INSERT INTO `user` (`id`, `email`, `roles`, `password`, `firstname`, `lastname`) VALUES(13, 'yo@gt.fr', '[]', '$2y$13$slJLLes4xGzKrDqgbgwihO74X4QUqicO/Itp4gMe6UcZcUiqlQhPm', 'Riri', 'Yo');
INSERT INTO `user` (`id`, `email`, `roles`, `password`, `firstname`, `lastname`) VALUES(14, 'chris', '[]', '$2y$13$uLzP2SipF4K.AysehiMKL.3BkfnZJu9UIfTOrcko0GRoaPBDXXjo6', 'christian', 'schweickert');
INSERT INTO `user` (`id`, `email`, `roles`, `password`, `firstname`, `lastname`) VALUES(15, 'toto@t.fr', '[]', '$2y$13$sJanwOHUiT9dlneIPLWkwuRedvrYHCYO/A82YM9wZZ.qSuTeiuQeS', 'toto', 'totor');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `FK_D4E6F81A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `FK_ED896F46BFCDF877` FOREIGN KEY (`my_order_id`) REFERENCES `order` (`id`);

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
