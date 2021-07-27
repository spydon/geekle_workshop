import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/geometry.dart';
import 'package:flutter/animation.dart';
import 'package:geekle_workshop/game.dart';

class PlayerComponent extends SpriteAnimationComponent
    with HasGameRef<GeekleGame>, Hitbox, Collidable {
  static const double downSpeed = 500.0;

  PlayerComponent() : super(size: Vector2.all(64)) {
    // A centered anchor means that the position is defined from the center of
    // the component instead of from top left which is the default.
    anchor = Anchor.center;
    addShape(HitboxCircle());
  }

  @override
  Future<void> onLoad() async {
    position = Vector2(size.x * 2, gameRef.size.y / 2);
    animation = await gameRef.loadSpriteAnimation(
      'ember_animated.png',
      SpriteAnimationData.sequenced(
        amount: 3,
        textureSize: Vector2.all(16),
        stepTime: 0.15,
      ),
    );
  }

  MoveEffect? _currentEffect;

  /// This is called when the game is tapped.
  /// You could either use a [MoveEffect] here to create some movement, or just
  /// modify [position] directly.
  void bounce() {
    if (_currentEffect != null) {
      removeEffect(_currentEffect!);
    }
    _currentEffect = MoveEffect(
      path: [Vector2(0, -100.0)],
      speed: 600,
      curve: Curves.ease,
      isRelative: true,
      isAlternating: true,
    );
    addEffect(_currentEffect!);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (effects.isEmpty) {
      position.y += dt * downSpeed;
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    super.onCollision(intersectionPoints, other);
    gameRef.restart();
  }
}
