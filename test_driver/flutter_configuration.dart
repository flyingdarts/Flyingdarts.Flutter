import 'dart:io';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_gherkin/src/flutter/hooks/app_runner_hook.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:gherkin/gherkin.dart';

class FlutterTestConfiguration extends TestConfiguration {
  late String _observatoryDebuggerUri;

  /// restarts the application under test between each scenario.
  /// Defaults to true to avoid the application being in an invalid state
  /// before each test
  bool restartAppBetweenScenarios = true;

  /// The target app to run the tests against
  /// Defaults to "lib/test_driver/app.dart"
  String targetAppPath = "lib/test_driver/app.dart";

  /// The build flavor to run the tests against
  /// Defaults to empty
  String buildFlavor = "";

  /// If the application should be built prior to running the tests
  /// Defaults to true
  bool build = true;

  /// The target device id to run the tests against when multiple devices detected
  /// Defaults to empty
  String targetDeviceId = "";

  void setObservatoryDebuggerUri(String uri) => _observatoryDebuggerUri = uri;

  Future<FlutterDriver> createFlutterDriver([String? dartVmServiceUrl]) async {
    dartVmServiceUrl = (dartVmServiceUrl ?? _observatoryDebuggerUri) ?? Platform.environment['VM_SERVICE_URL'];

    return await FlutterDriver.connect(dartVmServiceUrl: dartVmServiceUrl, logCommunicationToFile: false, printCommunication: false);
  }

  Future<FlutterWorld> createFlutterWorld(TestConfiguration config, FlutterWorld world) async {
    world = world;
    final driver = await createFlutterDriver();
    world.setFlutterDriver(driver);
    return world;
  }

  @override
  void prepare() {
    final providedCreateWorld = createWorld;
    createWorld = (config) async {
      FlutterWorld? world;
      if (providedCreateWorld != null) {
        world = (await providedCreateWorld(config)) as FlutterWorld?;
      }

      return await createFlutterWorld(config, world!);
    };

    hooks = List.from(hooks as Iterable<dynamic>)..add(FlutterAppRunnerHook());
    stepDefinitions = List.from(stepDefinitions as Iterable<dynamic>)..addAll([ThenExpectElementToHaveValue(), WhenTapWidget(), GivenOpenDrawer(), WhenPauseStep(), WhenFillFieldStep()]);
  }
}
