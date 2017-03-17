-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 17 Mars 2017 à 16:11
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `gestionvrai2`
--

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

CREATE TABLE IF NOT EXISTS `formation` (
  `Nom_formation` varchar(25) NOT NULL,
  `num_formation` int(11) NOT NULL AUTO_INCREMENT,
  `id_formation` int(11) NOT NULL,
  `id_admin` int(11) NOT NULL,
  PRIMARY KEY (`num_formation`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

CREATE TABLE IF NOT EXISTS `matiere` (
  `idMat` int(20) NOT NULL AUTO_INCREMENT,
  `NomMat` varchar(60) NOT NULL,
  `ObjPrincipalMat` varchar(60) NOT NULL,
  `EffectifMat` int(60) NOT NULL,
  PRIMARY KEY (`idMat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `prof`
--

CREATE TABLE IF NOT EXISTS `prof` (
  `iP` int(20) NOT NULL AUTO_INCREMENT,
  `nomP` varchar(60) NOT NULL,
  `prenomP` varchar(60) NOT NULL,
  `prix` float NOT NULL,
  PRIMARY KEY (`iP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `semestre`
--

CREATE TABLE IF NOT EXISTS `semestre` (
  `id_semestre` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_semestre` varchar(25) NOT NULL,
  `id_formation` int(11) NOT NULL,
  PRIMARY KEY (`id_semestre`),
  UNIQUE KEY `Nom_semestre_2` (`Nom_semestre`),
  KEY `id_semestre` (`id_semestre`),
  KEY `Nom_semestre` (`Nom_semestre`),
  KEY `id_formation` (`id_formation`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- Structure de la table `ue`
--

CREATE TABLE IF NOT EXISTS `ue` (
  `id_ue` int(12) NOT NULL AUTO_INCREMENT,
  `id_semestre` int(11) NOT NULL,
  `nom_ue` varchar(25) NOT NULL,
  PRIMARY KEY (`id_ue`),
  KEY `fk_id_ue_semestre` (`id_semestre`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `ue`
--
ALTER TABLE `ue`
  ADD CONSTRAINT `fk_id_ue_semestre` FOREIGN KEY (`id_semestre`) REFERENCES `semestre` (`id_semestre`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
