// Copyright (c) 2016, Davy Mitchell. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:simplegamelib/simplegamelib.dart';

Sprite player, dude;

void main() {
  Game game = new Game("My Game", '#surface');

  player = game.createSprite("images/ninjadude.png", 48, 48);
  dude = game.createSprite("images/ninjadude.png", 48, 48);

  player
    ..position = new Point(0, 10)
    ..movement = Movements.east
    ..speed = 3;

  dude
    ..position = new Point(10, 10)
    ..movement = new Point(1, 1)
    ..limits = new Rectangle(0, 0, 133, 133);

  print('starting game...');

  game.start();
}
