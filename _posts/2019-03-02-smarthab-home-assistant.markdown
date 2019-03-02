---
layout: post
status: publish
published: true
title: "Intégrer SmartHab à la solution domotique Home Assistant"
author: outadoc
author_login: outadoc
author_email: outadoc@gmail.com
author_url: https://outadoc.fr
date: '2019-03-02 15:00:00 +0200'
categories:
- Domotique
tags: []
comments: []
---
[Home Assistant](https://home-assistant.io/) propose une solution logicielle de
"box" domotique *open-source* qui s'installe sur n'importe quel matériel (par
exemple un Raspberry Pi) et propose de nombreuses intégrations avec des
appareils connectés.

Si vous vivez dans un logement équipé de la solution de domotique de 
[SmartHab](http://smarthab.fr), vous cherchez peut-être un moyen de l'intégrer 
avec le reste de votre équipement *via* un logiciel comme Home Assistant. Moi 
aussi ! C'est pourquoi j'ai développé un plugin SmartHab pour Home Assistant.

<img 
    src="{{ site.baseurl }}/assets/home-assistant-smarthab-overview.png" alt="home-assistant smarthab overview" 
    style="max-width: 500px" />

Une fois mise en place, l'intégration vous donnera accès à toutes les 
possibilités de Home Assistant : automatisation, contrôle depuis iOS *via* 
HomeKit, contrôle vocal depuis Alexa ou Google Home...

Soyez prévenu·e : Home Assistant n'est **pas** un logiciel facile à prendre en
main, et un certain niveau en anglais et en configuration textuelle de logiciels
vous sera plus qu'utile.

Une fois le composant SmartHab publié (vous pouvez consulter la [liste des
composants actuellement disponibles](https://www.home-assistant.io/components/)), il suffira d'installer Home Assistant et d'ajouter ces lignes dans le fichier
`configuration.yaml` :

```yaml
smarthab:
  email: john.doe@example.com
  password: '123456'
```

Vos lumières et volets seront automatiquement mis à votre disposition dans
Home Assistant au prochain démarrage.