---
layout: post
status: publish
published: true
title: 'API Keolis Open Data : Récupérez les horaires des bus du réseau
  Keolis en temps réel'
author: outadoc
author_login: outadoc
author_email: outadoc@gmail.com
author_url: https://outadoc.fr
excerpt: "J'ai fait une découverte quelque-peu intriguante, il y a quelques temps,
  en passant au crible l'app officielle du réseau Twisto. Une URL était hard-codée,
  et pointait vers un sous-domaine de Keolis : timeo3.keolis.com.\r\n\r\nCette découverte
  m'a mis la puce à l'oreille; étant développeur de Twistoast, une application qui
  jusqu'ici analysait directement les données présentes sur le site officiel de Twisto
  afin de présenter une liste d'horaires dans une application native, j'étais plutôt
  bien placé pour savoir que Timeo est le petit nom donné au système d'horaires en
  temps réel du réseau de bus de Caen. Et pas seulement, apparemment.\r\n\r\nEn effet,
  en fouillant un peu plus sur les Internets à propos de cette URL, je suis tombé
  sur un document fort intéressant sur Pastebin, documentant quelques fonctions de
  ce qui semble être une API permettant de récupérer les horaires en temps réel de
  *tous* les bus du réseau Keolis, en gros.\r\n\r\nJ'ai donc commencé à l'étudier
  et à la documenter de la manière la plus exhaustive possible, afin de la rendre
  accessible au public, et l'ai publiée sur <a href=\"https://gist.github.com/outadoc/40060db45c436977a912/\">un
  Gist</a>. Cet article vient en complément du Gist, pour donner un peu de background
  à l'histoire et peut-être quelques précisions techniques, si jamais vous souhaitez
  vous servir des données."
date: '2014-11-09 22:41:52 +0000'
date_gmt: '2014-11-09 21:41:52 +0000'
categories:
- Non classé
tags: []
comments:
- id: 671
  author: Neveu
  author_email: joseph.neveu@normandnet.fr
  author_url: ''
  date: '2016-07-16 16:24:22 +0100'
  date_gmt: '2016-07-16 14:24:22 +0100'
  content: 'xml=4 donne les messages : travaux ou arrêts non désservis
    ou déplacés…'
- id: 672
  author: outadoc
  author_email: outadoc@gmail.com
  author_url: https://outadoc.fr
  date: '2016-07-16 19:12:51 +0100'
  date_gmt: '2016-07-16 17:12:51 +0100'
  content: Bien vu, merci !
---
J'ai fait une découverte quelque-peu intriguante, il y a quelques temps, en passant au crible l'app officielle du réseau Twisto. Une URL était hard-coded, et pointait vers un sous-domaine de Keolis : **timeo3.keolis.com**.

[![Logo_Keolis_Groupe_0]({{ site.baseurl }}/assets/Logo_Keolis_Groupe_0-1024x2351.png "La boîte qui vous permet d'aller au boulot quand le tram n'est pas en panne.")][1]

Cette découverte m'a mis la puce à l'oreille; étant développeur de Twistoast, une application qui jusqu'ici analysait directement les données présentes sur le site officiel de Twisto afin de présenter une liste d'horaires dans une application native, j'étais plutôt bien placé pour savoir que Timeo est le petit nom donné au système d'horaires en temps réel du réseau de bus de Caen. Et pas seulement, apparemment.

En effet, en fouillant un peu plus sur les Internets à propos de cette URL, je suis tombé sur un document fort intéressant sur Pastebin, documentant quelques fonctions de ce qui semble être une API permettant de récupérer les horaires en temps réel de *tous* les bus du réseau Keolis, en gros.

J'ai donc commencé à l'étudier et à la documenter de la manière la plus exhaustive possible, afin de la rendre accessible au public, et l'ai publiée sur [un Gist][2]. Cet article vient en complément du Gist, pour donner un peu de background à l'histoire et peut-être quelques précisions techniques, si jamais vous souhaitez vous servir des données.

# Twistoast, avant

Twistoast est née il y a environ un an, comme un simple projet pour m'initier à Android. Je venais de commander une montre Pebble, et je voulais pouvoir accéder aux horaires des bus Twisto en temps réel depuis celle-ci, étant un utilisateur régulier de leur service pour aller étudier. J'ai eu beau chercher, et chercher, et chercher, je ne trouvais pourtant aucun moyen de récupérer ces horaires en temps réel autre que leur site web; leurs applications officielles utilisent des WebViews, et aucune API ne semble disponible.

