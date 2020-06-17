enum PasswordSecurity {
  length,
  uppercase,
  lowercase,
  specialCharacter,
  number,
  ok
}

PasswordSecurity isPasswordSecure(String password) {
  if (password.length < 8) return PasswordSecurity.length;
  if (!RegExp(r'[A-Z]').hasMatch(password)) return PasswordSecurity.uppercase;
  if (!RegExp(r'[a-z]').hasMatch(password)) return PasswordSecurity.lowercase;
  if (!RegExp(r'[0-9]').hasMatch(password)) return PasswordSecurity.number;
  if (!RegExp(r'''[!"§$%&\/()=?*'+#\-:;.,@€{}\[\]<>|']''').hasMatch(password)) {
    return PasswordSecurity.specialCharacter;
  }
  return PasswordSecurity.ok;
}

extension PasswordSecurityX on PasswordSecurity {
  String message() {
    switch (this) {
      case PasswordSecurity.length:
        return 'Passwort ist zu kurz';
      case PasswordSecurity.uppercase:
        return 'Passwort muss Großbuchstaben enthalten';
      case PasswordSecurity.lowercase:
        return 'Passwort muss Kleinbuchstaben enthalten';
      case PasswordSecurity.specialCharacter:
        return 'Passwort muss Sonderzeichen enthalten';
      case PasswordSecurity.number:
        return 'Passwort muss Zahlen enthalten';
      default:
        return null;
    }
  }
}

bool isValidEmail(String email) => RegExp(
        r'''(?:[a-z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+\/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])''')
    .hasMatch(email);
