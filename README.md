# E-Music — Gestion d'École de Musique

Application web complète de gestion administrative et pédagogique pour les écoles de musique, développée avec **Symfony 6**.

---

## Sommaire

- [Présentation](#présentation)
- [Prérequis](#prérequis)
- [Installation](#installation)
- [Démarrage](#démarrage)
- [Comptes de test](#comptes-de-test)
- [Commandes utiles](#commandes-utiles)
- [Auteurs](#auteurs)

---

## Présentation

E-Music centralise toutes les activités d'une école de musique :

- Gestion des adhérents et des inscriptions
- Suivi pédagogique
- Administration des cours et plannings
- Gestion des rôles (Admin, Gestionnaire, Adhérent)

---

## Prérequis

| Outil | Version minimale |
|---|---|
| PHP | >= 8.1 |
| Symfony | 6.x |
| Composer | Dernière stable |
| Base de données | MySQL ou MariaDB |
| Serveur web | Apache ou Nginx |

---

## Installation

### 1. Cloner le projet

```bash
git clone https://github.com/ZakinaA/25notf0nd.git
cd 25notf0nd
```

### 2. Installer les dépendances

```bash
composer install
```

### 3. Configurer la base de données

Modifiez le fichier `.env` avec vos paramètres :

```env
DATABASE_URL="mysql://root:@127.0.0.1:3307/emusic?serverVersion=10.11.2-MariaDB&charset=utf8mb4"
```

### 4. Initialiser la base de données

```bash
php bin/console doctrine:database:create
php bin/console doctrine:migrations:migrate
```

---

## Démarrage

```bash
symfony server:start
```

### Accès depuis le réseau local

```
http://172.20.177.13/accueil
```

### Login/mot de passe conteneur
root / mpsymfony

---

## Comptes de test

| Rôle | Email | Mot de passe |
|---|---|---|
| Admin | admin@gmail.com | admin |
| Gestionnaire | gestionnaire@gmail.com | gestionnaire |
| Adhérent | adherent@gmail.com | adherent |

> Ces comptes sont réservés aux environnements de développement et de test. Ne pas utiliser en production.

---

## Commandes utiles

```bash
# Appliquer les migrations
php bin/console doctrine:migrations:migrate

# Démarrer le serveur de développement
symfony server:start

# Créer une nouvelle entité
php bin/console make:entity

# Vider le cache
php bin/console cache:clear

# Lister les routes disponibles
php bin/console debug:router
```

---

## Stack technique

- **Backend** : PHP 8.1, Symfony 6
- **Base de données** : MySQL / MariaDB
- **Frontend** : HTML, CSS, JavaScript
- **Gestionnaire de dépendances** : Composer
- **Infrastructure** : Proxmox (LXC / VM)

---

## Version

**Dernière version :** 1.0

---

## Auteurs

| Pseudo | Rôle |
|---|---|
| [Nolann-Gueguen](https://github.com/Nolann-Gueguen) | Développeur |
| [clelong14](https://github.com/clelong14) | Développeuse |
| [LiamDuval](https://github.com/LiamDuval) | Développeur |
| [CAussant](https://github.com/CAussant) | Développeur |
| [ZakinaA](https://github.com/ZakinaA) | Développeuse |
