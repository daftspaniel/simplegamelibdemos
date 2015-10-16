// Copyright (c) 2015, Davy Mitchell. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:simplegamelib/simplegamelib.dart';

Sprite player;
Game game = new Game("My Game", '#surface');

void main() {
  player = game.createSprite("images/ninjadude.png",48,48);
  game.player.sprite = player;

  player
    ..position = new Point(0, 30)
    ..movement = new Point(0, 0);

  print('starting game...');
  game.setUpKeys();
  game.start();
}
