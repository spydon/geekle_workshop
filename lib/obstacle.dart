import 'package:flame/components.dart';
import 'package:flame/extensions.dart';

class ObstacleComponent extends PositionComponent {
  ObstacleComponent(Vector2 position, Vector2 size)
      : super(
          position: position,
          size: size,
        );

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    // TODO: Draw a rectangle on the screen
  }
}
