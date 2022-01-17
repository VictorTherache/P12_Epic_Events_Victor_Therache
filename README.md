# Epic Events API
## Table des matières
1. [Informations générales](#general-info)
2. [Bibliothèques utilisés](#technologies)
3. [Guide d'installation](#installation)

### Informations générales
***
Documentation de l'API d'Epic Events et du fonctionnement de l'interface admin pour les 3 utilisateurs principaux : Gestion, Support et Vente ayant chacuns des autorisations et permissions spécifiques à leur rôle. Le but de l'API est de pouvoir gérer les évènements et les contrats et de faire le lien entre l'interface front-end et le back-end. 
Test de l'API effectués via Postman.

![Image text](https://i.ibb.co/ggvjNxx/epic-logo.png)
## Technologies
***
Bibliothèques utilisés :
* [Python 64bit](https://www.python.org/downloads/release/python-391/): Version 3.9.1
* [Django](https://www.djangoproject.com/)
* [djangorestframework](https://www.django-rest-framework.org/)
* [djangorestframework-simplejwt](https://django-rest-framework-simplejwt.readthedocs.io/en/latest/)

## Guide d'installation
***
Pour utilisé l'API et effecuté les requêtes HTTP: 

```
Sur Windows : 
$ git clone https://github.com/VictorTherache/P12_Epic_Events_Victor_Therache.git
$ cd P12_Epic_Events_Victor_Therache
```
Activez l'environnement virtuel 
```
$ pip install virtualenv
$ python -m venv venv
$ venv\Scripts\activate
```
Créez une base de données Postgresql
```
$ Téléchargez postgresql (https://www.postgresql.org/download/)
$ Ouvrez pgAdmin 4 et créez une base de données avec pour Nom : P12 et User : postgres
$ Choisissez un mot de passe
$ Ouvrez le fichier settings.py
$ Remplacez le mot de passe de "DATABASES = {..." par celui que vous venez de définir
$ Lancez le serveur
```
Puis: 
```
$ pip3 install -r requirements.txt 
$ python manage.py makemigrations
$ python manage.py migrate
$ python manage.py runserver
```
```
Sur Linux/Mac : 
$ git clone https://github.com/VictorTherache/P12_Epic_Events_Victor_Therache.git
$ cd P12_Epic_Events_Victor_Therache
$ source env/Scripts/activate
$ pip3 install -r requirements.txt 
$ python manage.py makemigrations
$ python manage.py migrate
$ python manage.py runserver
```
***
Pour utiliser l'interface graphique : 
```
$ python manage.py runserver
$ http://127.0.0.1:8000/epiceventadmin/login/
```
