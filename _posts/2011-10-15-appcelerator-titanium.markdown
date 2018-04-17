---
layout: post
status: publish
published: true
title: Appcelerator Titanium - Le multiplateforme mobile en JS, ça vous tente
  ?
author: outadoc
author_login: outadoc
author_email: outadoc@gmail.com
author_url: https://outadoc.fr
date: '2011-10-15 18:36:46 +0100'
date_gmt: '2011-10-15 17:36:46 +0100'
categories:
- Découvertes
- Programmes
- Technologeek
tags:
- iphone
- freestance
- appcelerator
- titanium
- android
- développement
comments: []
---
<p>Il y a quelques mois (oui, ça fait longtemps que j'ai pas bloggué...), <a href="http://twitter.com/HarryLafranc">HarryLafranc</a> me parlait sur Twitter d'un service pour développer des <strong>apps natives</strong> iPhone et Android en Javascript.</p>
<p style="text-align: center;"><a href="https://outadoc.fr/wp-content/uploads/2011/10/appcelerator1.png"><img class="aligncenter  wp-image-713" title="appcelerator" src="https://outadoc.fr/wp-content/uploads/2011/10/appcelerator1.png" alt="" width="262" height="208" /></a><a href="http://appcelerator.com"><br />
</a>Cet outil, développé par <strong>Appcelerator</strong>, s'appelle <strong>Titanium</strong>. C'est en fait un intérpréteur de code <strong>Javascript</strong>, qui vous permettra de développer sur iPhone ou Android sans que vous n'ayiez à écrire <strong>une seule ligne</strong> de code en Objective-C ou Java. Plutôt alléchant... surtout quand on connaît le JS (qui est un langage très simple, il faut l'avouer). Seront également intéressés les personnes cherchant à développer rapidement pour les deux plateformes sans avoir à <strong>tout re-coder</strong>.</p>
<p style="text-align: left;">Oui mais alors, quid de l'UI ? En effet, en général, ce genre d'outil vous génère un application un peu moche qui est en fait une webapp, littéralement. Et bien pas Titanium ! Il convertira, lui, vos éléments d'UI codés en JavaScript en de <strong>"vrais" éléments</strong> d'UI disponibles dans le SDK de la plateforme correspondante. Le résultat donc, sera une vraie application <strong>respectant le style de l'OS</strong>.</p>
<p style="text-align: left;">Le code à proprement parler est très simple, comme dit plus haut. Quelques exemples :</p>
<blockquote><p>//création d'une fenêtre<br />
var win = Ti.UI.createWindow({<br />
backgroundImage:'img/bg.png',<br />
title:'nyan nyan nyan nyan',<br />
url:'my_cool_window.js'<br />
);</p></blockquote>
<p> </p>
<blockquote><p>//création d'un bouton<br />
var button = Ti.UI.createButton({<br />
title:'Loulz',<br />
height:50,<br />
width:110,<br />
bottom:10,<br />
left:105,<br />
font:{<br />
fontSize:17<br />
},<br />
backgroundImage:'img/button.png',<br />
});</p></blockquote>
<p>Et j'en passe ! Il est vraiment très aisé de développer avec cet outil. Et je vous assure que je ne suis en aucune sorte affilié avec eux :D On regrettera uniquement une chose : que l'IDE soit dérivé d'Aptana Studio, qui lui-même est dérivé d'<strong>Eclipse</strong>, quoi que certains y verront un avantage.</p>
<p>Titanium possède également un gros point fort, c'est sa <strong>communauté</strong> très active. Si vous ne trouvez pas la réponse à votre problème sur leur <strong>Q&A</strong>... posez-la, et si votre problème n'est pas trop "bizarre", vous aurez des réponses dans les minutes/heures qui suivent !</p>
<p>Titanium est totalement <strong>gratuit</strong> (à moins que vous ne souhaitiez développer sur BlackBerry... hum) et peut être téléchargé <a href="http://www.appcelerator.com/products/titanium-studio/">à cette adresse</a>.</p>
<p>PS : je vous prépare une version iPhone de <strong>FreeStance</strong>... <a href="http://twitter.com/outadoc">suivez-moi sur Twitter</a> pour avoir des infos au fur-et-à-mesure du développement ! ;)</p>
