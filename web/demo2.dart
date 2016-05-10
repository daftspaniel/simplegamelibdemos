// Copyright (c) 2016, Davy Mitchell. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:simplegamelib/simplegamelib.dart';

Sprite player, dude;

void main() {
  Game game = new Game("My Game", '#surface');

  player = game.createSprite("images/ninjadude.png", 48, 48);

  player
    ..position = new Point(0, 10)
    ..movement = Movements.east;

  dude = game.createSprite("images/ninjadude.png", 48, 48);
  dude..position = new Point(200, 20);

  game.customUpdate = collisionDemo;

  print('starting game...');

  game.start();
}

// Custom detection routine.
void collisionDemo() {
  document.body.style.backgroundColor =
      player.detectCollision(dude) ? "#ffcc00" : "cornflowerblue";
  if (player.x > 333) {
    player.x = -50;
  }
}
