---
layout: post
status: publish
published: true
title: "[Tuto] CraftBukkit - Installer l'alternative à Notch"
author: outadoc
author_login: outadoc
author_email: outadoc@gmail.com
author_url: https://outadoc.fr
date: '2011-06-13 21:42:28 +0100'
date_gmt: '2011-06-13 20:42:28 +0100'
categories:
- Tutos
- Programmes
- Technologeek
- Jeux Vidéo
tags:
- minecraft
- bukkit
- craftbukkit
- installer un serveur bukkit
- serveur minecraft
comments:
- id: 172
  author: Hetoria
  author_email: mynegiant@gmail.com
  author_url: http://empalgor.fr
  date: '2011-06-28 22:30:31 +0100'
  date_gmt: '2011-06-28 21:30:31 +0100'
  content: "Passant par hasard sur ce blog, je suis abasourdi en tombant sur cette
    phrase : \r\n\r\n\"En effet, ne pouvant pas être moddé par la communauté,
    il souffre de nombreux bugs\". \r\n\r\nC'est juste inadmissible de dire une telle
    chose ! Vous n'avez jamais jouer sur un serveur vanilla pour dire une telle absurdité.
    Vous pouvez très bien présenter une alternative sans taper sur Mojang.\r\n\r\nHetoria,
    Empereur de l'Empire d'Algorka\r\n\r\n\"Le Vanilla vaincra !\""
- id: 176
  author: Hetoria
  author_email: mynegiant@gmail.com
  author_url: http://empalgor.fr
  date: '2011-06-30 12:33:07 +0100'
  date_gmt: '2011-06-30 11:33:07 +0100'
  content: Merci d'avoir fait l'effort d'éditer votre message qui est toute
    suite beaucoup plus agréable à lire ! Bravo pour ce blog aux articles
    bien écrit et bonne continuation à vous.
