## ================================================================================

## &nbsp;                   E-MUSIC - SYSTÈME DE GESTION D'ÉCOLE DE MUSIQUE

## ================================================================================

## 

## Application web de gestion complète pour les écoles de musique, 

## développée avec Symfony.

## 

## ================================================================================

## TABLE DES MATIÈRES

## ================================================================================

## 

## 1\. Présentation

## 2\. Fonctionnalités

## 3\. Prérequis

## 4\. Installation

## 5\. Configuration

## 6\. Utilisation

## 7\. Structure de la base de données

## 8\. Technologies utilisées

## 9\. Commandes utiles

## 10\. Résolution des problèmes

## 11\. Contributeurs

## 12\. Support

## 

## ================================================================================

## 1\. PRÉSENTATION

## ================================================================================

## 

## E-Music est une application web permettant de gérer l'ensemble des activités 

## d'une école de musique :

## 

## \- Gestion des élèves et des responsables

## \- Gestion des professeurs et des cours

## \- Gestion des instruments (inventaire, prêts, interventions)

## \- Gestion des inscriptions et des paiements

## \- Suivi des contrats de prêt d'instruments

## \- Gestion des interventions techniques sur les instruments

## 

## ================================================================================

## 2\. FONCTIONNALITÉS

## ================================================================================

## 

## GESTION DES ÉLÈVES

## ------------------

## \- Inscription et profil des élèves

## \- Suivi des inscriptions aux cours

## \- Gestion des paiements échelonnés

## \- Lien avec les responsables légaux

## 

## GESTION DES COURS

## -----------------

## \- Création et planification des cours

## \- Attribution des professeurs

## \- Gestion des tranches d'âge

## \- Différents types de cours (individuel, collectif, atelier, etc.)

## 

## GESTION DES INSTRUMENTS

## -----------------------

## \- Inventaire complet (marque, couleur, prix, état)

## \- Système de prêt aux élèves

## \- Suivi des interventions techniques

## \- Gestion des professionnels de maintenance

## 

## GESTION ADMINISTRATIVE

## ----------------------

## \- Calcul selon le quotient familial

## \- Génération de contrats de prêt

## \- Suivi des attestations d'assurance

## \- Historique des paiements

## 

## ================================================================================

## 3\. PRÉREQUIS

## ================================================================================

## 

## \- PHP : Version 8.1 ou supérieure

## \- Composer : Pour la gestion des dépendances PHP

## \- MySQL/MariaDB : Version 5.7+ / 10.5+

## \- Serveur web : Apache ou Nginx

## 

## ================================================================================

## 4\. INSTALLATION

## ================================================================================

## 

## ÉTAPE 1 : CLONER LE PROJET

## ---------------------------

## git clone https://github.com/ZakinaA/25notf0nd.git

## cd 25notf0nd

## 

## ÉTAPE 2 : INSTALLER LES DÉPENDANCES

## ------------------------------------

## composer install

## 

## ÉTAPE 3 : CONFIGURER L'ENVIRONNEMENT

## -------------------------------------

## 

## Modifiez les paramètres de connexion à la base de données dans .env :

## 

## DATABASE\_URL="mysql://root:@127.0.0.1:3307/emusic?serverVersion=10.11.2-MariaDB\&charset=utf8mb4"

## 

## ÉTAPE 4 : CRÉER LA BASE DE DONNÉES EMUSIC

## -----------------------------------

## php bin/console doctrine:database:create

## 

## ÉTAPE 5 : IMPORTER LE SCHÉMA ET LES DONNÉES

## --------------------------------------------



## Via les migrations Doctrine

## php bin/console doctrine:migrations:migrate

## 

## ÉTAPE 6 : LANCER LE SERVEUR DE DÉVELOPPEMENT

## ---------------------------------------------

## symfony server:start

## 

## L'application sera accessible à l'adresse : http://localhost/25notf0nd/public/accueil

## 

## ================================================================================

## 5\. CONFIGURATION

## ================================================================================

## 

## CONFIGURATION DE LA BASE DE DONNÉES

## ------------------------------------

## Le fichier SQL fourni (emusic.sql) contient :

## \- La structure complète de la base de données

## \- Des données de démonstration pour tester l'application

## 

## PARAMÈTRES IMPORTANTS

## ---------------------

## Dans le fichier .env, vous pouvez configurer :

## 

## \# Environnement (dev, prod)

## APP\_ENV=dev

## 

## \# Mode debug

## APP\_DEBUG=true

## 

## \# URL de l'application

## APP\_URL=http://localhost





## \# Configuration email (si nécessaire)

## MAILER\_DSN=smtp://localhost:1025

## 

## ================================================================================

## 6\. UTILISATION

## ================================================================================

## 

## ACCÈS À L'APPLICATION

## ---------------------

## Une fois le serveur lancé, accédez à l'application via votre navigateur :

## \- Page d'accueil : http://localhost/25notf0nd/public/accueil

## 

## MODULES PRINCIPAUX

## ------------------

## 1\. Gestion des Élèves : /eleves

