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
<p style="text-align: center;">Si vous vous demandez comment fonctionnent des programmes comme <a href="http://dev.outadoc.fr/project/freestance/">FreeStance</a> pour communiquer avec votre Freebox sans fil, cet article est là pour vous l'expliquer ! Free a tout simplement développé une API complètement libre et très, très simple d'utilisation.<br />
<img class="aligncenter size-full wp-image-480" title="Freebox-Revolution-V6" src="https://outadoc.fr/wp-content/uploads/2011/06/Freebox-Revolution-V61.jpg" alt="" width="512" height="200" /></p>
<p>Elle vous permet en fait de simuler un appui sur une des touches de la télécommande de n'importe quelle Freebox sur le réseau. Tout ça via un simple appel d'URL ! Vous pouvez donc par exemple, changer de chaîne directement par votre navigateur en tapant une adresse spécifique, ou via wget, ou n'importe quel programme ou librairie supportant un appel d'URL tout bête.</p>
<p>L'URL est de la forme suivante : http://hd<span style="color: #ff0000;">1</span>.freebox.fr/pub/remote_control?code=<span style="color: #ff0000;">xxxxxxxx</span>&key=<span style="color: #ff0000;">xxx</span>&long=<span style="color: #ff0000;">true</span>&repeat=<span style="color: #ff0000;">5</span></p>
<p>Le sous-domaine (virtuel) de freebox.fr désigne le boitier à contrôler. Si vous souhaitez contrôler le boitier n°1, il faudra écrire hd1, pour le boitier n°2, hd2, etc.</p>
<p>La variable "code" contient le code de la Freebox à contrôler. C'est un nombre à 8 chiffres que vous trouverez dans les paramètres de la Freebox.</p>
<p>La variable "key" contient la touche dont vous souhaitez simuler l'appui. Voici la liste de celles-ci :</p>
<ul>
<li><em>power</em> : la touche rouge on/off</li>
<li><em>list</em> : la touche d’affichage de la liste des chaînes entre power et tv</li>
<li><em>tv</em> : la touche verte TV de commutation péritel</li>
<li><em>0 à 9</em> : les touches numériques</li>
<li><em>back</em> : la touche jaune en dessous du 7</li>
<li><em>swap</em> : la touche en dessous du 9</li>
<li><em>info, mail, help, pip </em>: les touches bleues à droite des numéros de chaîne</li>
<li><em>epg, media, options</em> : les fonctionnalités "secondaires" de ces mêmes touches</li>
<li><em>vol_inc, vol_dec</em> : volume+ et volume-</li>
<li><em>prgm_inc, prgm_dec</em> : chaîne suivante/précédente</li>
<li><em>ok</em> : touche OK</li>
<li><em>up, right, down, left</em> : les touches directionnelles entourant le OK</li>
<li><em>mute</em> : la touche "muet"</li>
<li><em>home</em> : la touche Free</li>
<li><em>rec</em> : la touche d’enregistrement</li>
<li><em>bwd</em> : la touche de retour en arrière (<<)</li>
<li><em>prev</em> : la touche "précédent" (|<<)</li>
<li><em>play</em> : la touche lecture/pause</li>
<li><em>fwd</em> : la touche d’avance rapide (>>)</li>
<li><em>next</em> : la touche "suivant" (>>|)</li>
<li><em>red</em> : le bouton rouge (B)</li>
<li><em>green</em> : le bouton vert (A)</li>
<li><em>yellow</em> : le bouton jaune (Y)</li>
<li><em>blue</em> : le bouton bleu (X)</li>
</ul>
<p>(Source : <a href="http://universfreebox.com">universfreebox.com</a>)</p>
<p>La variable "long", quant à elle, spécifie comme son nom l'indique si l'appui du bouton doit être long ou court. Si elle vaut false ou n'est pas spécifiée, l'appui sera considéré comme court.</p>
<p>Pour finir, le contenu de la variable "repeat" est le nombre de fois que sera répété l'appui sur la touche de la télécommande. Il est peu utilisé et facultatif.</p>
<p>Et voilà ! Plus qu'à appeler l'URL, et votre Freebox réagit ! Pratique pour les farces... entre autres :D</p>
