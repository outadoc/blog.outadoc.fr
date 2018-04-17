---
layout: post
status: publish
published: true
title: API Freebox TV - Une API pour Freeteuse
author: outadoc
author_login: outadoc
author_email: outadoc@gmail.com
author_url: https://outadoc.fr
date: '2011-06-25 21:38:08 +0100'
date_gmt: '2011-06-25 20:38:08 +0100'
categories:
- Tutos
- Technologeek
tags:
- free
- freebox
- freestance
- api
comments:
- id: 280
  author: zab
  author_email: zb2256@gmail.com
  author_url: ''
  date: '2011-09-21 15:05:43 +0100'
  date_gmt: '2011-09-21 14:05:43 +0100'
  content: Bonjour, sais-tu où on peut trouver la documentation officielle
    des API publiques de la Freebox (pour la télécommande, mais aussi
    pour la seedbox, pour le journal d'appels, etc...) ?
- id: 281
  author: outadoc
  author_email: admin@outadoc.fr
  author_url: http://outadoc.fr
  date: '2011-09-21 15:53:11 +0100'
  date_gmt: '2011-09-21 14:53:11 +0100'
  content: Je ne sais pas du tout... par contre, si tu as une piste, ça m'intéresse
    ! ;)
- id: 290
  author: sebclick
  author_email: contact@freebox-v6.fr
  author_url: http://www.freebox-v6.fr
  date: '2011-09-29 20:20:03 +0100'
  date_gmt: '2011-09-29 19:20:03 +0100'
  content: Bonjour, concernant la V6, il n'existe pas de doc officielle des API (en
    tout cas, pas à l'heure actuelle...)
- id: 512
  author: gmat
  author_email: forfortour4@gmail.com
  author_url: http://secretsdugmat.tumblr.com/
  date: '2012-11-26 05:41:49 +0000'
  date_gmt: '2012-11-26 04:41:49 +0000'
  content: slt ^^ interessant l'billet :D
---
Si vous vous demandez comment fonctionnent des programmes comme [FreeStance][1] pour communiquer avec votre Freebox sans fil, cet article est là pour vous l'expliquer ! Free a tout simplement développé une API complètement libre et très, très simple d'utilisation.  
![](https://outadoc.fr/wp-content/uploads/2011/06/Freebox-Revolution-V61.jpg "Freebox-Revolution-V6")

Elle vous permet en fait de simuler un appui sur une des touches de la télécommande de n'importe quelle Freebox sur le réseau. Tout ça via un simple appel d'URL ! Vous pouvez donc par exemple, changer de chaîne directement par votre navigateur en tapant une adresse spécifique, ou via wget, ou n'importe quel programme ou librairie supportant un appel d'URL tout bête.

L'URL est de la forme suivante : http://hd1.freebox.fr/pub/remote_control?code=xxxxxxxx&key=xxx&long=true&repeat=5

Le sous-domaine (virtuel) de freebox.fr désigne le boitier à contrôler. Si vous souhaitez contrôler le boitier n°1, il faudra écrire hd1, pour le boitier n°2, hd2, etc.

La variable "code" contient le code de la Freebox à contrôler. C'est un nombre à 8 chiffres que vous trouverez dans les paramètres de la Freebox.

La variable "key" contient la touche dont vous souhaitez simuler l'appui. Voici la liste de celles-ci :

-   *power* : la touche rouge on/off
-   *list* : la touche d’affichage de la liste des chaînes entre power et tv
-   *tv* : la touche verte TV de commutation péritel
-   *0 à 9* : les touches numériques
-   *back* : la touche jaune en dessous du 7
-   *swap* : la touche en dessous du 9
-   *info, mail, help, pip* : les touches bleues à droite des numéros de chaîne
-   *epg, media, options* : les fonctionnalités "secondaires" de ces mêmes touches
-   *vol\_inc, vol\_dec* : volume+ et volume-
-   *prgm\_inc, prgm\_dec* : chaîne suivante/précédente
-   *ok* : touche OK
-   *up, right, down, left* : les touches directionnelles entourant le OK
-   *mute* : la touche "muet"
-   *home* : la touche Free
-   *rec* : la touche d’enregistrement
-   *bwd* : la touche de retour en arrière (<<)
-   *prev* : la touche "précédent" (|<<)
-   *play* : la touche lecture/pause
-   *fwd* : la touche d’avance rapide (>>)
-   *next* : la touche "suivant" (>>|)
-   *red* : le bouton rouge (B)
-   *green* : le bouton vert (A)
-   *yellow* : le bouton jaune (Y)
-   *blue* : le bouton bleu (X)

(Source : [universfreebox.com][2])

La variable "long", quant à elle, spécifie comme son nom l'indique si l'appui du bouton doit être long ou court. Si elle vaut false ou n'est pas spécifiée, l'appui sera considéré comme court.

Pour finir, le contenu de la variable "repeat" est le nombre de fois que sera répété l'appui sur la touche de la télécommande. Il est peu utilisé et facultatif.

Et voilà ! Plus qu'à appeler l'URL, et votre Freebox réagit ! Pratique pour les farces... entre autres :D

[1]: http://dev.outadoc.fr/project/freestance/
[2]: http://universfreebox.com
