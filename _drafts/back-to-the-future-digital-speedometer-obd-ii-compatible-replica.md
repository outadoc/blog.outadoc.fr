---
layout: post
status: draft
title: Back to the Future Digital Speedometer - OBD-II Compatible Replica
author:
  display_name: outadoc
  login: outadoc
  email: outadoc@gmail.com
  url: https://outadoc.fr
author_login: outadoc
author_email: outadoc@gmail.com
author_url: https://outadoc.fr
wordpress_id: 1171
wordpress_url: https://outadoc.fr/?p=1171
date: '2017-08-15 18:03:17 +0100'
categories:
- Non classé
tags: []
comments: []
---
<p>For a long time now, I've been wanting to create a replica of Back to the Future's digital speedometer. It's a prop used in the movie that's placed on the DeLorean's dashboard, and can be seen multiple times throughout the trilogy. Of course, it's mostly used as a visual element to mark when the DeLorean reaches 88 miles per hour and begins its time travel!</p>
<p>I thought it would be cool to recreate it, and make it compatible with modern cars. I've seen very good-looking GPS models on the market, but I wanted to make something more genuine. GPS feels like cheating! There's also a really <a href="http://www.stainlesswings.fr/forum/viewtopic.php?f=9&t=2667">awesome replica by Damien De Meulemester</a> that only uses components available in 1985, and works on a real DeLorean by adding a sensor to the speedometer. This is way out of my league, and obviously out of the question for modern cars, but it inspired me to get started on this project.</p>
<p>[caption id="attachment_1173" align="aligncenter" width="700"]<a href="https://outadoc.fr/wp-content/uploads/2017/08/vlcsnap-2017-08-13-22h22m02s383.png" rel="attachment wp-att-1173"><img src="https://outadoc.fr/wp-content/uploads/2017/08/vlcsnap-2017-08-13-22h22m02s383-768x416.png" alt="speedometer seen in back to the future" width="700" height="379" class="size-medium_large wp-image-1173" /></a> The speedometer as seen in Back to the Future (1985)[/caption]</p>
<h1>Materials</h1>
<p>Let's start with some research! We have to figure out the dimensions of the prop, the materials and components used, etc. Thankfully, the Internet is a great resource, and some people have already done that for us.</p>
<h2>Enclosure</h2>
<p>The box used in the movie is apparently a Hammond 1591CGY ABS box. It's 120 x 65 mm, so it's not too big for a dashboard, and should be perfect for fitting some electronics in it.</p>
<h2>Display</h2>
<p>The displays used in the movie are three Stanley readout displays, which, unfortunately, don't exist anymore. This technology has largely been replaced by seven-segment LED displays, and since they're so similar, we'll use these. The dimensions are tricky; it's difficult to find the exact right size, but displays with a digit height of 20.3 mm seem to do the trick nicely. I'll be using three Multicomp LS0803SRWK for this project.</p>
<p>Note that the third digit is hidden by a piece of tape; to keep things simple but accurate and more power-efficient, we'll use a third display, but without wiring it.</p>
<p>The Stanley readout displays used to come with a black frame around them, which we can see in the movie. We'll have to do without this. There are multiple solutions, including cutting a polystyrene frame, or using a sheet of black plastic, but the most elegant solution in 2017 to my eyes is 3D-printing a nice, sturdy plastic frame. If you're using displays similar to mine in dimensions, you can use <a href="https://www.sculpteo.com/fr/print/bttf-speedo-digit-frame-2/mtiWCcD5">this model I made</a>.</p>
<h2>Back plug</h2>
<p>At the end of the first movie, we can see the back of the speedometer a little bit better.</p>
<p>[caption id="attachment_1176" align="aligncenter" width="700"]<a href="https://outadoc.fr/wp-content/uploads/2017/08/vlcsnap-2017-08-13-22h39m47s330.png" rel="attachment wp-att-1176"><img src="https://outadoc.fr/wp-content/uploads/2017/08/vlcsnap-2017-08-13-22h39m47s330-768x416.png" alt="back to the future back speedometer" width="700" height="379" class="size-medium_large wp-image-1176" /></a> The back of the speedometer, seen at the end of Back to the Future (1985)[/caption]</p>
<p>As you can see, it's using some kind of DB25 sub-D plug, which is usually found on old computers as a parallel port (used for printers and such). Not terribly convenient, but not too hard to find!</p>
<h2>Dymo labels</h2>
<p>The Dymo labels found on the front of the box—famously reading "SET TO 88"—might be one of the trickiest to reproduce today, if you don't have the right hardware. Modern Dymo machines usually print in 2D using a different font, but the labels we need are 3D (embossed) and 12 mm high. 9 mm embossed labels can be found, but 12 mm ones are rarer.</p>
<p>We're now mostly good on our "exterior" stuff; our speedometer should be pretty good-looking if we can get all of these parts.</p>
<h1>OBD-II communication</h1>
<p>Now we'll need to get our Arduino to communicate with the car's CAN bus to get the vehicle speed. Fortunately, this is all pretty easy, using the <a href="https://freematics.com/pages/products/freematics-obd-ii-uart-adapter-mk2/">Freematics UART OBD-II adapter</a>; it's made for Arduino and provides a simple interface that's compatible with most CAN standards. It can even provide power to the board and has simple-to-use libraries, so it's perfect for our needs.</p>
<h1>Electronics</h1>
<p>I'm using an Arduino Nano (compatible) board for this project. It's got a UART interface, enough I/O ports, and runs at 5V, which is what is output by the Freematics adapter. It's also super-tiny and will fit nicely in the enclosure, with room to spare.</p>
