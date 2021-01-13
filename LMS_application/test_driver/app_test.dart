import 'package:flutter/material.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('LMS App', () {
    //login screen
    final usernameField = find.byValueKey('email');
    final passwordField = find.byValueKey('Password');
    final signInButton = find.byType('RaisedButton');

    FlutterDriver driver;
    Future<bool> isPresent(SerializableFinder byValueKey,
        {Duration timeout = const Duration(seconds: 1)}) async {
      try {
        await driver.waitFor(byValueKey, timeout: timeout);
        return true;
      } catch (exception) {
        return false;
      }
    }

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('login for student', () async {
      await driver.tap(usernameField);
      await driver.enterText("mostafasharnoby@gmail.com");

      await driver.tap(passwordField);
      await driver.enterText("123456");

      await driver.tap(signInButton);
      await driver.waitFor(find.text("My Courses"));
    });


  });
}