---
<p>Si vous connaissez Minecraft et son mode multijoueur, vous saurez sans doute que le serveur de base n'offre que des possibilités limitées. En effet, ne pouvant pas être moddé par la communauté, il souffre de nombreuses lacunes. Mais ce n'est pas si grave, puisqu'une alternative totalement compatible existe: j'ai nommé <strong>CraftBukkit</strong> !</p>
<p style="text-align: center;"><a href="http://bukkit.org/"><img class="aligncenter size-full wp-image-721" title="Bukkit" src="https://outadoc.fr/wp-content/uploads/2011/06/logo1.png" alt="" width="400" height="59" /></a></p>
<p>C'est un serveur de remplacement pour Minecraft géré par la communauté Bukkit. Je vous le dis tout de suite: si vous vous contentez de jouer sur des serveurs multijoueurs sans en maintenir un vous-même, cet article ne vous servira pas à grand-chose.</p>
<p>Le principe de Bukkit est simple: partir avec comme base le logiciel serveur officiel, et le modifier pour corriger des bugs et <strong>ajouter une API</strong>. Vous savez, une API... ce qui permet à des développeurs de créer leurs propres plugins qui iront se greffer à CraftBukkit pour lui ajouter des fonctionnalités à l'infini (ou presque) ! Notch (le créateur de Minecraft) nous en a d'ailleurs promis une. Je pense, personnellement, qu'elle sera plutôt décevante, mais sait-on jamais.</p>
<ul>
<li>Commencez par télécharger CraftBukkit sur <a href="http://wiki.bukkit.org/Setting_up_a_server">bukkit.org</a> (cliquez sur le lien "latest recommended build" correspondant à votre OS).</li>
<li>Lancez-le en suivant les instructions de la page précédente. Le plus dur est fait ! :)</li>
<li>Si tout se passe bien, aucun message d'erreur ne devrait s'afficher. Il peut arriver qu'il y en ait, mais si le serveur continue son exécution, ignorez-les simplement. Attendez la génération du monde.</li>
<li>Une fois le premier lancement terminé, ouvrez le fichier "server.properties" situé dans le même dossier que CraftBukkit ou dans votre dossier utilisateur. Vous devriez obtenir quelque chose du genre :<br />
<blockquote><p>#Minecraft server properties<br />
#Sun Jun 12 20:33:21 BST 2011<br />
level-name=world<br />
allow-nether=true<br />
view-distance=10<br />
spawn-monsters=true<br />
online-mode=true<br />
spawn-animals=true<br />
max-players=20<br />
server-ip=<br />
pvp=true<br />
level-seed=<br />
server-port=25565<br />
allow-flight=false<br />
white-list=false</p></blockquote>
<p>Voici la signification des clés principales; vous pouvez modifier leurs valeurs, tant que vous savez ce que vous faites :</p>
<p><span style="text-decoration: underline;">allow-nether</span>: autoriser les joueurs à créer des portails et à aller dans le nether<br />
<span style="text-decoration: underline;">view-distance</span>: le nombre de "chunks" (= morceaux) de la carte qui seront chargés autour de chaque joueur. Diminuer la valeur diminuera les ralentissements.<br />
<span style="text-decoration: underline;">spawn-monsters</span>: activer ou non les monstres. Si vous les désactivez, le serveur sera en mode "peaceful".<br />
<span style="text-decoration: underline;">online-mode</span>: mode en ligne. Le désactiver permettra aux clients crackés de se connecter, il est donc <strong>fortement</strong> recommandé de l'activer.<br />
<span style="text-decoration: underline;">spawn-animals</span>: activer ou non les animaux. On laissera l'option activée dans 99% des cas.<br />
<span style="text-decoration: underline;">max-players</span>: le nombre maximal de joueurs connectés simultanément.<br />
<span style="text-decoration: underline;">pvp</span>: permet, si elle est désactivée, d'empêcher que les joueurs se fritent entre eux. Intéressant sur les serveurs dits "free build".<br />
<span style="text-decoration: underline;">level-seed</span>: le seed du monde qui sera généré. Si vous avez déjà lancé le serveur et généré un monde avant de modifier l'option, supprimez le dossier nommé 'world' et relancez-le.<br />
<span style="text-decoration: underline;">allow-flight</span>: autoriser ou non les joueurs à voler (voler dans les airs, pas voler des objets :P) grâce à un client modifié.<br />
<span style="text-decoration: underline;">white-list</span>: activer ou non la white-list. Elle permet de n'autoriser que certains joueurs spécifiés dans whitelist.txt.</p>
<p>C'est bon, tout est comme vous voulez ? On continue alors ! :D</li>
<li>Vous pouvez commencer à jouer si vous le souhaitez... mais le meilleur reste à venir ! Allez sur la <a href="http://plugins.bukkit.org/">liste de plugins de bukkit.org</a> ou <a href="http://forums.bukkit.org/forums/plugin-releases.17/">ses forums</a>. <a href="http://bukkit.fr/index.php?forum/#traduction-codage.5">Bukkit.fr</a> quand à lui, propose quelques plugins traduits en français, voire inédits.</li>
<li>D'ici vous pouvez télécharger presque n'importe quoi. Il est peu probable que vous ne trouviez pas votre bonheur. Faites tout de même attention à ne pas installer 50 plugins, votre serveur risquerait de ne pas apprécier la blague :p Je prendrai comme exemple Mother Nature, un plugin qui vous permet de changer la météo du jeu à volonté. Vous pourrez même frapper d'autres joueurs avec des éclairs (<a href="https://twitter.com/#!/MonsieurBlah/status/77116295337877505">n'est-ce pas, MonsieurBlah ?</a> :D) !</li>
<li>Installez le plugin en glissant le fichier .jar dans le dossier "plugins", situé au même endroit que server.properties.</li>
<li>Démarrez le serveur. Si vous obtenez une erreur, vérifiez que vous avez bien téléchargé la version du plugin compatible avec votre version de CraftBukkit. Si vous l'avez, et bien... il va falloir attendre une correction de bug, chercher une solution vous-même ou trouver une alternative.</li>
<li>Connectez-vous au serveur avec Minecraft (si vous hébergez sur votre propre ordinateur, tapez localhost en lieu et place de l'IP du serveur auquel se connecter).</li>
<li>Et voilà ! Vous pouvez jouer avec vos jolis nouveaux plugins ! Pour connaître les commandes à utiliser, regardez sur le post du plugin sur le forum.</li>
</ul>
<p><strong><span style="text-decoration: underline; color: #ff6600;">NB</span><span style="color: #ff6600;"> :</span></strong> Une bonne chose à savoir est que Bukkit est totalement indépendant de Mojang, l'éditeur de Minecraft. Par conséquent, après chaque mise à jour de Minecraft, un énorme travail doit être effectué par la communauté de Bukkit pour que CraftBukkit soit à jour. Ainsi, il est possible qu'une version <span style="text-decoration: underline;">stable</span> de CraftBukkit (les versions instables sortent plus rapidement en général) ne sorte que plusieurs jours après la mise à jour de Minecraft. Et il en va de même pour la mise à jour des plugins ! Les développeurs ne sont pas des sur-hommes, et ils doivent attendre la mise à jour de Bukkit pour commencer à rendre compatible leurs plugins. La patience est donc de mise si vous optez pour un serveur CraftBukkit, mais croyez-moi, le jeu en vaut la chandelle ! :)</p>
