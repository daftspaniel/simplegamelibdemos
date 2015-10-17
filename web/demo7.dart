// Copyright (c) 2015, Davy Mitchell. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:simplegamelib/simplegamelib.dart';

Sprite player, wall;

void main() {
  Game game = new Game("My Game", '#surface');
  SpriteGroup walls = new SpriteGroup();
  walls.add(wall);
  player.obstacles = walls;
  player = game.createSprite("images/ninjadude.png", 48, 48);
  wall = game.createSprite("images/brick.png", 100, 100);

  player
    ..position = new Point(0, 10)
    ..movement = Movements.east
    ..speed = 2;

  wall..position = new Point(200, 0);

  print('starting game...');

  game.start();
}
