---
layout: post
status: publish
published: true
title: Linkindle - Affichez votre consommation électrique sur une liseuse
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
    Ça fonctionnerait sur une K4 ?
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
  content: Génial ! ?
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
    Je réessayerai à l'occasion — à mon avis le problème ne doit pas être très structurant, mais il risque tout de même d'être embêtant à trouver :/
- id: 681
  author: Récupérer les infos de votre compteur Linky – Cipher
    Bliss
  author_email: ''
  author_url: http://www.cipherbliss.com/recuperer-les-infos-de-votre-compteur-linky/
  date: '2018-01-26 11:48:20 +0000'
  date_gmt: '2018-01-26 10:48:20 +0000'
  content: "[…] source: https://outadoc.fr/2016/12/linkindle-courbe-conso-electrique-sur-liseuse/
    […]"
---
<p><em>Lorsque le compteur connecté Linky a été annoncé, ERDF (maintenant Enedis) s'est trouvée au coeur d'une controverse sur la vie privée et la collecte des données de la consommation électrique des français. Je ne chercherai pas ici à justifier ou condamner ses pratiques, mais je vais au moins vous montrer comment vous pouvez en profiter pour votre usage personnel. ?</em></p>
<p>Voulant garder un oeil sur ma consommation électrique durant l'hiver tout en profitant des données maintenant fournies directement par Enedis, j'ai créé le projet Linkindle.</p>
<p>[caption id="attachment_1143" align="aligncenter" width="700"]<a href="https://outadoc.fr/wp-content/uploads/2016/12/IMG_20161204_190043.jpg" rel="attachment wp-att-1143"><img src="https://outadoc.fr/wp-content/uploads/2016/12/IMG_20161204_190043-768x576.jpg" alt="linkindle" width="700" height="525" class="size-medium_large wp-image-1143" /></a> Linkindle, fini et accroché au mur[/caption]</p>
<p>L'afficheur est accroché au mur de mon appartement et allumé en permanence. Grâce à l'écran e-ink de la Kindle, la batterie devrait tenir des semaines sans nécessiter de recharge. L'histogramme est mis à jour une fois par jour.</p>
<p>D'un point de vue technique, les graphiques sont <strong>générés une fois par jour</strong> <em>via</em> un <strong>script <code>cron</code></strong> qui tourne sur un <strong>serveur dédié</strong> (un simple Raspberry Pi fait l'affaire). Ils sont créés par un script Python et la bibliothèque matplotlib qui récupère traite les données d'Enedis, avant d'être mis à disposition sur un serveur web sur le réseau local.</p>
<p>La <strong>Kindle</strong> (une simple Kindle Basic suffit) a été <strong>jailbreakée</strong> et fait également tourner un script <code>cron</code> une fois par jour. Ce dernier <strong>récupère le graphique</strong> sur le serveur web et l'affiche.</p>
<p>Allez, on rentre dans les détails ! Tout est open-source, donc avec un peu d'huile de coude et de matériel vous pouvez avoir <strong>la même chez vous</strong>. ?</p>
<h2>Comment faire ?</h2>
<h3>Prérequis</h3>
<p>Pour commencer, et c'est important à préciser, il va vous falloir un compteur Linky activé. L'installation est une première étape, mais vous devrez attendre jusqu'à plusieurs mois avant de recevoir un courrier de la part d'Enedis vous confirmant l'activation du compteur.</p>
<p>Vous devrez ensuite demander sur leur site web la création d'un compte personnel lié au compteur, une opération qui peut encore prendre plusieurs jours. Après ça, vous êtes prêts ! Vérifiez que vous avez bien accès aux données sur votre espace personnel.</p>
<p>En ce qui concerne le Kindle, n'importe lequel devrait faire l'affaire ; vérifiez simplement qu'il peut être jailbreaké avant de dépenser des dizaines d'euros dans une brique. Et notez que vous ne pouvez pas économiser 10€ en achetant la version avec les offres spéciales : j'ai testé, et ça ne fonctionne pas. ? Si toutefois vous avez fait cette erreur, vous pouvez désactiver ces dernières depuis <a href="https://www.amazon.fr/mycd">le site d'Amazon</a>.</p>
<h3>Côté serveur</h3>
<p>Le côté serveur sera le plus simple à configurer. Vous pouvez commencer par récupérer le projet <a href="https://github.com/outadoc/linkindle/">sur Github</a>. Installez les dépendances. Sur une Debian :</p>
<pre><code>$ apt-get install python3 pip3 python3-numpy python3-matplotlib python3-requests python3-dateutil python3-tk texlive texlive-latex-extra texlive-fonts-recommended dvipng imagemagick
</code></pre>
<p>Mettez ensuite en place un serveur web quelconque. Apache fait très bien l'affaire.</p>
<p>Dans le répertoire du projet, éditez le fichier <code>gen_graphs.sh</code> et ajoutez votre identifiant et mot de passe Enedis dans les variables respectives. Remplacez la valeur de <code>OUT_DIR</code> par un dossier accessible depuis votre serveur web. Attention aux permissions !</p>
<p>Vous pouvez tester l'exécution du script avec cette simple commande :</p>
<pre><code>$ ./gen_graphs.sh
</code></pre>
<p>Enfin, on pourra mettre en place une tâche <code>cron</code> pour récupérer les données quotidiennement.</p>
<pre><code>$ crontab -e

