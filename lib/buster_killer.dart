import 'dart:async';
import 'dart:ui';

import 'package:buster_killer/actors/player.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:buster_killer/levels/level.dart';

class BusterKiller extends FlameGame
    with HasKeyboardHandlerComponents, DragCallbacks {
  @override
  Color backgroundColor() => const Color(0xFF211F30);
  late final CameraComponent cam;

  Player player = Player(character: "Mask Dude");
  late JoystickComponent joystick;
  @override
  FutureOr<void> onLoad() async {
    // Load all images  into memory
    await images.loadAllImages();
    final world = Level(player: player, lvlName: "Level-02");
    cam = CameraComponent.withFixedResolution(
        world: world, width: 640, height: 360);
    cam.viewfinder.anchor = Anchor.topLeft;
    addAll([cam, world]);

    return super.onLoad();
  }

  void addJoystick() {
    joystick = JoystickComponent();
  }
}
