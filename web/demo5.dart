// Copyright (c) 2015, Davy Mitchell. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:simplegamelib/simplegamelib.dart';

Sprite player;
AudioBank sounds = new AudioBank();
Game game = new Game("My Game", '#surface');

void main() {
  sounds.load('test', 'sounds/coin.mp3');
  player = game.createSprite('images/ninjadude.png', 48, 48);
  game
    ..player.sprite = player
    ..renderer.liveBackground.loadImage('images/background.png');

  for (int i = 0; i < 3; i++) {
    Sprite heart = new Sprite.fromFilename('images/heart.png', 48, 48);
    heart.position = new Point(100 + (i * 75), 100);
    game.collectiblesGroup.add(heart);
  }

  player
    ..position = new Point(0, 30)
    ..movement = new Point(0, 0);

  game.customUpdate = soundDemo;

  print('starting game...');
  game.setUpKeys();
  game.start();
}

void soundDemo() {
  List<Sprite> pickedHearts = game.collectiblesGroup.detectCollision(player);

  pickedHearts.forEach((Sprite heart) {
    heart.alive = false;
    game.collectiblesGroup.removeDead();
    sounds.play("test");
  });
}
