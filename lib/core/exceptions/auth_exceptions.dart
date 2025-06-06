abstract class SignInExceptions implements Exception {
  const SignInExceptions(this.message);

  final String message;

  @override
  String toString() => message;
}

class InvalidCredentialsException extends SignInExceptions {
  const InvalidCredentialsException(super.message);
}

class AuthException extends SignInExceptions {
  const AuthException(super.message);
}
