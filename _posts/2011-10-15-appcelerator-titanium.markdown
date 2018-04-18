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
Il y a quelques mois (oui, ça fait longtemps que j'ai pas bloggué...), [HarryLafranc][1] me parlait sur Twitter d'un service pour développer des **apps natives** iPhone et Android en Javascript.

[![]({{ site.baseurl }}/assets/appcelerator1.png "appcelerator")][2][  
][3]Cet outil, développé par **Appcelerator**, s'appelle **Titanium**. C'est en fait un intérpréteur de code **Javascript**, qui vous permettra de développer sur iPhone ou Android sans que vous n'ayiez à écrire **une seule ligne** de code en Objective-C ou Java. Plutôt alléchant... surtout quand on connaît le JS (qui est un langage très simple, il faut l'avouer). Seront également intéressés les personnes cherchant à développer rapidement pour les deux plateformes sans avoir à **tout re-coder**.

Oui mais alors, quid de l'UI ? En effet, en général, ce genre d'outil vous génère un application un peu moche qui est en fait une webapp, littéralement. Et bien pas Titanium ! Il convertira, lui, vos éléments d'UI codés en JavaScript en de **"vrais" éléments** d'UI disponibles dans le SDK de la plateforme correspondante. Le résultat donc, sera une vraie application **respectant le style de l'OS**.

Le code à proprement parler est très simple, comme dit plus haut. Quelques exemples :

```javascript
//création d'une fenêtre  
var win = Ti.UI.createWindow({  
	backgroundImage:'img/bg.png',  
	title:'nyan nyan nyan nyan',  
	url:'my_cool_window.js'  
);

//création d'un bouton  
var button = Ti.UI.createButton({  
	title:'Loulz',  
	height:50,  
	width:110,  
	bottom:10,  
	left:105,  
	font:{  
		fontSize:17  
	},  
	backgroundImage:'img/button.png',  
});
```

Et j'en passe ! Il est vraiment très aisé de développer avec cet outil. Et je vous assure que je ne suis en aucune sorte affilié avec eux :D On regrettera uniquement une chose : que l'IDE soit dérivé d'Aptana Studio, qui lui-même est dérivé d'**Eclipse**, quoi que certains y verront un avantage.

Titanium possède également un gros point fort, c'est sa **communauté** très active. Si vous ne trouvez pas la réponse à votre problème sur leur **Q&A**... posez-la, et si votre problème n'est pas trop "bizarre", vous aurez des réponses dans les minutes/heures qui suivent !

Titanium est totalement **gratuit** (à moins que vous ne souhaitiez développer sur BlackBerry... hum) et peut être téléchargé [à cette adresse][4].

PS : je vous prépare une version iPhone de **FreeStance**... [suivez-moi sur Twitter][5] pour avoir des infos au fur-et-à-mesure du développement ! ;)

[1]: http://twitter.com/HarryLafranc
[2]: {{ site.baseurl }}/assets/appcelerator1.png
[3]: http://appcelerator.com
[4]: http://www.appcelerator.com/products/titanium-studio/
[5]: http://twitter.com/outadoc
