# Carabistouilles.cpp

Les petites crabistouilles en C++

Certains programmes sont en C d'autre en C++ pour les faire fonctionner il faut `gcc` ou `g++`,
petit guide d'installation pour débutant :

### Windows

La methode la plus simple sur Windows pour installer gcc et g++ est l'installateur de packet [MinGW](https://sourceforge.net/projects/mingw/)

Une fois MinGW installé il sufit de rajouté les packets gcc qui s'appel `mingw32-gcc` `The GNU C Compiler`

Et pour g++ c'est la meme chose `mingw32-gcc-g++` `The GNU C++ Compiler`

Ensuite il faut rajouté le répertoire `\bin` de MinGW dans les variables d'environement pour pouvoir utiliser la commande `gcc` et `g++`

Marche a suivre : `Système > Paramètres avancés du système > Variables d'environnement > PATH` 

Et ensuite ajouter le chemain de l'installation de MinGW : `C:\MinGW\bin`

Pour verifier que tout marche : `gcc -v` ou `g++ -v`

### Ubuntu / Debian based

Pour GNU Linux c'est plus simple il sufit d'installer les packets `gcc` ou `g++` via apt

```bash
apt update
```
```bash
apt install gcc
```
```bash
apt install g++
```
