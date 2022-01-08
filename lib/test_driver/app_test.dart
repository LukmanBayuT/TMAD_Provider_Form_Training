import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Provider App', () async {
    final addField = find.byValueKey('addField');
    final addButton = find.byValueKey('addButton');

    FlutterDriver driver;
    driver = await FlutterDriver.connect();

    test('add user', () async {
      await driver.tap(addField);
      await driver.enterText('Nama Saya');
      await driver.tap(addButton);

      await driver.waitFor(find.text('Nama Saya'),
          timeout: const Duration(seconds: 2));
    });
  });
}
