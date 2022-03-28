import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dynamic_bottom_drawer/dynamic_bottom_drawer.dart';

void main() {
  const MethodChannel channel = MethodChannel('dynamic_bottom_drawer');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await DynamicBottomDrawer.platformVersion, '42');
  });
}
