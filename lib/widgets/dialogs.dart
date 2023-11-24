import 'package:flutter/material.dart';
import 'package:dice_and_tiles/resources/icons.dart';

AlertDialog dialogWrongCredentials(BuildContext context) {
  return AlertDialog(
    icon: iconError,
    title: const Text('Błędne dane'),
    content: const Text(
        'Wprowadzone przez Ciebie dane nie pasują do żadnego konta w naszej bazie. Podaj poprawny login i hasło'),
    actions: [
      FilledButton(
          onPressed: () => Navigator.pop(context, 'Okej'),
          child: const Text('Okej'))
    ],
  );
}

AlertDialog dialogCancelRegistration(BuildContext context) {
  return AlertDialog(
    icon: iconError,
    title: const Text('Przerwanie rejestracji'),
    content: const Text(
        'Czy na pewno chcesz przerwać proces rejestracji? Wprowadzone dane nie zostaną zapisane.'),
    actions: [
      OutlinedButton(
        onPressed: () =>
            Navigator.of(context).popUntil((route) => route.isFirst),
        child: const Text('Tak'),
      ),
      FilledButton(
        onPressed: () => Navigator.pop(context, 'Nie'),
        child: const Text('Nie'),
      ),
    ],
  );
}
