---
layout: post
status: publish
published: true
title: Débrider YouTube sur tous vos appareils et sans proxy
author: outadoc
author_login: outadoc
author_email: outadoc@gmail.com
author_url: https://outadoc.fr
date: '2013-03-12 14:24:40 +0000'
date_gmt: '2013-03-12 13:24:40 +0000'
categories:
- Tutos
- Technologeek
- Geekeries
tags:
- free
- youtube
- proxfree
- bridage
- iptables
- google
- cache
comments:
- id: 532
  author: wiwi60
  author_email: freeaddons@free.fr
  author_url: http://freeaddons.free.fr
  date: '2013-03-18 12:48:22 +0000'
  date_gmt: '2013-03-18 11:48:22 +0000'
  content: Differentes methodes ici <a href="http://proxyfreeyoutube.free.fr" rel="nofollow">proxyfreeyoutube</a>
- id: 538
  author: maxpower500
  author_email: maxpower500@free.fr
  author_url: ''
  date: '2013-04-19 15:03:55 +0100'
  date_gmt: '2013-04-19 14:03:55 +0100'
  content: "salut merci pour le tuto mais ca minteresse pas confiance ces lignes de
    code lol\r\n\r\nla meilleure solution que j'ai trouvée cest celle la :
    http://lecrabeinfo.net/debrider-et-accelerer-les-videos-youtube-chez-free-la-solution.html"
- id: 539
  author: benoxy
  author_email: nestounet@rocketmail.com
  author_url: ''
  date: '2013-06-09 17:07:33 +0100'
  date_gmt: '2013-06-09 16:07:33 +0100'
  content: Comment on fait pour entrer la commande sur android (v.4.1 et rooter)
- id: 540
  author: outadoc
  author_email: outadoc@gmail.com
  author_url: http://outadoc.fr
  date: '2013-06-10 07:00:23 +0100'
  date_gmt: '2013-06-10 06:00:23 +0100'
  content: Si adb est installé sur ton ordi, tu peux juste taper adb shell
    et entrer la commande. Le plus simple reste de télécharger <a href="https://play.google.com/store/apps/details?id=jackpal.androidterm&hl=fr"
    rel="nofollow">Android Terminal Emulator</a>.
- id: 545
  author: toto
  author_email: xxz360zxx@live.fr
  author_url: ''
  date: '2013-06-15 07:57:35 +0100'
  date_gmt: '2013-06-15 06:57:35 +0100'
  content: "Hello, j'y arrive pas… Il me dit que je suis pas root….\r\nSi tu peut
    me contacter par skype sa serait sympa : getbaackk\r\nMerci"
- id: 546
  author: kits
  author_email: arbi.sp23@gmail.com
  author_url: ''
  date: '2013-07-11 02:48:22 +0100'
  date_gmt: '2013-07-11 01:48:22 +0100'
  content: "Ca fonctionne merveilleusement bien O.O..! Plus besoin de galérer
    avec le vpn. \r\nMerci"
- id: 550
  author: Validol
  author_email: vincentcuzon@gmail.com
  author_url: ''
  date: '2013-12-15 11:05:20 +0000'
  date_gmt: '2013-12-15 10:05:20 +0000'
  content: Bonjour,  j'aimerai utiliser ta solution sous android mais même rooté
    je n'y arrive pas. Emulator dit que je ne suis pas tout..
- id: 551
  author: Validol
  author_email: vincentcuzon@gmail.com
  author_url: ''
  date: '2013-12-15 11:05:49 +0000'
  date_gmt: '2013-12-15 10:05:49 +0000'
  content: Pas root
- id: 552
  author: superboum
  author_email: quentin@dufour.tk
  author_url: http://quentin@dufour.tk
  date: '2014-01-24 10:36:44 +0000'
  date_gmt: '2014-01-24 09:36:44 +0000'
  content: "Je suppose que toutes les commandes font la même chose. Pour ma
    part, je suis plus familier avec iptables, donc ma (faible) experience me permet
    de te dire que c'est valable que sur le device utilisé (si tu le fais sur
    ton telephone, ça ne s'applique que sur ton téléphone, etc…)\r\nAprès
    pour la  commande, rien de sorcier :\r\n<code>iptables -A OUTPUT -p 6 -d 173.194.52.0/22
    -j REJECT --reject-with tcp-reset</code>\r\niptables --> nom du pare feu line\r\n-A
    --> Ajouter une régle\r\nOUTPUT --> nom de la chaine dans la table filter
    d'iptables. Ici on analyse les paquets sortants.\r\n-p 6 --> précise un
    protocole. Je suppose que c'est TCP\r\n(extrait du man : Protocole de la règle
    ou du paquet à vérifier. Le protocole spécifié est
    l'un des suivants : tcp, udp, icmp ou all, ou bien sous forme d'une valeur numérique,
    représentant un de ces protocoles ou un protocole différent. )\r\n-d
    173.194.52.0/22 --> s'applique sur toutes les adresses IP de 173.194.52.1 à
    173.194.55.254\r\n-j REJECT --> On bloque\r\n--reject-with --> permet d'envoyer
    un paquet pour informer l'ordinateur afin de ne pas avoir à attendre le
    timeout\r\n\r\nEn gros, je suppose que ça sert à forcer ton ordinateur
    à aller taper sur des serveurs Youtube moins sollicités."
