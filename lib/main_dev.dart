import 'package:flutter/material.dart';
import 'package:iyltdsu_voice/flavor_config.dart';

import 'main.dart';

void main() async {
  FlavorConfig flavour = FlavorConfig(flavor: "dev");
  Widget app = await initializeApp(flavour);
  runApp(app);
}
