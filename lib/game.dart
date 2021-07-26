import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';

import 'player.dart';

class GeekleGame extends BaseGame with TapDetector {
  late PlayerComponent player;

  @override
  Future<void> onLoad() async {
    final sprite = await Sprite.load('ember.png');
    final playerSize = Vector2.all(64.0);

    // [size] used here is the size of the game
    final playerPosition = Vector2(playerSize.x * 2, size.y / 2);
    player = PlayerComponent(
      position: playerPosition,
      size: playerSize,
      sprite: sprite,
    );

    // Add all your initial components to the game
    add(player);
  }

  @override
  void onTapUp(TapUpInfo info) {
    player.bounce();
  }

  @override
  void update(double dt) {
    super.update(dt);
    // TODO: dt is the time passed (in seconds) since the last time update ran.
    // Here you want to add obstacles or enemies when you think enough time has
    // passed or at random.
  }
}
