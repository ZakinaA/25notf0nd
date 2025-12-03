# 25NotF0nd - E-Music

E-Music est une application web de gestion complète pour les écoles de musique, développée avec Symfony. Elle permet de centraliser toutes les activités administratives et pédagogiques.

### Pré-requis

- PHP >= 8.1 ou supérieure
- Symfony 6.x
- Composer
- Base de données MySQL ou MariaDB
- Serveur web (Apache/Nginx)

## Installation

### Cloner le projet

``git clone https://github.com/ZakinaA/25notf0nd.git``
<br>
``cd 25notf0nd``

### Modifiez les paramètres de connexion à la base de données dans .env

``DATABASE_URL="mysql://root:@127.0.0.1:3307/emusic?serverVersion=10.11.2-MariaDB&charset=utf8mb4"``

## Installer les dépendances

``composer install``
<br>
``php bin/console doctrine:database:create``
<br>
``php bin/console doctrine:migrations:migrate``

## Démarrage

``symfony server:start``

## Commandes utiles

- ``php bin/console doctrine:migrations:migrate`` → Appliquer les migrations
- ``symfony server:start`` → Démarrer le serveur local
- ``php bin/console make:entity`` → Créer une nouvelle entité

## Résolution des problèmes

- Vérifier les logs Symfony (var/log/dev.log)
- Vérifier la configuration de la base de données
- S’assurer que les permissions des dossiers sont correctes (var, vendor)

## Fabriqué avec

- PHP, Symfony
- MySQL/MariaDB
- HTML, CSS, JavaScript
- Composer pour la gestion des dépendances

## Versions

**Dernière version :** 1.0

## Auteurs
- Nolann-Gueguen - Développeur
- clelong14 - Développeuse
- LiamDuval - Développeur
- CAussant - Développeur

