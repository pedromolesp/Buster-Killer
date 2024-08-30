import 'package:buster_killer/buster_killer.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setLandscape();
  BusterKiller game = BusterKiller();
  runApp(GameWidget(game: kDebugMode ? BusterKiller() : game));
}