- id: 557
  author: Furtys
  author_email: quentin.furtys@gmail.com
  author_url: http://furtys.me
  date: '2014-06-17 16:24:06 +0100'
  date_gmt: '2014-06-17 15:24:06 +0100'
  content: "Yop !\r\n\r\nJe pense fortement à un routeur/pare feu ça
    fonctionnera !\r\n\r\nLes commandes exécutées agissent sur le pare
    feu interne (celui de Windaube, ipTables pour Unix etc…).\r\nSi ton routeur/pare
    feu est bien configuré et que tu peux lui ajouter des exceptions, il suffit
    de rejeter la plage d'adresse allant de 173.194.52.1 à 173.194.55.254 pour
    les paquets sortant utilisant le protocole TCP, et normalement ça devrait
    marcher (à confirmer).\r\nPar contre ce qui est bizarre c'est qu'on ne
    redirige jamais la requête vers une autre adresse IP, hors le DNS doit te
    donner probablement l'@IP d'un des serveurs google (172.194.52.0/22) …\r\n\r\nEt
    ce qui est bizarre, c'est que lors d'un ping vers google ou youtube, je ne tombe
    jamais sur une des ces adresses ! (sans avoir appliqué la règle,
    et ayant une freebox derrière mon PC). Et aucun problème pour lire
    en 1080p d'ici … Y'aurais-t-il des privilégiés où Free
    ne renvoie pas vers ces serveurs ?"
- id: 560
  author: ryancooper73
  author_email: crazy_france_shadow@hotmail.com
  author_url: ''
  date: '2014-09-13 08:26:06 +0100'
  date_gmt: '2014-09-13 07:26:06 +0100'
  content: "Bonjour, \r\nJ'ai fait la manipulation sur Android, cela a fonctionné
    à merveille pendant une soirée et depuis j'ai constamment un message
    d'erreur \"Un problème de lecture s'est produit\" sur l'application YouTube
    quand j'essaie de lire une vidéo. \r\nPouvez vous me fournir la commande
    à entrer dans le terminal qui effacerai celle qui est donnée dans
    cet article ? Merci"
---
Je vous avais présenté [il y a pas longtemps][1] un site web qui vous permettait de passer par un proxy pour regarder vos vidéos YouTube sans bridage de la part de votre FAI (*ahem* FREE *ahem*). Cependant, le fait de devoir passer par un site web indépendant ainsi que l'instabilité du player qu'il utilisait était peu pratique, et personnellement, je continuais à regarder mes vidéos sur le site officiel et en 480/360p. Surtout sur ma tablette, faute de Flash Player. Pauvre de moi.

[![05512027-photo-logo-free]({{ site.baseurl }}/assets/05512027-photo-logo-free1.png)][2]

SAUF QUE. Korben a publié récemment un article sur son blog avec une astuce pour outrepasser les serveurs de cache de Google, ce qui force le navigateur à contacter directement les serveurs de Youtube, qui ne sont eux pas bridés par Free.

Oui, je sais, moi non plus j'ai rien compris.

Bref, voici les commandes à taper pour configurer votre firewall et outre-passer cette limitation :

-   Sous **Windows** (avec cmd en mode administrateur) :  
    `netsh.exe advfirewall firewall add rule name="FREEYT" action=block dir=IN remoteip=173.194.52.0/22`
    
-   Sous **OS X** (en root) :  
    `ipfw add 01337 deny ip from any to 173.194.52.0/22`
    
-   Et le meilleur pour la fin, sous **Linux** et **Android** (si vous avez un accès root) :  
    `iptables -A OUTPUT -p 6 -d 173.194.52.0/22 -j REJECT --reject-with tcp-reset`
    

Je n'ai pas une grande expérience dans les réseaux, mais j'imagine qu'en appliquant cette règle sur votre routeur ou autre, vous pourriez débrider d'un seul coup tous les appareils connectés sur le réseau. Pratique !

Et voilà, vous pouvez ENFIN regarder des vidéos en 720p sans trop de problèmes. Il est possible que l'IP des serveurs change, mais d'ici là, vous êtes tranquilles ! ;)

[Source: Korben.info][3]

[1]: {{ site.baseurl }}/2012/11/proxfree-proxy-gratuit/
[2]: {{ site.baseurl }}/assets/05512027-photo-logo-free1.png
[3]: http://korben.info/free-et-youtube-comment-regler-le-souci-sous-windows-mac-et-linux.html
