import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zsh_demo/zsh_demo.dart';

void main() {
  const MethodChannel channel = MethodChannel('zsh_demo');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

}
