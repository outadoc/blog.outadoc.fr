---
layout: post
status: publish
published: true
title: Animate - Changer le boot logo de votre iPhone
author: outadoc
author_login: outadoc
author_email: outadoc@gmail.com
author_url: https://outadoc.fr
date: '2011-02-09 15:18:30 +0000'
date_gmt: '2011-02-09 14:18:30 +0000'
categories:
- Tutos
- Technologeek
- Geekeries
tags:
- greenpois0n
- chronic dev team
- boot logo
comments: []
---
Bonne nouvelle ! La Chronic Dev Team vient de sortir son nouvel outil, Animate, qui permet de modifier le boot logo de son iPod touch ou iPhone jailbreaké avec le dernier GreenPois0n.  
![](https://outadoc.fr/wp-content/uploads/2011/02/cdev_logo1.png "cdev_logo")

Il est normalement disponible dans Cydia; sinon, il vous faudra l'installer en tapant les commandes suivantes par SSH:

> su  
> votremotdepasse (par défaut, "alpine"; il est normal qu'il ne s'affiche pas)  
> apt-get install org.chronic-dev.animate  
> mkdir /Library/BootLogos  
> chown -R mobile:mobile /Library/BootLogos/  
> respring

Et vous aurez comme par magie un panneau "BootLogo" dans les réglages. :) Par défaut, vous ne pouvez qu'utiliser soit [le logo installé par GreenPois0n][1], soit le logo Apple d'origine.

Vous pouvez ensuite créer vos propres boot logos ! Beaucoup devraient arriver très bientôt sur Cydia, mais pas besoin d'attendre aussi longtemps... Commencez par télécharger le boot logo d'origine (vous pouvez également partir d'une feuille blanche):[][2]

[![](https://outadoc.fr/wp-content/uploads/2011/02/logo-200x3001.png "logo")][3]

Modifiez-le comme vous le souhaitez, et nommez-le "0.png". Et là où ça devient très intéressant, c'est qu'ils peuvent être animés ! :D Pas de façon très fluide pour le moment (environ 5 FPS: ils bossent dessus), mais c'est déjà ça. Il vous faudra créer plusieurs images de la même façon qu'au-dessus, en les nommant dans l'ordre d'apparition 0.png, 1.png, 2.png, etc...

Ensuite, créez un dossier du nom souhaité de votre logo dans /Library/BootLogos/. Puis, placez votre/vos image(s) dans ce dossier. Il ne vous reste plus qu'à retourner dans Réglages -> BootLogo et à l'activer ! :D

Note: le boot logo d'origine apparaîtra toujours pendant les quelques premières secondes du démarrage.  
[![](https://outadoc.fr/wp-content/uploads/2011/02/PL_PID_1000000296-200x3001.png "PL_PID_1000000296")][4]

[1]: http://outadoc.fr/2011/02/greenpois0n-rc5-jailbreak-4-2-1-untethered/
[2]: https://outadoc.fr/wp-content/uploads/2011/02/logo1.png
[3]: https://outadoc.fr/wp-content/uploads/2011/02/logo1.png
[4]: https://outadoc.fr/wp-content/uploads/2011/02/PL_PID_10000002961.png