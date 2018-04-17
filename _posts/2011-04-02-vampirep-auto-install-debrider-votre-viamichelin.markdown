---
layout: post
status: publish
published: true
title: Vampirep Auto Install - Débrider votre ViaMichelin
author: outadoc
author_login: outadoc
author_email: outadoc@gmail.com
author_url: https://outadoc.fr
date: '2011-04-02 17:02:59 +0100'
date_gmt: '2011-04-02 16:02:59 +0100'
categories:
- Tutos
- Technologeek
tags:
- viamichelin
- gps
- windows ce
- vampirep
- débridage
comments:
- id: 515
  author: larbi
  author_email: larbi.hb@neuf.fr
  author_url: http://outadoc
  date: '2012-12-03 13:00:35 +0000'
  date_gmt: '2012-12-03 12:00:35 +0000'
  content: bonjour je cherche le logiciel VAMPIREP auto instal pour débrider
    mon viamiclin x 970-t je remercie toute personne qui peut m'aider voici mon adress
    larbi.hb@neuf.fr
- id: 516
  author: outadoc
  author_email: outadoc@me.com
  author_url: http://outadoc.fr
  date: '2012-12-03 20:32:05 +0000'
  date_gmt: '2012-12-03 19:32:05 +0000'
  content: J'ai ajouté un <a href="http://files.outadoc.fr/PackCompletVampirepGPSPassionV1-5.zip"
    rel="nofollow">lien de téléchargement</a> dans l'article. Bonne
    soirée ;)
- id: 541
  author: Irish coffee
  author_email: delagh@bbox.fr
  author_url: ''
  date: '2013-06-11 08:18:56 +0100'
  date_gmt: '2013-06-11 07:18:56 +0100'
  content: "Quelqu'un aurait-il une solution pour transformer la cartographie du ViaMichelin
    X970T\r\n(new edition)Europe en TomTom même seulement France ?Merci d'avance."
- id: 542
  author: Irish coffee
  author_email: delagh@bbox.fr
  author_url: ''
  date: '2013-06-11 08:24:07 +0100'
  date_gmt: '2013-06-11 07:24:07 +0100'
  content: "Peut-on installer VMNavigation PND 7.0.3 sans \"content manager\" sur
    ViaMichelin X970T\r\nMon Mail:delagh@bbox.fr\r\nMerci !"
- id: 547
  author: vand
  author_email: chris445@sfr.fr
  author_url: ''
  date: '2013-10-25 07:23:38 +0100'
  date_gmt: '2013-10-25 06:23:38 +0100'
  content: "Bonjour, \r\nJ'ai bien suivi à la lettre les explications pour
    mon GPS x960, j'obtiens bien la page vampirep, après installer, reset,
    je clic sur lancer Viamichelin, je vais sur la page viamichelin, mais après
    je ne peux plus rien faire , je ne peux pas faire fonctionner mon GPS  avec Vampirep.\r\nAvez-vous
    une solution merci d'avance ."
- id: 558
  author: etaix
  author_email: afxs.afxs@laposte.net
  author_url: ''
  date: '2014-07-04 20:10:46 +0100'
  date_gmt: '2014-07-04 19:10:46 +0100'
  content: pAREIL J'AI SUIVI PROCEDURE, ET JE ME RETROUVE sur vampire maislancer viamichelin
    veut pas. sos
---
Comme vous le savez peut-être, ViaMichelin a commercialisé des GPS sous sa marque, puis a annoncé l'arrêt de leur évolution quelques années plus tard. Ce qui signifie que désormais, non seulement ViaMichelin ne commercialise plus de GPS, mais plus grave pour les utilisateurs, il ne fournit **plus de mises à jour de cartes** ! Inadmissible selon certains (j'en fais partie). Heureusement, les GPS ViaMichelin sont basés sur Windows CE, ce qui permet de les débrider assez facilement. Le débridage est une opération consistant en le remplacement de fichiers sur la carte SD, qui autorisent ensuite l'accès au Windows sur l'appareil.

[![](https://outadoc.fr/wp-content/uploads/2011/04/ViaMichelin_X_970T-300x2341.jpg "ViaMichelin_X_970T")][1]

L'installation de Vampirep Auto Install (du pseudo de son créateur) permettra ensuite d'installer d'autres logiciels, comme des logiciels de randonnée, TomTom (jamais réussi pour ma part), ou même un lecteur audio/vidéo !

Attention :  je décline toute responsabilité en cas de problème causé par votre faute sur votre GPS. La garantie risque également d'être annulée. Le tutoriel n'est destiné qu'aux personnes les plus expérimentées.

-   Insérez la carte SD de votre GPS dans votre ordinateur
-   Faites une sauvegarde de son contenu : ça vous servira si vous devez enlever tout ça ensuite
-   [Téléchargez les fichiers d'installation de Vampirep][2], et décompressez-les
-   Sur la carte SD, renommez le dossier "InstallSD" en "InstallSDVM"
-   Copiez le contenu de l'archive décompressée précédemment à la racine de la carte
-   Réinsérez la carte dans le GPS et faites un hard reset
-   En utilisant l'explorateur sur votre GPS ou ActiveSync, déplacez `/Program Files/ViaMichelin` dans `/Storage Card/ApplisGPS` ; si `/Program Files/ViaMichelin` n'existe pas, exécutez `/Storage Card/InstallSDVM/InstallSD.exe` et réessayez
-   Dans Vampirep Auto Install (qui démarre au démarrage du GPS), cliquez sur "Installer", puis, lorsqu'il le demande, faites un soft reset

[![](https://outadoc.fr/wp-content/uploads/2011/04/TonioToulouse_4_VMTaskManager1.jpg "TonioToulouse_4_VMTaskManager")][3]

Et ça devrait être bon ! Utilisez Vampirep Auto Install pour lancer le logiciel de navigation ViaMichelin Navigator. VAI installe d'autres logiciels : faites-en le tour pour voir leurs fonctions.

[![](https://outadoc.fr/wp-content/uploads/2011/04/TonioToulouse_5_VMOzi1.jpg "TonioToulouse_5_VMOzi")][4]

Je vous conseille fortement de consulter ces pages sur les forums GpsPassion, ou d'autres que vous trouverez sur ce site : [Personnaliser le VM X930 V1.5][5], [Personnaliser le ViaMichelin X-970T New Edition.][6]

[1]: https://outadoc.fr/wp-content/uploads/2011/04/ViaMichelin_X_970T1.jpg
[2]: http://files.outadoc.fr/PackCompletVampirepGPSPassionV1-5.zip
[3]: https://outadoc.fr/wp-content/uploads/2011/04/TonioToulouse_4_VMTaskManager1.jpg
[4]: https://outadoc.fr/wp-content/uploads/2011/04/TonioToulouse_5_VMOzi1.jpg
[5]: http://www.gpspassion.com/forumsen/topic.asp?topic_id=59108
[6]: http://www.gpspassion.com/forumsen/topic.asp?TOPIC_ID=107964
