//import 'package:LMS_application/Screens/Student/Student_Drawer.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('LMS App', () {
    //login screen
    final usernameField = find.byValueKey('email');
    final passwordField = find.byValueKey('Password');
    final signInButton = find.byType('RaisedButton');
    final courseButton = find.byValueKey('courseButton');

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
    test('login for teacher', () async {
      await driver.tap(usernameField);
      await driver.enterText("ahmedessam@gmail.com");
      await driver.tap(passwordField);
      await driver.enterText("123456");
      await driver.tap(signInButton);
      await driver.waitFor(find.text("My Courses"));
    });
    test('login for student open the drawer, and enter Info', () async {
      await driver.tap(usernameField);
      await driver.enterText("mostafasharnoby@gmail.com");
      await driver.tap(passwordField);
      await driver.enterText("123456");
      await driver.tap(signInButton);
      await driver.tap(find.text("My Courses"));
      final SerializableFinder drawerOpenButton =
          find.byTooltip('Open navigation menu');
      await driver.tap(drawerOpenButton);
      final text = find.text('Info');
      await driver.tap(text);
    });
    test('login for student open the drawer, and enter Available Courses',
        () async {
      await driver.tap(usernameField);
      await driver.enterText("mostafasharnoby@gmail.com");
      await driver.tap(passwordField);
      await driver.enterText("123456");
      await driver.tap(signInButton);
      await driver.tap(find.text("My Courses"));
      final SerializableFinder drawerOpenButton =
          find.byTooltip('Open navigation menu');
      await driver.tap(drawerOpenButton);
      final text = find.text('Available Courses');
      await driver.tap(text);
    });
    test(
        'login for student open the main drawer,and enter my courses then open my courses drawer then select Materials',
        () async {
      await driver.tap(usernameField);
      await driver.enterText("ayahatef@gmail.com");
      await driver.tap(passwordField);
      await driver.enterText("123456");
      await driver.tap(signInButton);
      await driver.tap(courseButton);
      final SerializableFinder drawerOpenButton2 =
          find.byTooltip('Open navigation menu');
      await driver.tap(drawerOpenButton2);
      final text2 = find.text('Materials');
      await driver.tap(text2);
    });
    test(
        'login for student open the main drawer,and enter my courses then open my courses drawer then select officeHours',
        () async {
      await driver.tap(usernameField);
      await driver.enterText("ayahatef@gmail.com");
      await driver.tap(passwordField);
      await driver.enterText("123456");
      await driver.tap(signInButton);
      await driver.tap(courseButton);
      final SerializableFinder drawerOpenButton2 =
          find.byTooltip('Open navigation menu');
      await driver.tap(drawerOpenButton2);
      final text2 = find.text('officeHours');
      await driver.tap(text2);
    });
    test(
        'login for student open the main drawer,and enter my courses then open my courses drawer then select Discussion',
        () async {
      await driver.tap(usernameField);
      await driver.enterText("ayahatef@gmail.com");
      await driver.tap(passwordField);
      await driver.enterText("123456");
      await driver.tap(signInButton);
      await driver.tap(courseButton);
      final SerializableFinder drawerOpenButton2 =
          find.byTooltip('Open navigation menu');
      await driver.tap(drawerOpenButton2);
      final text2 = find.text('Discussion');
      await driver.tap(text2);
    });
    test(
        'login for student open the main drawer,and enter my courses then open my courses drawer then select Library',
        () async {
      await driver.tap(usernameField);
      await driver.enterText("ayahatef@gmail.com");
      await driver.tap(passwordField);
      await driver.enterText("123456");
      await driver.tap(signInButton);
      await driver.tap(courseButton);
      final SerializableFinder drawerOpenButton2 =
          find.byTooltip('Open navigation menu');
      await driver.tap(drawerOpenButton2);
      final text2 = find.text('Library');
      await driver.tap(text2);
    });
    test(
        'login for student open the main drawer,and enter my courses then open my courses drawer then select Trainings',
        () async {
      await driver.tap(usernameField);
      await driver.enterText("ayahatef@gmail.com");
      await driver.tap(passwordField);
      await driver.enterText("123456");
      await driver.tap(signInButton);
      await driver.tap(courseButton);
      final SerializableFinder drawerOpenButton2 =
          find.byTooltip('Open navigation menu');
      await driver.tap(drawerOpenButton2);
      final text2 = find.text('Trainings');
      await driver.tap(text2);
    });
    test(
        'login for student open the main drawer,and enter my courses then open my courses drawer then select LogOut',
        () async {
      await driver.tap(usernameField);
      await driver.enterText("ayahatef@gmail.com");
      await driver.tap(passwordField);
      await driver.enterText("123456");
      await driver.tap(signInButton);
      await driver.tap(courseButton);
      final SerializableFinder drawerOpenButton2 =
          find.byTooltip('Open navigation menu');
      await driver.tap(drawerOpenButton2);
      final text2 = find.text('LogOut');
      await driver.tap(text2);
    });

    test(
        'login for student open the main drawer,and enter my courses then open my courses drawer then select Assignments',
        () async {
      await driver.tap(usernameField);
      await driver.enterText("ayahatef@gmail.com");
      await driver.tap(passwordField);
      await driver.enterText("123456");
      await driver.tap(signInButton);
      await driver.tap(courseButton);
      final SerializableFinder drawerOpenButton2 =
          find.byTooltip('Open navigation menu');
      await driver.tap(drawerOpenButton2);
      final text2 = find.text('Assignments');
      await driver.tap(text2);
    });
    test(
        'login for student open the main drawer,and enter my courses then open my courses drawer then select Announcements',
        () async {
      await driver.tap(usernameField);
      await driver.enterText("ayahatef@gmail.com");
      await driver.tap(passwordField);
      await driver.enterText("123456");
      await driver.tap(signInButton);
      await driver.tap(courseButton);
      final SerializableFinder drawerOpenButton2 =
          find.byTooltip('Open navigation menu');
      await driver.tap(drawerOpenButton2);
      final text2 = find.text('Announcements');
      await driver.tap(text2);
    });
    test(
        'login for student open the main drawer,and enter my courses then open my courses drawer then select Quizzes',
        () async {
      await driver.tap(usernameField);
      await driver.enterText("ayahatef@gmail.com");
      await driver.tap(passwordField);
      await driver.enterText("123456");
      await driver.tap(signInButton);
      await driver.tap(courseButton);
      final SerializableFinder drawerOpenButton2 =
          find.byTooltip('Open navigation menu');
      await driver.tap(drawerOpenButton2);
      final text2 = find.text('Quizzes');
      await driver.tap(text2);
    });
  });
}
