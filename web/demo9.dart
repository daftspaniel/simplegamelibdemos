import 'dart:html';
import 'package:simplegamelib/simplegamelib.dart';

Sprite player;
SpriteGroup fireballs = new SpriteGroup();
Game game = new Game("My Game", '#surface');

void main() {
  player = game.createSprite('images/ninjadude.png', 48, 48);
  player
    ..setDyingImage('images/deaddude.png')
    ..cyclesToDie = 1000;
  for (int i = 0; i < 5; i++) {
    var fireball = game.createSprite('images/fireball.png', 24, 24);
    fireball
      ..movement = Movements.west
      ..x = 290 + i * 100
      ..y = 60
      ..speed = 3;
    fireballs.add(fireball);
  }

  game
    ..player.sprite = player
    ..renderer.liveBackground.loadImage('images/background.png')
    ..customUpdate = spriteDying;

  player
    ..position = new Point(10, 30)
    ..movement = new Point(0, 0);

  print('starting game...');
  game.start();
}

void spriteDying() {
  if (player.dying) return;
  List collisions = fireballs.detectCollision(player);

  collisions.forEach((Sprite fireball) {
    fireball.alive = false;
    fireballs.removeDead();
    game.player.sprite.dying = true;
  });
}
