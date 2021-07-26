import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:geekle_workshop/game.dart';

class BackgroundComponent extends ParallaxComponent
    with HasGameRef<GeekleGame> {
  BackgroundComponent() : super(priority: -1);

  @override
  Future<void> onLoad() async {
    parallax = await gameRef.loadParallax(
      [
        ParallaxImageData('parallax/sky.png'),
        ParallaxImageData('parallax/mountains-far.png'),
        ParallaxImageData('parallax/mountains-near.png'),
        ParallaxImageData('parallax/trees-far.png'),
        ParallaxImageData('parallax/trees-near.png'),
      ],
      baseVelocity: Vector2(20, 0),
      velocityMultiplierDelta: Vector2(1.8, 1.0),
    );
  }
}
