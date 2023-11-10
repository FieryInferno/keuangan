class User {
  final String _pin = '336699';
  final String _password = 'password';

  bool loginByPin(pin) => pin == _pin;
  bool loginByPassword(password) => password == _password;
}
