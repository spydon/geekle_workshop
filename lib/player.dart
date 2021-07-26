import 'package:flame/components.dart';

class PlayerComponent extends SpriteComponent {
  PlayerComponent({
    required Vector2 position,
    required Vector2 size,
    required Sprite sprite,
  }) : super(position: position, size: size, sprite: sprite) {
    // A centered anchor means that the position is defined from the center of
    // the component instead of from top left which is the default.
    anchor = Anchor.center;
  }

  /// This is called when the game is tapped.
  /// You could either use a [MoveEffect] here to create some movement, or just
  /// modify [position] directly.
  void bounce() {
    // TODO: React to input
  }
}
