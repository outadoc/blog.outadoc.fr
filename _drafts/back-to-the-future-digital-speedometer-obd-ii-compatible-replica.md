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
For a long time now, I've been wanting to create a replica of Back to the Future's digital speedometer. It's a prop used in the movie that's placed on the DeLorean's dashboard, and can be seen multiple times throughout the trilogy. Of course, it's mostly used as a visual element to mark when the DeLorean reaches 88 miles per hour and begins its time travel!

I thought it would be cool to recreate it, and make it compatible with modern cars. I've seen very good-looking GPS models on the market, but I wanted to make something more genuine. GPS feels like cheating! There's also a really [awesome replica by Damien De Meulemester][1] that only uses components available in 1985, and works on a real DeLorean by adding a sensor to the speedometer. This is way out of my league, and obviously out of the question for modern cars, but it inspired me to get started on this project.

[![speedometer seen in back to the future](https://outadoc.fr/wp-content/uploads/2017/08/vlcsnap-2017-08-13-22h22m02s383-768x416.png "The speedometer as seen in Back to the Future (1985)")][2]

# Materials

Let's start with some research! We have to figure out the dimensions of the prop, the materials and components used, etc. Thankfully, the Internet is a great resource, and some people have already done that for us.

## Enclosure

The box used in the movie is apparently a Hammond 1591CGY ABS box. It's 120 x 65 mm, so it's not too big for a dashboard, and should be perfect for fitting some electronics in it.

## Display

The displays used in the movie are three Stanley readout displays, which, unfortunately, don't exist anymore. This technology has largely been replaced by seven-segment LED displays, and since they're so similar, we'll use these. The dimensions are tricky; it's difficult to find the exact right size, but displays with a digit height of 20.3 mm seem to do the trick nicely. I'll be using three Multicomp LS0803SRWK for this project.

Note that the third digit is hidden by a piece of tape; to keep things simple but accurate and more power-efficient, we'll use a third display, but without wiring it.

The Stanley readout displays used to come with a black frame around them, which we can see in the movie. We'll have to do without this. There are multiple solutions, including cutting a polystyrene frame, or using a sheet of black plastic, but the most elegant solution in 2017 to my eyes is 3D-printing a nice, sturdy plastic frame. If you're using displays similar to mine in dimensions, you can use [this model I made][3].

## Back plug

At the end of the first movie, we can see the back of the speedometer a little bit better.

[![back to the future back speedometer](https://outadoc.fr/wp-content/uploads/2017/08/vlcsnap-2017-08-13-22h39m47s330-768x416.png "The back of the speedometer, seen at the end of Back to the Future (1985)")][4]

As you can see, it's using some kind of DB25 sub-D plug, which is usually found on old computers as a parallel port (used for printers and such). Not terribly convenient, but not too hard to find!

## Dymo labels

The Dymo labels found on the front of the box—famously reading "SET TO 88"—might be one of the trickiest to reproduce today, if you don't have the right hardware. Modern Dymo machines usually print in 2D using a different font, but the labels we need are 3D (embossed) and 12 mm high. 9 mm embossed labels can be found, but 12 mm ones are rarer.

We're now mostly good on our "exterior" stuff; our speedometer should be pretty good-looking if we can get all of these parts.

# OBD-II communication

Now we'll need to get our Arduino to communicate with the car's CAN bus to get the vehicle speed. Fortunately, this is all pretty easy, using the [Freematics UART OBD-II adapter][5]; it's made for Arduino and provides a simple interface that's compatible with most CAN standards. It can even provide power to the board and has simple-to-use libraries, so it's perfect for our needs.

# Electronics

I'm using an Arduino Nano (compatible) board for this project. It's got a UART interface, enough I/O ports, and runs at 5V, which is what is output by the Freematics adapter. It's also super-tiny and will fit nicely in the enclosure, with room to spare.

[1]: http://www.stainlesswings.fr/forum/viewtopic.php?f=9&t=2667
[2]: https://outadoc.fr/wp-content/uploads/2017/08/vlcsnap-2017-08-13-22h22m02s383.png
[3]: https://www.sculpteo.com/fr/print/bttf-speedo-digit-frame-2/mtiWCcD5
[4]: https://outadoc.fr/wp-content/uploads/2017/08/vlcsnap-2017-08-13-22h39m47s330.png
[5]: https://freematics.com/pages/products/freematics-obd-ii-uart-adapter-mk2/
