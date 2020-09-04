# Espace de développement Symfony avec Docker

Ce projet a pour but de simplifier la préparation
d'un espace de développement pour symfony.

Ce projet a été fait pour les étudiants de mon université dane le but
de simplifier la mise en route de leur projets tout en les introduisant
à Docker indirectement.

## Prérequis

- Une machine linux
- Docker
- docker-compose

## Installation

### Installer Docker

Suivez les tutoriels officiels listés ci-dessous en fonction de votre
version / distribution de Linux:

* Debian: https://docs.docker.com/engine/install/debian/
* CentOS: https://docs.docker.com/engine/install/centos/
* Fedora: https://docs.docker.com/engine/install/fedora/
* Ubuntu: https://docs.docker.com/engine/install/ubuntu/

### Installer docker-compose

Suivez le tutoriel proposé par le lien ci-dessous : 
https://docs.docker.com/compose/install/

### Téléchargez le dépôt

#### Méthode 1 : Git

Clonez simplement le dépôt avec la commande ci-dessous:

```shell
$ git clone https://github.com/yukiisbored/symfony-docker
```

#### Méthode 2 : Téléchargez l'archive

Lorsque vous êtes sur le dépôt GitHub, cliquez sur le bouton "Code"
à coté du bouton "ajouter un fichier", puis sur "Télécharger en ZIP."
Ensuite, extrayez le.

## Utilisation (important)

### Lancer le conteneur

pour lancer le conteneur, exécutez la commande :

```shell
$ docker-compose up -d
```

> **Note**
>
> L'argument `-d` signifie que docker-compose va créer un nouveau 
> daemon quand le conteneur sera lancé.

### Démarrer une console (shell)

Pour lancer une console dans le conteneur, exécutez la commande :

```shell
$ docker-compose exec app bash
```

## Notes Importantes

- Vos projets devront être placés dans le dossier `work`. Ce dossier
  est partagé avec le conteneur et l'hébergeur.
- Enregistrer vos projets dans `work` est important, sinon, vos projets
  seront ***<u>PERDUS !</u>***
- L'installateur du conteneur inclus aussi MySQL/MariaDB, accessible
  seulement depuis le conteneur. Le nom d'hôte sera `db` (et non pas 
  `localhost`).
- La base de données MySQL a un compte root dans mot de passe. 
  Dans le conteneur, `mysql` est préconfiguré pour se connecter 
  automatiquement en root a la base de données. 
