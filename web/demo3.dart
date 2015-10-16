// Copyright (c) 2015, Davy Mitchell. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:simplegamelib/simplegamelib.dart';

Sprite player;
Sprite backTree, backTree2;
Sprite foreTree, foreTree2;
Game game = new Game("My Game", '#surface');

void main() {

  backTree = game.createSprite("images/ftree.png",48,48);
  backTree2 = game.createSprite("images/ftree.png",48,48);
  player = game.createSprite("images/ninjadude.png",48,48);
  foreTree = game.createSprite("images/ftree.png",48,48);
  foreTree2 = game.createSprite("images/ftree.png",48,48);

  player
    ..position = new Point(0, 30)
    ..movement = Movements.east;

  backTree.position = new Point(200, 20);
  backTree2.position = new Point(20, 20);

  foreTree.position = new Point(180, 60);
  foreTree2.position = new Point(40, 60);

  game.customUpdate = priorityDemo;
  print('starting game...');

  game.start();
}

void priorityDemo() {
  if (player.x > 333) {
    player.x = -50;
    game.spriteGroup.reverse();
  }
}
