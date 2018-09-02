---
layout: post
status: publish
published: true
title: "Linkindle : Affichez votre consommation électrique sur une liseuse"
author: outadoc
author_login: outadoc
author_email: outadoc@gmail.com
author_url: https://outadoc.fr
wordpress_id: 1136
wordpress_url: https://outadoc.fr/?p=1136
date: '2016-12-04 21:10:05 +0000'
date_gmt: '2016-12-04 20:10:05 +0000'
categories:
- Tutos
- Technologeek
tags: []
comments:
- id: 675
  author: Papa bless
  author_email: goofster.gafster@protonmail.ch
  author_url: ''
  date: '2017-01-28 20:02:13 +0000'
  date_gmt: '2017-01-28 19:02:13 +0000'
  content: |-
    Super article, il faut absolument que je teste ça.
    Ça fonctionnerait sur une K4 ?
- id: 676
  author: outadoc
  author_email: outadoc@gmail.com
  author_url: https://outadoc.fr
  date: '2017-01-29 19:11:15 +0000'
  date_gmt: '2017-01-29 18:11:15 +0000'
  content: |-
    En principe ça fonctionnera sans souci sur n'importe quel Kindle, du moment qu'on peut le jailbreaker.<br />
    Il faudra juste ajuster les constantes GRAPH_WIDTH_IN, GRAPH_HEIGHT_IN, et GRAPH_DPI dans <code>linky_plot.py</code> si la résolution est différente.
- id: 677
  author: Papa bless
  author_email: goofster.gafster@protonmail.ch
  author_url: ''
  date: '2017-01-30 01:37:14 +0000'
  date_gmt: '2017-01-30 00:37:14 +0000'
  content: J'ai même pas eu besoin les changer, ça marche nickel.
- id: 678
  author: outadoc
  author_email: outadoc@gmail.com
  author_url: https://outadoc.fr
  date: '2017-01-30 15:30:01 +0000'
  date_gmt: '2017-01-30 14:30:01 +0000'
  content: Génial ! ?