# m h  dom mon dow   command
0 5 * * * /home/iot/linkindle/gen_graphs.sh
</code></pre>
<p>Remplacez bien sûr <code>/home/iot/linkindle/</code> par le répertoire du projet. Le script sera ainsi appelé tous les jours à 5h du matin.</p>
<h3>Côté Kindle</h3>
<p>Cette partie étant un peu plus délicate (il est assez rare d'être "expert(e) en jailbreak de Kindle" ?) et moins bien documentée, je vais essayez de la découper en plusieurs parties.</p>
<p>Gardez en tête que ce tutoriel a été écrit en 2016. La méthode de jailbreak peut avoir changé si vous lisez ça dans le futur. Faites attention à ce que vous faites, je ne suis pas responsable de ce que <em>vous</em> faites avec <em>votre</em> matériel ! Si vous avez des problèmes, n'hésitez pas à laisser un commentaire.</p>
<h4>Jailbreak</h4>
<p>Commencez par identifier le modèle de votre Kindle <a href="http://wiki.mobileread.com/wiki/Kindle_Serial_Numbers">grâce à cette page</a>.</p>
<p>La faille utilisée pour le jailbreak des Kindle les plus récentes n'est plus présente dans les dernières versions de leur firmware. Vous allez donc devoir downgrader votre appareil dans une version supportée en suivant à la lettre les instructions de <a href="http://www.mobileread.com/forums/showthread.php?t=275877">ce thread</a>.</p>
<p>Les outils que j'ai utilisé proviennent du forum et wiki MobileRead. Après avoir cherché pendant <em>longtemps</em> la source de certaines erreurs, j'ai découvert qu'il existe <a href="http://www.mobileread.com/forums/showthread.php?t=225030"><strong>une</strong> page depuis laquelle tout télécharger</a>. C'est la seule à avoir les versions les plus récentes de tous les outils. Considérez-la comme votre Bible à partir de maintenant.</p>
<h4>KUAL (Kindle Universal Application Launcher)</h4>
<p>Téléchargez KUAL depuis la page des snapshots, puis glissez le fichier <code>.azw2</code> adapté dans le dossier <code>documents</code> à la racine de votre Kindle. Vérifiez que vous avez une nouvelle entrée dans la liste des livres sur la Kindle. Ce hack est une interface qui vous permettra de lancer simplement un tas d'extensions, dont celles qui nous intéressent.</p>
<p><a href="http://www.mobileread.com/forums/showthread.php?t=203326">Thread principal</a></p>
<h4>MobileRead Package Installer</h4>
<p>Pour pouvoir installer des packages sur les versions récentes du firmware des Kindle, vous aurez besoin de MobileRead Package Installer (ou mrpi). Installez simplement le répertoire téléchargé dans le dossier <code>extensions</code> à la racine du Kindle.</p>
<p><a href="http://www.mobileread.com/forums/showthread.php?t=251143">Thread principal</a></p>
<h4>Screensaver hack</h4>
<p>Le screensaver hack (ou linkss) permet de remplacer les fonds d'écran par défaut de la Kindle par n'importe quelle image au bon format. On va s'en servir pour afficher les images de nos histogrammes !</p>
<p>Pour l'installer, glissez les fichiers <code>*.bin</code> nécessaires dans le dossier racine de votre Kindle (y compris Python 2.7, qui est également fourni, et qui est une dépendance). Ensuite, ouvrez KUAL, puis sélectionnez MR Package Installer et lancez l'installation.</p>
<p>[caption id="attachment_1157" align="aligncenter" width="700"]<a href="https://outadoc.fr/wp-content/uploads/2016/12/IMG_20161125_183232.jpg" rel="attachment wp-att-1157"><img src="https://outadoc.fr/wp-content/uploads/2016/12/IMG_20161125_183232-768x576.jpg" alt="python sur kindle" width="700" height="525" class="size-medium_large wp-image-1157" /></a> Installons Python tranquillement[/caption]</p>
<p><a href="http://www.mobileread.com/forums/showthread.php?t=195474">Thread principal</a></p>
<h4>Online Screensaver</h4>
<p>Dernier morceau de magie pour donner vie à notre bidouille : l'extension Online Screensaver, qui va se charger de récupérer notre image, depuis notre serveur web, à intervalles définies préalablement. Sans cette extension, les scripts <code>cron</code> ne fonctionnent pas correctement, et le mode veille de la Kindle interfère avec le réseau.</p>
<p>Téléchargez l'extension <a href="http://www.mobileread.com/forums/showthread.php?t=236104">depuis cette page</a> et placez-la dans le dossier <code>extensions</code> à la racine de votre Kindle. Il vous faudra ensuite la configurer en modifiant le fichier <code>onlinescreensaver/bin/config.sh</code> pour y insérer l'URL du graphe que vous voulez afficher et la fréquence de rafraîchissement.</p>
<h4>Testons !</h4>
<p>Et voilà, tout devrait être configuré correctement. Faites un test en lançant une mise à jour du screensaver depuis KUAL > Online Screensaver. Essayez de redémarrer la Kindle, et boum, ça devrait être bon ! ?</p>
<p>[caption id="attachment_1160" align="aligncenter" width="700"]<a href="https://outadoc.fr/wp-content/uploads/2016/12/IMG_20161204_205043.jpg" rel="attachment wp-att-1160"><img src="https://outadoc.fr/wp-content/uploads/2016/12/IMG_20161204_205043-768x576.jpg" alt="kindle au mur" width="700" height="525" class="size-medium_large wp-image-1160" /></a> o/[/caption]</p>
<h2>Comment ça marche ?</h2>
<h3>Côté serveur</h3>
<p>Pour récupérer les données de consommation électriques, j'ai du faire un reverse-engineering léger du site d'Enedis. Il se trouve qu'ils fournissent aux utilisateurs connectés un fichier JSON assez complet et simple à utiliser, paramétrable par date de début et de fin. L'authentification se fait classiquement par un appel à une page de login et la conservation d'un cookie de session.</p>
<p>Vous pouvez retrouver la partie de récupération des données brutes (et la réutiliser dans un autre projet si tel est votre désir !) dans le module Python <code>linky.py</code>.</p>
<p>La génération des histogrammes est réalisée par <code>linky_plot.py</code>. J'utilise <code>matplotlib</code> et le module LaTeX pour réaliser de beaux graphiques. Ce script appelle directement le module décrit précédemment.</p>
<p>Enfin, le point d'entrée "normale" est le fichier <code>gen_graphs.sh</code>, dans lequel est appelé le script Python 3, mais également l'outil <code>imagemagick</code>, qui est <strong>hyper important</strong> pour la génération d'images adaptées à l'écran de la Kindle. Un paramètre incorrect, et les résultats seront inutilisables.</p>
