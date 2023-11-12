import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class User {
  final String _pin = '336699';
  final String _password = 'password';

  bool loginByPin(pin) => pin == _pin;
  bool loginByPassword(password) => password == _password;
  Future<void> forgotPassword() async {
    String email = 'setiapermanabagas@gmail.com';
    final smtpServer = gmail(email, 'oqep yqtn ejxg atao');
    final message = Message()
      ..from = Address(email, 'Aplikasi Keuangan')
      ..recipients.add('bagassetia271@gmail.com')
      ..subject = 'Lupa Password'
      ..html = "<ul><li>Pin: 336699</li><li>Password: password</li></ul>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }
}
