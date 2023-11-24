import 'package:dice_and_tiles/dependecies.dart';
import 'register_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBarBack('Profil', context),
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
              child: textFieldObscured('Hasło'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 4),
              child: FilledButton(
                onPressed: () => print('Login user'),
                child: const Text('Zaloguj'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterScreen()),
                  );
                },
                child: const Text('Rejestruj'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
