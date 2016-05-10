// Copyright (c) 2016, Davy Mitchell. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:simplegamelib/simplegamelib.dart';

void main() {
  Game game = new Game("My Game", '#surface');
  Sprite player = game.createSprite("images/ninjadude.png", 48, 48);

  player
    ..position = new Point(0, 10)
    ..movement = Movements.east;
  print('starting game...');

  game.start();
}
