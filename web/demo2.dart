// Copyright (c) 2015, Davy Mitchell. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:simplegamelib/simplegamelib.dart';

Sprite player, dude;

void main() {
  Game game = new Game("My Game", '#surface');

  player = game.createSprite("images/ninjadude.png");

  player
    ..position = new Point(0, 10)
    ..movement = Movements.east;

  dude = game.createSprite("images/ninjadude.png");

  dude..position = new Point(200, 20);

  dude.height = 48;
  dude.width = 48;
  player.height = 48;
  player.width = 48;

  game.customUpdate = collisionDemo;

  print('starting game...');

  game.start();
}

// Custom detection routine.
void collisionDemo() {
  document.body.style.backgroundColor =
      player.detectCollision(dude) ?  "#ffcc00" : "cornflowerblue";
  if (player.x > 333) {
    player.x = -50;
  }
}
