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
    ..player = new Player.withNotifications(updateScorePanel)
    ..player.sprite = player
    ..renderer.liveBackground.loadImage('images/background.png');

  createCollectibles();

  player
    ..position = new Point(0, 30)
    ..movement = new Point(0, 0);

  game.customUpdate = collectibleDemo;

  print('starting game...');
  game.setUpKeys();
  updateScorePanel(game.player);
  game.start();
}

void collectibleDemo() {
  List<Sprite> pickUps = game.collectiblesGroup.detectCollision(player);

  pickUps.forEach((Sprite pickup) {
    pickup.alive = false;
    game.collectiblesGroup.removeDead();
    sounds.play("test");
    game.player.apply(pickup);
  });
}

void createCollectibles() {
  Collectible heart = new Collectible.fromFilename('images/heart.png', 24, 24);
  heart
    ..position = new Point(100, 100)
    ..healthDelta = 15;

  game.collectiblesGroup.add(heart);

  Collectible diamond =
      new Collectible.fromFilename('images/diamond.png', 24, 24);
  diamond
    ..position = new Point(175, 100)
    ..scoreDelta = 1000;

  game.collectiblesGroup.add(diamond);
}

void updateScorePanel(Player p1) {
  DivElement statusPanel = querySelector("#gameStatus");
  statusPanel.innerHtml =
      "Health : ${p1.health}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Score : ${p1.score}";
}
