import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/geometry.dart';
import 'package:geekle_workshop/game.dart';

class ObstacleComponent extends SpriteComponent
    with HasGameRef<GeekleGame>, Hitbox, Collidable {
  late Paint paint;
  final Random _rng = Random();
  double obstacleWidth = 60;

  ObstacleComponent() : super(priority: 3);

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite('tower.png');
    addShape(HitboxRectangle());

    final gameSize = gameRef.size;
    final isBottom = _rng.nextBool();
    double yPosition = 0;
    double obstacleHeight = _rng.nextInt(gameSize.y ~/ 1.5).toDouble();
    if (isBottom) {
      yPosition = gameSize.y - obstacleHeight;
    } else {
      renderFlipY = true;
    }
    position = Vector2(gameSize.x + obstacleWidth, yPosition);
    size = Vector2(obstacleWidth, obstacleHeight);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= gameRef.obstacleSpeed * dt;
    if (position.x + size.x < 0) {
      remove();
    }
  }
}
