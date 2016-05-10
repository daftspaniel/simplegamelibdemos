// Copyright (c) 2016, Davy Mitchell. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:simplegamelib/simplegamelib.dart';

Sprite player, wall;

void main() {
  Game game = new Game("My Game", '#surface');
  SpriteGroup walls = new SpriteGroup();
  player = game.createSprite("images/ninjadude.png", 48, 48);
  wall = game.createSprite("images/brick.png", 100, 100);

  game.player.sprite = player;
  walls.canvas = player.canvas;
  walls.add(wall);

  player
    ..position = new Point(0, 10)
    ..movement = Movements.none
    ..speed = 3
    ..obstacles = walls;

  wall..position = new Point(150, 0);

  print('starting game...');
  game
    ..setUpKeys()
    ..start();
}
