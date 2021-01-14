import 'package:flutter_test/flutter_test.dart';
import 'package:LMS_application/Widgets/auth/auth_form.dart';

void main() {
  test('title', () {
    //setup
    //run
    //verify
  });
  test('empty mail returns error string', () {
    var result = EmailFieldValidator.validate('');
    expect(result, 'Please enter a valid email address.');
  });
  test('Valid Email Should return null', () {
    var result = EmailFieldValidator.validate('mostafasharnoby@gmail.com');
    expect(result, null);
  });
  test('empty password should return error', () {
    var result = PasswordFieldValidator.validate('');
    expect(result, 'Password must be at least 6 characters long.');
  });
  test('right password should return null', () {
    var result = PasswordFieldValidator.validate('123456');
    expect(result, null);
  });
}
