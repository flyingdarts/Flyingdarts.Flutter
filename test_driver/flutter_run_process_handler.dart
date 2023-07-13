import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:gherkin/gherkin.dart';

class FlutterRunProcessHandler extends ProcessHandler {
  static const String FAIL_COLOR = "\u001b[33;31m"; // red
  static const String RESET_COLOR = "\u001b[33;0m";

  static final RegExp _observatoryDebuggerUriRegex = RegExp(r"observatory debugger .*[:]? (http[s]?:.*\/).*", caseSensitive: false, multiLine: false);

  static final RegExp _noConnectedDeviceRegex = RegExp(r"no connected device", caseSensitive: false, multiLine: false);

  static final RegExp _restartedApplicationSuccessRegex = RegExp(r"Restarted application (.*)ms.", caseSensitive: false, multiLine: false);

  late Process? _runningProcess;
  late Stream<String> _processStdoutStream;
  final List<StreamSubscription> _openSubscriptions = <StreamSubscription>[];
  late String _workingDirectory;
  late String _appTarget;
  bool _buildApp = true;
  late String _buildFlavor;
  late String _deviceTargetId;

  void setApplicationTargetFile(String targetPath) {
    _appTarget = targetPath;
  }

  void setWorkingDirectory(String workingDirectory) {
    _workingDirectory = workingDirectory;
  }

  void setBuildFlavor(String buildFlavor) {
    _buildFlavor = buildFlavor;
  }

  void setDeviceTargetId(String deviceTargetId) {
    _deviceTargetId = deviceTargetId;
  }

  void setBuildRequired(bool build) {
    _buildApp = build;
  }

  @override
  Future<void> run() async {
    final arguments = ["run", "--target=$_appTarget"];

    if (_buildApp == false) {
      arguments.add("--no-build");
    }

    if (_buildFlavor.isNotEmpty) {
      arguments.add("--flavor=$_buildFlavor");
    }

    if (_deviceTargetId.isNotEmpty) {
      arguments.add("--device-id=$_deviceTargetId");
    }

    _runningProcess = await Process.start("flutter", arguments, workingDirectory: _workingDirectory, runInShell: true);
    _processStdoutStream = _runningProcess!.stdout.transform(utf8.decoder).asBroadcastStream();

    _openSubscriptions.add(_runningProcess!.stderr.listen((events) {
      stderr.writeln("${FAIL_COLOR}Flutter run error: ${String.fromCharCodes(events)}$RESET_COLOR");
    }));
  }

  @override
  Future<int> terminate() async {
    int exitCode = -1;
    _ensureRunningProcess();
    if (_runningProcess != null) {
      _runningProcess?.stdin.write("q");
      _openSubscriptions.forEach((s) => s.cancel());
      _openSubscriptions.clear();
      exitCode = await _runningProcess!.exitCode;
      _runningProcess = null;
    }

    return exitCode;
  }

  Future restart() async {
    _ensureRunningProcess();
    _runningProcess!.stdin.write("R");
    return _waitForStdOutMessage(_restartedApplicationSuccessRegex, "Timeout waiting for app restart");
  }

  Future<String> waitForObservatoryDebuggerUri() => _waitForStdOutMessage(_observatoryDebuggerUriRegex, "Timeout while waiting for observatory debugger uri");

  Future<String> _waitForStdOutMessage(RegExp matcher, String timeoutMessage, [Duration timeout = const Duration(seconds: 90)]) {
    _ensureRunningProcess();
    final completer = Completer<String>();
    late StreamSubscription sub;
    sub = _processStdoutStream.timeout(timeout, onTimeout: (_) {
      sub.cancel();
      if (!completer.isCompleted) {
        completer.completeError(TimeoutException(timeoutMessage, timeout));
      }
    }).listen((logLine) {
      // stdout.write(logLine);
      if (matcher.hasMatch(logLine)) {
        sub?.cancel();
        if (!completer.isCompleted) {
          completer.complete(matcher.firstMatch(logLine)!.group(1));
        }
      } else if (_noConnectedDeviceRegex.hasMatch(logLine)) {
        sub?.cancel();
        if (!completer.isCompleted) {
          stderr.writeln("${FAIL_COLOR}No connected devices found to run app on and tests against$RESET_COLOR");
        }
      }
    }, cancelOnError: true);

    return completer.future;
  }

  void _ensureRunningProcess() {
    if (_runningProcess == null) {
      throw Exception("FlutterRunProcessHandler: flutter run process is not active");
    }
  }
}
