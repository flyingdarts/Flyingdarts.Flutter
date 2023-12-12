import 'package:flutter/material.dart';
import 'package:Flyingdarts/flavor_config.dart';

import 'main.dart';

void main() async {
  FlavorConfig flavour = FlavorConfig(flavor: "prod");
  Widget app = await initializeApp(flavour);
  runApp(app);
}