## 2\. Gestion des Cours : /cours

## 3\. Gestion des Instruments : /instrument

## 4\. Gestion des Professeurs : /professeur

## 5\. Contrats de Prêt : /contrat\_pret

## 6\. Interventions : /intervention

## 

## ================================================================================

## 7\. STRUCTURE DE LA BASE DE DONNÉES

## ================================================================================

## 

## TABLES PRINCIPALES

## ------------------

## \- eleves : Informations des élèves

## \- responsables : Responsables légaux

## \- professeur : Professeurs de l'école

## \- cours : Cours proposés

## \- inscriptions : Inscriptions des élèves aux cours

## \- instrument : Inventaire des instruments

## \- contrat\_pret : Contrats de prêt d'instruments

## \- intervention : Interventions techniques

## \- paiement : Suivi des paiements

## \- type\_instrument : Types d'instruments (Piano, Guitare, etc.)

## \- classe\_instrument : Classification (Corde, Cuivre, Bois, etc.)

## \- marque : Marques d'instruments

## \- couleur : Couleurs des instruments

## \- tranche : Tranches de quotient familial

## \- metier : Métiers des professionnels (Luthier, Accordeur, etc.)

## \- professionnel : Professionnels de maintenance

## 

## RELATIONS CLÉS

## --------------

## \- Un élève peut avoir plusieurs inscriptions

## \- Une inscription peut avoir plusieurs paiements

## \- Un instrument peut avoir plusieurs contrats de prêt

## \- Un instrument peut avoir plusieurs interventions

## \- Un professionnel peut avoir plusieurs métiers

## 

## ================================================================================

## 8\. TECHNOLOGIES UTILISÉES

## ================================================================================

## 

## \- Framework : Symfony 6.x

## \- ORM : Doctrine

## \- Base de données : MySQL/MariaDB

## \- Template : Twig

## \- CSS Framework : Bootstrap (si applicable)

## \- Gestion des assets : Webpack Encore (si applicable)

## 

## ================================================================================

## 9\. COMMANDES UTILES

## ================================================================================

## 

## SYMFONY

## -------

## \# Vider le cache

## php bin/console cache:clear

## 

## \# Créer un nouveau contrôleur

## php bin/console make:controller

## 

## \# Créer une nouvelle entité

## php bin/console make:entity

## 

## \# Générer une migration

## php bin/console make:migration

## 

## \# Exécuter les migrations

## php bin/console doctrine:migrations:migrate

## 

## BASE DE DONNÉES

## ---------------

## \# Vérifier le schéma

## php bin/console doctrine:schema:validate

## 

## \# Mettre à jour le schéma (développement uniquement)

## php bin/console doctrine:schema:update --force

## 

## \# Afficher les requêtes SQL d'une migration

## php bin/console doctrine:migrations:execute --up --dry-run

## 

## ================================================================================

## 10\. RÉSOLUTION DES PROBLÈMES

## ================================================================================

## 

## ERREUR DE CONNEXION À LA BASE DE DONNÉES

## -----------------------------------------

## Vérifiez que :

## \- MySQL/MariaDB est démarré

## \- Les identifiants dans .env sont corrects

## \- La base de données 'emusic' existe

## 

## ERREUR DE PERMISSIONS

## ---------------------

## \# Linux/Mac

## chmod -R 755 var/

## chmod -R 755 public/

## 

## \# Ou avec le propriétaire www-data (Apache)

## chown -R www-data:www-data var/ public/

## 

## CACHE CORROMPUE

## ---------------

## php bin/console cache:clear

## rm -rf var/cache/\*

## 

## ================================================================================

## 11\. CONTRIBUTEURS

## ================================================================================

## 

## \- ZakinaA - Développeur principal

## \- Nolann-Gueguen - Développeur

## \- clelong14 - Développeuse

## \- LiamDuval - Développeur

## \- CAussant - Développeur

## 

## ================================================================================

## 12\. CONTRIBUTION

## ================================================================================

## 

## Les contributions sont les bienvenues ! N'hésitez pas à :

## 

## 1\. Fork le projet

## 2\. Créer une branche pour votre fonctionnalité 

## &nbsp;  (git checkout -b feature/NouvelleFonctionnalite)

## 3\. Commit vos changements 

## &nbsp;  (git commit -m 'Ajout d'une nouvelle fonctionnalité')

## 4\. Push vers la branche 

## &nbsp;  (git push origin feature/NouvelleFonctionnalite)

## 5\. Ouvrir une Pull Request

## 

## ================================================================================

## 13\. SUPPORT

## ================================================================================

## 

## Pour toute question ou problème, ouvrez une issue sur GitHub :

## https://github.com/ZakinaA/25notf0nd/issues

## 

## ================================================================================

## LICENCE

## ================================================================================

## 

## Ce projet est sous licence MIT - voir le fichier LICENSE pour plus de détails.

## 

## ================================================================================

## NOTE

## ================================================================================

## 

## Ce projet est développé dans un cadre pédagogique. 

## Les données de démonstration sont fictives.
