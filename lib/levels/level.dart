import 'dart:async';

import 'package:buster_killer/actors/player.dart';
import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';

class Level extends World {
  final String lvlName;
  Level({required this.lvlName, required this.player});
  Player player;

  late TiledComponent level;
  @override
  FutureOr<void> onLoad() async {
    level = await TiledComponent.load("$lvlName.tmx", Vector2.all(16));
    add(level);
    final spawnPointsPlayer =
        level.tileMap.getLayer<ObjectGroup>("Spawnpoints");
    for (final spawnPoint in spawnPointsPlayer!.objects) {
      switch (spawnPoint.class_) {
        case "Player":
          player.position = Vector2(spawnPoint.x, spawnPoint.y);
          add(player);
          break;
      }
    }
    return super.onLoad();
  }
}
