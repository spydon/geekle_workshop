import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/animation.dart';

class PlayerComponent extends SpriteComponent {
  static const double downSpeed = 200.0;

  PlayerComponent({
    required Vector2 position,
    required Vector2 size,
    required Sprite sprite,
  }) : super(position: position, size: size, sprite: sprite) {
    // A centered anchor means that the position is defined from the center of
    // the component instead of from top left which is the default.
    anchor = Anchor.center;
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
      path: [Vector2(0, -60.0)],
      speed: 300,
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
}