- id: 679
  author: steph
  author_email: steph.marie@gmail.com
  author_url: ''
  date: '2017-04-10 13:27:16 +0100'
  date_gmt: '2017-04-10 11:27:16 +0100'
  content: |-
    Bonjour,
    La requête post de la fonction _get_data de linky.py me retourne un 301 Moved Permanently, pourtant le token récupéré dans la fonction login est bien valide.
    J'ai vérifié sur le site enedis, les paramètres/payload/cookie n'ont pas changé, la seul différence c'est qu'ils utilisent une url en *.enedis.fr/* au lieu de *.erdf.fr/* mais ça change rien.
    Une idée d'où peut venir le problème?
    Merci.
- id: 680
  author: outadoc
  author_email: outadoc@gmail.com
  author_url: ''
  date: '2017-04-13 23:35:54 +0100'
  date_gmt: '2017-04-13 21:35:54 +0100'
  content: |-
    Hello,
    J'ai en effet remarqué le problème il y a environ un mois, mais je n'ai pas trouvé de solution sur le coup et je n'ai pas vraiment eu le temps d'approfondir depuis.
    Je réessayerai à l'occasion — à mon avis le problème ne doit pas être très structurant, mais il risque tout de même d'être embêtant à trouver :/
- id: 681
  author: Récupérer les infos de votre compteur Linky – Cipher
    Bliss
  author_email: ''
  author_url: http://www.cipherbliss.com/recuperer-les-infos-de-votre-compteur-linky/
  date: '2018-01-26 11:48:20 +0000'
  date_gmt: '2018-01-26 10:48:20 +0000'
  content: "[…] source: {{ site.baseurl }}/2016/12/linkindle-courbe-conso-electrique-sur-liseuse/
    […]"
---
Lorsque le compteur connecté Linky a été annoncé, ERDF (maintenant Enedis) s'est trouvée au coeur d'une controverse sur la vie privée et la collecte des données de la consommation électrique des français. Je ne chercherai pas ici à justifier ou condamner ses pratiques, mais je vais au moins vous montrer comment vous pouvez en profiter pour votre usage personnel.&nbsp;😉

Voulant garder un oeil sur ma consommation électrique durant l'hiver tout en profitant des données maintenant fournies directement par Enedis, j'ai créé le projet Linkindle.

[![linkindle]({{ site.baseurl }}/assets/IMG_20161204_190043-768x576.jpg "Linkindle, fini et accroché au mur")][1]

L'afficheur est accroché au mur de mon appartement et allumé en permanence. Grâce à l'écran e-ink de la Kindle, la batterie devrait tenir des semaines sans nécessiter de recharge. L'histogramme est mis à jour une fois par jour.

D'un point de vue technique, les graphiques sont **générés une fois par jour** *via* un **script `cron`** qui tourne sur un **serveur dédié** (un simple Raspberry Pi fait l'affaire). Ils sont créés par un script Python et la bibliothèque matplotlib qui récupère traite les données d'Enedis, avant d'être mis à disposition sur un serveur web sur le réseau local.

La **Kindle** (une simple Kindle Basic suffit) a été **jailbreakée** et fait également tourner un script `cron` une fois par jour. Ce dernier **récupère le graphique** sur le serveur web et l'affiche.

Allez, on rentre dans les détails ! Tout est open-source, donc avec un peu d'huile de coude et de matériel vous pouvez avoir **la même chez vous**. 👌

## Comment faire ?

### Prérequis

Pour commencer, et c'est important à préciser, il va vous falloir un compteur Linky activé. L'installation est une première étape, mais vous devrez attendre jusqu'à plusieurs mois avant de recevoir un courrier de la part d'Enedis vous confirmant l'activation du compteur.

Vous devrez ensuite demander sur leur site web la création d'un compte personnel lié au compteur, une opération qui peut encore prendre plusieurs jours. Après ça, vous êtes prêts ! Vérifiez que vous avez bien accès aux données sur votre espace personnel.

En ce qui concerne le Kindle, n'importe lequel devrait faire l'affaire ; vérifiez simplement qu'il peut être jailbreaké avant de dépenser des dizaines d'euros dans une brique. Et notez que vous ne pouvez pas économiser 10€ en achetant la version avec les offres spéciales : j'ai testé, et ça ne fonctionne pas. 😒 Si toutefois vous avez fait cette erreur, vous pouvez désactiver ces dernières depuis [le site d'Amazon][2].

### Côté serveur

Le côté serveur sera le plus simple à configurer. Vous pouvez commencer par récupérer le projet [sur Github][3]. Installez les dépendances. Sur une Debian :

```bash
$ apt-get install python3 pip3 python3-numpy python3-matplotlib python3-requests python3-dateutil python3-tk texlive texlive-latex-extra texlive-fonts-recommended dvipng imagemagick
```

Mettez ensuite en place un serveur web quelconque. Apache fait très bien l'affaire.

Dans le répertoire du projet, éditez le fichier `gen_graphs.sh` et ajoutez votre identifiant et mot de passe Enedis dans les variables respectives. Remplacez la valeur de `OUT_DIR` par un dossier accessible depuis votre serveur web. Attention aux permissions !

Vous pouvez tester l'exécution du script avec cette simple commande :

```bash
$ ./gen_graphs.sh
```

Enfin, on pourra mettre en place une tâche `cron` pour récupérer les données quotidiennement.

```bash
$ crontab -e

# m h  dom mon dow   command
0 5 * * * /home/iot/linkindle/gen_graphs.sh
```

Remplacez bien sûr `/home/iot/linkindle/` par le répertoire du projet. Le script sera ainsi appelé tous les jours à 5h du matin.

### Côté Kindle

Cette partie étant un peu plus délicate (il est assez rare d'être "expert(e) en jailbreak de Kindle" 😶) et moins bien documentée, je vais essayez de la découper en plusieurs parties.

Gardez en tête que ce tutoriel a été écrit en 2016. La méthode de jailbreak peut avoir changé si vous lisez ça dans le futur. Faites attention à ce que vous faites, je ne suis pas responsable de ce que *vous* faites avec *votre* matériel ! Si vous avez des problèmes, n'hésitez pas à laisser un commentaire.

#### Jailbreak

Commencez par identifier le modèle de votre Kindle [grâce à cette page][4].

La faille utilisée pour le jailbreak des Kindle les plus récentes n'est plus présente dans les dernières versions de leur firmware. Vous allez donc devoir downgrader votre appareil dans une version supportée en suivant à la lettre les instructions de [ce thread][5].

Les outils que j'ai utilisé proviennent du forum et wiki MobileRead. Après avoir cherché pendant *longtemps* la source de certaines erreurs, j'ai découvert qu'il existe [**une** page depuis laquelle tout télécharger][6]. C'est la seule à avoir les versions les plus récentes de tous les outils. Considérez-la comme votre Bible à partir de maintenant.

#### KUAL (Kindle Universal Application Launcher)

Téléchargez KUAL depuis la page des snapshots, puis glissez le fichier `.azw2` adapté dans le dossier `documents` à la racine de votre Kindle. Vérifiez que vous avez une nouvelle entrée dans la liste des livres sur la Kindle. Ce hack est une interface qui vous permettra de lancer simplement un tas d'extensions, dont celles qui nous intéressent.

[Thread principal][7]

#### MobileRead Package Installer

Pour pouvoir installer des packages sur les versions récentes du firmware des Kindle, vous aurez besoin de MobileRead Package Installer (ou mrpi). Installez simplement le répertoire téléchargé dans le dossier `extensions` à la racine du Kindle.

[Thread principal][8]

#### Screensaver hack

Le screensaver hack (ou linkss) permet de remplacer les fonds d'écran par défaut de la Kindle par n'importe quelle image au bon format. On va s'en servir pour afficher les images de nos histogrammes !

Pour l'installer, glissez les fichiers `*.bin` nécessaires dans le dossier racine de votre Kindle (y compris Python 2.7, qui est également fourni, et qui est une dépendance). Ensuite, ouvrez KUAL, puis sélectionnez MR Package Installer et lancez l'installation.

[![python sur kindle]({{ site.baseurl }}/assets/IMG_20161125_183232-768x576.jpg "Installons Python tranquillement")][9]

[Thread principal][10]

#### Online Screensaver

Dernier morceau de magie pour donner vie à notre bidouille : l'extension Online Screensaver, qui va se charger de récupérer notre image, depuis notre serveur web, à intervalles définies préalablement. Sans cette extension, les scripts `cron` ne fonctionnent pas correctement, et le mode veille de la Kindle interfère avec le réseau.

Téléchargez l'extension [depuis cette page][11] et placez-la dans le dossier `extensions` à la racine de votre Kindle. Il vous faudra ensuite la configurer en modifiant le fichier `onlinescreensaver/bin/config.sh` pour y insérer l'URL du graphe que vous voulez afficher et la fréquence de rafraîchissement.

#### Testons !

Et voilà, tout devrait être configuré correctement. Faites un test en lançant une mise à jour du screensaver depuis KUAL > Online Screensaver. Essayez de redémarrer la Kindle, et boum, ça devrait être bon ! 😀

[![kindle au mur]({{ site.baseurl }}/assets/IMG_20161204_205043-768x576.jpg "o/")][12]

## Comment ça marche ?

### Côté serveur

Pour récupérer les données de consommation électriques, j'ai du faire un reverse-engineering léger du site d'Enedis. Il se trouve qu'ils fournissent aux utilisateurs connectés un fichier JSON assez complet et simple à utiliser, paramétrable par date de début et de fin. L'authentification se fait classiquement par un appel à une page de login et la conservation d'un cookie de session.

Vous pouvez retrouver la partie de récupération des données brutes (et la réutiliser dans un autre projet si tel est votre désir !) dans le module Python `linky.py`.

La génération des histogrammes est réalisée par `linky_plot.py`. J'utilise `matplotlib` et le module LaTeX pour réaliser de beaux graphiques. Ce script appelle directement le module décrit précédemment.

Enfin, le point d'entrée "normale" est le fichier `gen_graphs.sh`, dans lequel est appelé le script Python 3, mais également l'outil `imagemagick`, qui est **hyper important** pour la génération d'images adaptées à l'écran de la Kindle. Un paramètre incorrect, et les résultats seront inutilisables.

[1]: {{ site.baseurl }}/assets/IMG_20161204_190043.jpg
[2]: https://www.amazon.fr/mycd
[3]: https://github.com/outadoc/linkindle/
[4]: http://wiki.mobileread.com/wiki/Kindle_Serial_Numbers
[5]: http://www.mobileread.com/forums/showthread.php?t=275877
[6]: http://www.mobileread.com/forums/showthread.php?t=225030
[7]: http://www.mobileread.com/forums/showthread.php?t=203326
[8]: http://www.mobileread.com/forums/showthread.php?t=251143
[9]: {{ site.baseurl }}/assets/IMG_20161125_183232.jpg
[10]: http://www.mobileread.com/forums/showthread.php?t=195474
[11]: http://www.mobileread.com/forums/showthread.php?t=236104
[12]: {{ site.baseurl }}/assets/IMG_20161204_205043.jpg
