import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:geekle_workshop/obstacle.dart';

import 'background.dart';
import 'player.dart';

class GeekleGame extends BaseGame with TapDetector, HasCollidables {
  late PlayerComponent player;
  late TextComponent scoreText;
  final initialScoreText = 'Score: ';
  double obstacleSpeed = 500.0;
  double timeSinceObstacle = 0.0;
  double timePassed = 0.0;

  @override
  Future<void> onLoad() async {
    addInitialComponents();
  }

  @override
  void onTapUp(TapUpInfo info) {
    player.bounce();
  }

  @override
  void update(double dt) {
    super.update(dt);
    timeSinceObstacle += dt;
    timePassed += dt;
    if (timeSinceObstacle > max(10.0 - timePassed / 10, 0.5)) {
      add(ObstacleComponent());
      timeSinceObstacle = 0;
    }
    scoreText.text = '$initialScoreText${timePassed.toInt()}';
  }

  void addInitialComponents() {
    player = PlayerComponent();
    scoreText = TextComponent(initialScoreText, position: Vector2.all(20));
    add(BackgroundComponent());
    add(player);
    add(ScreenCollidable());
    add(scoreText);
  }

  void restart() {
    timePassed = 0;
    timeSinceObstacle = 0;
    components.clear();
    addInitialComponents();
  }
}
