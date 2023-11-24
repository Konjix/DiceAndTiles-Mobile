import 'package:dice_and_tiles/dependecies.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBarRegister(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 32, right: 32, top: 8, bottom: 8),
              child: textField('Login'),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 32, right: 32, top: 8, bottom: 8),
              child: textField('Adres e-mail'),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 32, right: 32, top: 8, bottom: 8),
              child: textFieldObscured('Hasło'),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 32, right: 32, top: 8, bottom: 8),
              child: textFieldObscured('Powtórz hasło'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 4),
              child: FilledButton(
                onPressed: () => print('Register new user'),
                child: const Text('Rejestruj'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: OutlinedButton(
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) =>
                      dialogCancelRegistration(context),
                ),
                child: const Text('Anuluj'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