J'ai ainsi commencé à étudier le fonctionnement de Timéo, le système utilisé par Twisto pour fournir ces données et les rendre disponibles à l'utilisateur final, dont l'interface a été développée par Actigraph, un contracteur [vraisemblablement expérimenté dans le domaine][3], qui gère également un bon nombre des sites web de Keolis, et probablement une bonne partie de leur backend.

Après de longues heures passées sur le sujet, je termine plus ou moins le développement d'une [API en PHP][4] me permettant de récupérer simplement tout ce dont j'ai besoin pour récupérer les horaires des bus Twisto en temps réel. Elle me donne alors grande satisfaction, et même si elle souffre encore de nombreux bugs (que je résoudrai au fil du temps), je commence à bosser sur la partie client de l'app Android qui deviendra Twistoast.

Pas grand-chose à raconter ici. J'ai beaucoup appris sur le développement Android grâce à cette app, et j'ai enfin eu accès aux horaires des bus Twisto sur ma montre. HUGE SUCCESS!

# Keolis et l'Open Data

Retour au présent. Vers la fin de l'été dernier, je suis donc tombé sur cette API magique, directement disponible sur un sous-domaine de Keolis, et qui retourne les données en XML. Elle n'est pas trop mal conçue, et assez complète, mais j'aurais quelques remarques à faire si jamais vous souhaitez l'utiliser dans un de vos projets.

[Vous pouvez retrouver la documentation de l'API ici, sur Github.][5]

## Remarques techniques

Premièrement, l'API *devrait* fonctionner pour les réseaux de bus des villes suivantes : Le Mans, Pau, Soissons, Aix-en-Provence, Caen, Dijon, Brest, Pau-Agen, Blois, St-Étienne, Nantes, Montargis, Angers, Macon-Villefranche, Épinay-sur-Orge, et Rennes (sauf erreur). Cependant, les données fournies pour certaines villes sont franchement limitées. Vérifiez donc cela avant de vous lancer dans le développement du service du siècle.

Ensuite, *aucune idée* de ce à quoi peut servir le paramètre **xml=2**. Tout est clair pour **xml=1** et **xml=3**, mais **xml=2** reste un mystère. Si vous trouvez quelque-chose, faites moi signe.

Ensuite, *gros* problème. Vous comprendrez vite que le paramètre **refs** est ce qui identifie un arrêt dans ce système; or, il change au cours du temps. Eh oui, c'est bizarre, mais c'est comme ça. J'ai cru remarquer qu'il ne change que pour certaines périodes; changement d'horaires, peut-être ? Toujours est-il qu'il faudra le mettre à jour régulièrement, faute de mieux. Vous pourrez toutefois récupérer les infos d'un seul arrêt dont vous connaissez le **code** (qui est du coup un identifiant qui ne change pas dans le temps… déconcertant), avec un appel du type **?xml=1&code=2523**.

## Remarques pratiques

L'API fournit des infos supplémentaires assez sympathiques, comme la couleur de la ligne, ou la direction d'un bus précis (en complément de la direction de la ligne). Pas de géolocalisation des arrêts cependant, contrairement à [cette autre API de Navitia][6] que je n'ai malheureusement pas eu l'occasion d'utiliser, vu qu'elle ne propose justement pas d'horaires *en temps réel*.

Remarque bête, mais néanmoins à noter, la capitalisation des noms est dégueulasse et sans aucun accent. Une fonction de capitalisation custom ne sera donc probablement pas de trop.

# Conclusion

Un bien gros article pour un sujet qui va probablement toucher deux personnes dans l'Univers, mais j'avais besoin de transmettre ma connaissance. Donc si vous êtes cette autre personne, bonne chance !

Par ailleurs, je ne sais pas qui a posté le [Pastebin originel][7], mais je sens que je lui dois une bière. Merci à lui ou elle !

Je sens que cette API a vraiment énormément de potentiel, et qu'une tonne d'autres données est disponible sur le site de Keolis. Je n'étais pas du tout intéressé par le domaine avant de me mettre à développer Twistoast, mais il y a encore énormément de progrès, de découvertes et d'inventions à développer dans le domaine du transport, et j'ai hâte de voir (ou même de participer) à ça.

[1]: {{ site.baseurl }}/assets/Logo_Keolis_Groupe_01.png
[2]: https://gist.github.com/outadoc/40060db45c436977a912/
[3]: http://actigraph.fr/843-Les-realisations.html
[4]: https://github.com/outadoc/Twisto-API
[5]: https://gist.github.com/outadoc/40060db45c436977a912/
[6]: http://caen.prod.navitia.com/cgi-bin/gwnavitia.dll/API?Action=LineList&NetworkExternalCode=1&#124;CAE8&#124;twisto
[7]: http://pastebin.com/eEumTXw1
